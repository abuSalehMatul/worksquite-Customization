<?php

namespace App\Helper;

use Illuminate\Http\Request;
use App\User;
use Carbon\Carbon;
use App\Project;
use App\ProjectMember;

use App\Task;
use App\Helper\Reply;
use App\Helper\Task_builder;
use App\TaskboardColumn;
use App\SubTask;
use App\TaskCategory;
use Illuminate\Support\Facades\DB;
use Auth;
use Session;
use App\ViewArray;
class Drag_and_drop{
    public $group_by_table;
    public $group_by_column;
    public $group_data=array();
    public $view_task_array=array();
    public function __construct()
    {
        $user=Auth::user();
        $row=ViewArray::where('user_id',$user->id)->where('role','admin')->first();
        $this->group_by_column=$row->group_by_column;
        $this->group_by_table=$row->group_by_table;
    }
   
    public function execute($data,$old_data){
        $task_arr=array();
        
        $index = '';

        for ($i = 0; $i < sizeof($data); $i++) {

            $res = Reply::idFiler($data[$i]);

            if ($res == 'matul' || $i == sizeof($data) - 1) {
                // print_r($data[$i]);

                $this->task_organizer($task_arr, $index);

                $index = $data[$i];

                $task_arr = array();
            } else {
                if ($res['sub_id'] == -100) {
                    array_push($task_arr, $res['task_id']);
                }
            }
        }
        $this->task_builder($data);

      
    }
    public function checker($data,$old_data){
        for($i=0;$i<sizeof($old_data);$i++){
            if($old_data[$i]!=$data[$i]){
                $id=Reply::idFiler($old_data[$i]);
                if($id['sub_id']== -100){
                    return 'task';
                }
                if($id['sub_id']!= -100){
                    return 'sub_task';
                }
            }
        }
    }
    public function task_organizer($task_arr,$group_by_value){
       // print_r($group_by_value);echo "<br>"; print_r($task_arr);
       // echo "<br>";
        foreach($task_arr as $task_id){
            $task=Task::find($task_id);
            
            if($this->group_by_table=='projects'){
                if($group_by_value== 'No Group'){
                    if($task->project_id==''){

                    }
                    else
                    {
                        $task->project_id=null;
                    }
                }
                else{
                    $project=Project::where($this->group_by_column,$group_by_value)->first();
                    if($task->project_id==''){
                        $task->project_id=$project->id;
                    }else{
                        $value = DB::table('tasks')->join('projects', 'projects.id', '=', 'tasks.project_id')
                            ->where('tasks.id', $task_id)
                            ->select('projects.' . $this->group_by_column)->first();
                        if($value!= $group_by_value){
                            $task->project_id=$project->id;
                        }
                    }
                   
                }
            }
            elseif($this->group_by_table=='tasks'){
                $p = $this->group_by_column;
                if($group_by_value== 'No Group'){
                    if($task->$p!=''){
                        $task->$p=null;
                    }
                }
                else{
                   
                    if($task->$p==''){
                        $task->$p=$group_by_value;
                    }
                    else{
                        if($group_by_value != $task->$p){
                            $task->$p=$group_by_value;
                        }

                    }
                }
            }
            elseif($this->group_by_table== 'taskboard_columns'){

            }
            else{

            }
            $task->save();
        }
    }
    public function task_builder($data){
        foreach($data as $item){
            $check=Reply::idFiler($item);
            if(is_array($check)){
                if($check['sub_id'] == -100){
                    array_push($this->view_task_array, $check['task_id']);
                }
            }
        }
        // print_r($data);
        // echo '<br>';
       // print_r($this->view_task_array);
        $array=array();
       
        foreach ($this->view_task_array as $t) {
            
            $array[$t] = Task_builder::sub_id_finder($t);
            
        }
        
        $ses_arr = json_encode($array);
       // print_r($ses_arr);
       // die();
        Session::put('view_array', $ses_arr);
        $current = Auth::user();
        $arr = ViewArray::where('user_id', $current->id)->where('role', 'admin')->first();
        $arr->array = json_encode($array);
        $arr->save();
        Session::put('put_data_session', 'false');

    }
    public function sub_task_organizer($data){
       for($i=0;$i<sizeof($data);$i++){
           $id=Reply::idFiler($data[$i]);
           if($id!='matul'){
                if ($id['sub_id'] == -100) {
                    $task_id = $id['task_id'];
                } 
                else { 
                    $sub_task=SubTask::find($id['sub_id']);
                    if($sub_task->task_id == $task_id){

                    }
                    else{
                        $sub_task->task_id=$task_id;
                        $sub_task->save();
                    }
                }
           }
           
       }
       for($i=0;$i<sizeof($data);$i++){
           $id=Reply::idFiler($data[$i]);

           if($id!='matul'){
               $sub_arr=array();
                if ($id['sub_id'] == -100) {
                    $task_id = $id['task_id'];
                } 
                else 
                {
                   for(; $i < sizeof($data);$i++){
                        $id = Reply::idFiler($data[$i]);
                        if(is_array($id) == false ){
                            break;
                        }   
                        if($id['sub_id']== -100){
                            break;
                        }
                        array_push($sub_arr,$id['sub_id']);
                        
                    }
                   
                }
                $this->view_task_array[$task_id] = $sub_arr;
                $sub_arr = array();
           }
           
       }
       $user=Auth::user();
       $view = ViewArray::where('user_id', $user->id)->where('role', 'admin')->first();
       $view->array=json_encode($this->view_task_array);
       $view->save();
       $ses_arr = json_encode($this->view_task_array);
       Session::put('view_array', $ses_arr);
        Session::put('put_data_session', 'false');
    }

    public function to_task($sub_id){
        $sub_id=Reply::idFiler($sub_id);
        if($sub_id['sub_id']){
            $sub=SubTask::find($sub_id['sub_id']);
            $old_task=Task::find($sub->task_id);
            $task= new Task;
            $task->company_id=$old_task->company_id;
            $task->heading=$sub->title;
            $task->description=$sub->description;
            $task->due_date=$sub->due_date;
            $task->user_id=$sub->user_id;
            $task->team_id=$sub->team_id;
            $task->tag=$sub->tag;
            if($sub->priority){

                $task->priority=$sub->priority;
            }
            $task->status=$sub->status;
            $task->completed_on=$sub->completed_on;
            $task->est_hour=$sub->act_hour;
            $task->act_hour=$sub->est_hour;
            $task->start_date=$sub->start_date;
            $task->task_category_id=$old_task->task_category_id;
            $task->project_id=$old_task->project_id;
            $task->created_by=$old_task->created_by;
            $task->board_column_id=$old_task->board_column_id;
            $task->own=$old_task->own;
            $task->column_priority=$old_task->column_priority;
            $task->save();
            $sub->delete();
            return 'success';

        }
    }
}