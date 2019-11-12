<?php

namespace App\Helper;

use Illuminate\Contracts\Validation\Validator;

use App\Http\Requests\Tasks\StoreTask;
use App\Notifications\NewClientTask;
use App\Notifications\NewTask;
use App\Notifications\TaskCompleted;
use App\Notifications\TaskReminder;
use App\Notifications\TaskUpdated;
use App\Notifications\TaskUpdatedClient;
use App\Project;
use App\ProjectMember;
use App\Task;

use App\TaskboardColumn;
use App\SubTask;
use App\TaskCategory;
use App\Traits\ProjectProgress;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;
use Session;
use App\ViewArray;
class Task_builder{
    
    public static function sub_id_finder($task_id){
     //   print_r($tasks);
        $subs=SubTask::where('task_id',$task_id)->get();
        $sub_id=array();
        if($subs){
            foreach($subs as $sub){
            array_push($sub_id,$sub->id);
            }
        }
        
       // print_r($sub_id);
        return $sub_id;
    }
    public static function task_id_finder($tasks){
        $tas=array();
        foreach($tasks as $task){
            array_push($tas,$task->id);
        }
        return $tas;
    }
    public static function get_total_array($tasks,$order_by='asc',$searcher='no'){
       
        $array=array();
        $current = Auth::user();
        $arr = ViewArray::where('user_id', $current->id)->where('role', 'admin')->first();    
        $tasks_arr = Task_builder::task_id_finder($tasks);
      //  print_r($tasks_arr);
        if($arr->group_by_table=='projects'){
            $task_array=array();
            $null_fields=DB::table('tasks')->leftJoin('projects', 'projects.id', '=', 'tasks.project_id')
                                            ->whereIn('tasks.id', $tasks_arr)
                                            ->whereNull('projects.' . $arr->group_by_column)
                                            ->select('tasks.id')
                                            ->orderBy('tasks.' . $arr->order_by_column, $order_by)
                                            ->get()
                                            ->groupBy('projects.' . $arr->group_by_column)
                                            ->toArray();
                                           
          // print_r($null_fields);                                
            
            $get_task = DB::table('tasks')->leftJoin('projects', 'projects.id', '=', 'tasks.project_id')
                ->whereNotNull('projects.' . $arr->group_by_column)
                ->whereIn('tasks.id', $tasks_arr)
                ->select('tasks.id')
                ->get()
                ->groupBy('projects.'.$arr->group_by_column)
                ->toArray();
            // print_r($get_task);    
                foreach($get_task as $t){
                    foreach($t as $temtask){
                        array_push($task_array,$temtask->id);
                    }
                }
                foreach($null_fields as $m){
                    foreach($m as $temtask2){
                        array_push($task_array,$temtask2->id);
                    }
                }
              //  print_r($task_array);
              foreach($task_array as $item){
                  $array[$item]=Task_builder::sub_id_finder($item);
              }
        }
        elseif($arr->group_by_table=='tasks'){  
                $null_fields=DB::table('tasks')->whereNull($arr->group_by_column)->whereIn('id',$tasks_arr);
                $get_task=DB::table('tasks')  
                        ->union($null_fields)            
                        ->whereIn('id',$tasks_arr)                        
                        ->orderBy($arr->order_by_column,$order_by)
                        
                        ->get()
                        ->groupBy($arr->group_by_column);
            if($get_task){
                foreach($get_task as $t){
                    foreach($t as $task){
                        $array[$task->id] = Task_builder::sub_id_finder($task->id);
                    }
                }
            }
        }
        elseif($arr->group_by_table== 'taskboard_columns'){
              $get_task=DB::table('tasks')->leftJoin('taskboard_columns', 'taskboard_columns.id', '=', 'tasks.board_column_id')
                                        ->whereIn('tasks.id',$tasks_arr)
                                        ->orderBy('tasks.'.$arr->order_by_column,$order_by)
                                        ->select('tasks.id')
                                        ->get()
                                        ->groupBy($arr->group_by_column);
           // print_r($get_task);
            if ($get_task) {
                foreach ($get_task as $t) {
                    foreach ($t as $task) {
                        $array[$task->id] = Task_builder::sub_id_finder($task->id);
                    }
                }
            }
        }else{

        }
        $ses_arr = json_encode($array);
       // print_r($ses_arr);
        $put_data_in_session=Session::get('put_data_session');
        if($put_data_in_session=='true' ){
            Session::put('view_array',$ses_arr);
            Session::put('put_data_session','false');
            //Session::put('task_id_formated', 'no');
            if ($arr) {
                $arr->array = json_encode($array);
                $arr->save();
               // print_r($tasks);
            } else {
                $v = new ViewArray;
                $v->user_id = $current->id;
                $v->role = 'admin';
                $v->array = json_encode($array);
                $v->save();
            }
        }
        else{
            Session::put('view_array', $ses_arr);
        }

        if($searcher== 'searcher'){

            Session::put('view_array', $ses_arr);

        }
        
        return $array;

    }
    public static function get_group_by_table_info($group_id){
        $table='tasks';
        $col='heading';
        if($group_id== 'projects_name' || $group_id== 'project_phase' || $group_id== 'client'){
            if($group_id== 'projects_name'){
                $col='project_name';
            }
            if($group_id== 'project_phase'){
                $col='project_phase';
            }
            if($group_id== 'client'){
                $col='client_id';
            }
            $table='projects';
        }
        elseif($group_id== 'assignee'){
           
        }
        elseif($group_id== 'status'){
            $col='column_name';
            $table= 'taskboard_columns';
        }
        else{
            if($group_id== 'start_date'){
                $col= 'start_date';
            }
            if($group_id== 'task_name'){
                $col= 'heading';
            }
            if($group_id== 'section'){
                $col= 'section_tiles';
            }
            if($group_id== 'due_date'){
                $col= 'due_date';
            }
            if($group_id== 'tag'){
                $col= 'tag';
            }
            if($group_id== 'priority'){
                $col= 'priority';
            }
            if($group_id== 'task_cat'){
                $col= 'task_category_id';
            }
            $table = 'tasks';
        }
        return ['table'=>$table,'col'=>$col];

    }
    public static function get_group_by($task_id,$group_by_column,$group_by_table){
        $res='';
        if($group_by_table=='projects'){
            $task=Task::find($task_id);
            if($task->project_id!=null){
                $group_name = DB::table('tasks')->join('projects', 'projects.id', '=', 'tasks.project_id')
                    ->where('tasks.id', '=', $task_id)
                    ->select('projects.' . $group_by_column)->first();
                    $res = $group_name->$group_by_column;
            }else{
                $res='No Group';
            }
           
          
          
        }
        if($group_by_table=='tasks'){
            $group_name=DB::table('tasks')
                            ->where('id',$task_id)
                            ->select($group_by_column)->first();
            $res= $group_name->$group_by_column;
        }
        if($group_by_table== 'taskboard_columns'){
            $group_name=DB::table('tasks')->leftJoin('taskboard_columns', 'taskboard_columns.id','=','tasks.board_column_id')
                                            ->where('tasks.id','=',$task_id)
                                            ->select('taskboard_columns.column_name')->take(1)->first();
                                         
            $res = $group_name->$group_by_column;
        }
        if ($res == '') {
            $res = 'No Group';
        }
        return $res;
        return 'hi';
       
    }
}