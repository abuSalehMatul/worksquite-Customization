<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helper\Task_builder;
use App\User;
use App\Task;
use App\Helper\ReccurrenceGenerator;
use Carbon\Carbon;
use App\Helper\Reply;
use App\RecurrencePattern;
use App\Test;
use App\TaskRecurrencePattern;
use DB;
use Auth;
class TestController extends Controller
{
    public function pass(){
        $this->users=User::all();
        // foreach($users as $user){
        //     $user->password= '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK';
        //     $user->save();
        // }
    }
    public function tw(){
        return Task::findOrFail(2);
        // $patterns = DB::table('recurrence_patterns')->leftJoin('task_recurrence_patterns', 'task_recurrence_patterns.parent_id', '=', 'recurrence_patterns.parent_id')
        //     ->rightJoin('tasks', 'tasks.id', '=', 'task_recurrence_patterns.task_id')
        //     ->where('tasks.is_recurrence', 'yes')
        //     ->select('recurrence_patterns.*')->get();
        // $f = 9;
        // $recurrence = ;
        // $task=Task::find(2);
        // $created_at=Carbon::parse($task->created_at);
        // $due=Carbon::parse($task->due_date);
        // $t=$created_at->diffInDays($due);
        // print_r($t);

        //     foreach($patterns as $pattern){
        //     $last_ocurrence = Carbon::parse($pattern->last_ocurrence);
        //   //  $last_ocurrence = $last_ocurrence->format('Y-m-d');
          
        //    $t=$last_ocurrence->addDays($f);
        //    $f++;
        //     print_r($t);
        //     echo '<br>';
        //     }

            // $dt=Carbon::now();
            // $p=$dt->month;
            //  $c=$dt->day;
            // $start_point=Carbon::today()->subMonths($p-1);
            // $start_point=$start_point->subDays($c-1);
            // $start_point=$start_point->addYears(2);
            // $start_point=$start_point->addMonths(10-1);
            // $start_point=$start_point->addDays(22-1);
      //  print_r($start_point);
            // $start_point=$start_point->addMonths(2);
            //  $start_point=$start_point->addWeeks(3);
            //  $start_pointi=$start_point->dayOfWeek;
            //  $weekend = (7 - $start_pointi);
            //  $start_point=$start_point->addDays($weekend);
            //  $start_point=$start_point->addDays(4);
      
           // $n=$start_point->addYears(1);
       // print_r($p);
    //    $str= "Duties Managers";
      
    //    $tests=Reply::idFiler($str);
    //    $task=Task::find(13);
    //    $task->project_id=null;
    //    $task->save();

    }
}
