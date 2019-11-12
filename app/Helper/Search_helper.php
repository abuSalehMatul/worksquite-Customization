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
use App\TaskCategory;
use App\Traits\ProjectProgress;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Helper\Task_builder;
use Illuminate\Support\Facades\DB;
use App\RecurrencePattern;
use App\TaskRecurrencePattern;
use Auth;
use Session;
use App\ViewArray;
class Search_helper{
    public $projects;
    public $tasks;
    public $subtasks;


    public function __construct()
    {
       // $this->view_array();
    }
    public function table($id){
        $table['clientsearcher']='name';
        $table['assigneesearcher']='name';
        $table['projectsearcher']= 'project_name';
        $table['projectphasesearcher']= 'project_phase';
        $table['projectcatsearcher']= 'category_name';
        $table['taskcatsearcher']= 'task_category_id';
        $table['tasksearcher']= 'heading';
        $table['duedatesearcher']='due_date';
        $table['esthoursearcher']= 'est_hour';
        $table['acthoursearcher']= 'act_hour';
        $table['tagsearcher']='tag';
        $table['sectionsearcher']= 'section_tiles';
        $table['createdatsearcher']= 'created_at';
        $table['prioritysearcher']= 'priority';
        $table['enddatesearcher']='tasks';
        $table['startdatesearcher']= 'start_date';
        $table['subtasksearcher']='title';
        $table['statussearcher']='column_name';
        $table['frequencysearcher']='recurring_type';
        return $table[$id];
    }

    public function search($id,$type,$value,$task_id_arr, $sign = '='){
       // print_r($task_id_arr);
        $col=$this->table($id);
       // print_r($col);
        
        if($id== 'projectsearcher' || $id== 'projectphasesearcher' || $id== 'projectcatsearcher'){
            if($type=='string'){
                $p=DB::table('tasks')->leftJoin('projects','projects.id','=','tasks.project_id')
                                    ->where('projects.'.$col,'LIKE','%'.$value.'%')
                                    ->whereIn('tasks.id',$task_id_arr)
                                    ->get();
                //$p=DB::table('projects')->whereIn('id',$this->projects)->where($col,'LIKE','%'.$value.'%')->get();
            }
            else{
                $p=DB::table('tasks')->leftJoin('projects','projects.id','=','tasks.project_id')
                                    ->join('project_category', 'project_category.id', '=', 'projects.category_id')
                                    ->where('project_category.category_name', '=', '%' . $value . '%')
                                    ->whereIn('tasks.id',$task_id_arr)
                                    ->get();

                
            }
          
           Task_builder::get_total_array($p,'asc','searcher');
           
        }
        elseif($id== 'enddatesearcher' || $id== 'statussearcher'){
            if($id== 'statussearcher'){
                 $tb= DB::table('tasks')->join('taskboard_columns','taskboard_columns.id','=', 'tasks.board_column_id')
                                ->whereIn('tasks.id',$task_id_arr)
                                 ->where('taskboard_columns.column_name','=',$value)
                                 ->select('tasks.*')
                                ->get();
              //  print_r($tb);
                Task_builder::get_total_array($tb, 'asc', 'searcher');
            }else{
                $tb = DB::table('tasks')->join('taskboard_columns', 'taskboard_columns.id', '=', 'tasks.board_column_id')
                    ->whereIn('tasks.id', $task_id_arr)
                    ->whereDate('taskboard_columns.updated_at', '=', $value)
                    ->get();
                Task_builder::get_total_array($tb, 'asc', 'searcher');
            }
           
                             
        }
        elseif($id== 'clientsearcher' || $id== 'assigneesearcher'){
            $user=User::find($value);
            $u=DB::table('tasks')->whereIn('id', $task_id_arr)
            
            ->get();
            foreach ($u as $key => $val) {
                if(in_array($user->id,json_decode($val->user_id))==false){
                    unset($u[$key]);
                }
               // print_r($val->user_id);
               
            }
          //  print_r($u);
          
            Task_builder::get_total_array($u, 'asc', 'searcher');
        }
        elseif($id == 'subtasksearcher'){
            if($type=='string'){
                $t=DB::table('tasks')->join('sub_tasks','sub_tasks.task_id','=','tasks.id')
                                     ->whereIn('tasks.id',$task_id_arr)
                                    ->where('sub_tasks.'.$col, 'LIKE', '%' . $value . '%')
                                    ->select('tasks.*')
                                    ->get();
            }
             // print_r($t);
            Task_builder::get_total_array($t, 'asc', 'searcher');
        }
        elseif($id=='frequencysearcher'){
            $recur_task=array();
            $shedule= RecurrencePattern::where('recurring_type',$value)->get();
            foreach($shedule as $sh){
                $parent=TaskRecurrencePattern::where('parent_id',$sh->parent_id)->get();
                foreach($parent as $pa){
                    $t=Task::find($pa->task_id);
                    array_push($recur_task,$t);
                }
            }
            $recur_task=(object)($recur_task);
            print_r($recur_task);
            Task_builder::get_total_array($recur_task, 'asc', 'searcher');
        }
        else{
            if ($type == 'string') {
                if($id== 'tasksearcher'){
                    $t = DB::table('tasks')->join('sub_tasks','sub_tasks.task_id','=','tasks.id')
                    ->whereIn('tasks.id', $task_id_arr)
                    ->where('tasks.heading', 'LIKE', '%' . $value . '%')
                    ->orWhere('sub_tasks.title', 'LIKE', '%' . $value . '%')
                    ->select('tasks.*')
                    ->get();
                }else{
                    $t = DB::table('tasks')->whereIn('id', $task_id_arr)->where($col, 'LIKE', '%' . $value . '%')->get();
                }
                
            }
            elseif ($type == 'date') 
            {
                $t = DB::table('tasks')->whereIn('id', $task_id_arr)->whereDate($col, $sign, $value)->get();
            } 
            elseif ($type == 'hour') 
            {
                $t = DB::table('tasks')->whereIn('id', $task_id_arr)->where($col, $sign, $value)->get();
            }
          
            Task_builder::get_total_array($t, 'asc', 'searcher');
        }
       // $this->array_setter();
    }

}