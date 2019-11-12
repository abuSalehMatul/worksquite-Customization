<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use App\Task;
use App\Project;
use DB;
use Exception;

class SubTask extends Model
{
    protected $dates = ['due_date'];
    public function task(){
        return $this->belongsTo('App\Task','task_id');
    }
    public static function store($data){
           $task=Task::find($data->taskID);
   
        //  try {
           
            $subTask = new SubTask;
            $subTask->title = $data->name;
            $subTask->task_id = $data->taskID;
            if($data->due_date){
                 $subTask->due_date = $data->due_date;
            }
            if($data->tag){
                 $subTask->tag = $data->tag;
            }
           if($data->team_id){
                 $subTask->team_id =json_encode($data->team);
           }
           if($data->start_date){
                $subTask->start_date = $data->start_date;
           }
           if($data->est_hour){
                 $subTask->est_hour = $data->est_hour;
           }
           if($data->priority){
                 $subTask->priority = $data->priority;
           }

        if ($data->assignee==null){
           
            return 'User needed';
        }
            $subTask->user_id = json_encode($data->assignee);
           
          
            $subTask->save();
            return 'success';
       
     
        
    }
}
