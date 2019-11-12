<?php

namespace App\Helper;

use Illuminate\Http\Request;

use App\Http\Requests\Tasks\StoreTask;
use App\TaskboardColumn;
use App\Task;

use App\Helper\Task_builder;
use App\ViewArray;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Helper\Reply;
use View;
use Auth;
use Session;
use App\RecurrencePattern;
use App\Test;
use App\TaskRecurrencePattern;
class ReccurrenceGenerator{

    public $day_of_week;
    public $week_of_month;
    public $day_of_month;
    public $month_of_year;
    public $today;
    public function __construct()
    {
        $dt=Carbon::now();
        $this->today = Carbon::today();
        $this->day_of_month=$dt->day;
        $this->week_of_month=$dt->weekOfMonth;
        $this->day_of_week=$dt->dayOfWeek;
        $this->month_of_year=$dt->month;
        $this->reccurence();
        
    }
    public function reccurence(){
    //    $test= new Test;
    //    $test->now=rand(1,1000);
    //    $test->user_id=34;
    //    $test->save();
       $patterns=RecurrencePattern::all();
           
        foreach($patterns as $pattern){
            $task = TaskRecurrencePattern::where('parent_id', $pattern->parent_id)->orderBy('created_at', 'DESC')->first();
            $task=Task::find($task->task_id);
            if($task){
                if($task->is_recurrence=='yes'){

                }else{
                    continue;
                }
            }else{
                continue;
            }
            if($pattern->end_date){
                $end_date=Carbon::parse($pattern->end_date);
                if($end_date>=$this->today){
                    continue;
                }
            }
            if($pattern->max_num_recurrence){
                if($pattern->max_num_recurrence>=$pattern->total_ocurrence){
                    continue;
                }
            }
            $last_ocurrence=Carbon::parse($pattern->last_ocurrence);
          //  $last_ocurrence=$last_ocurrence->format('Y-m-d');

            //pattern 's 
            if($pattern->recurring_type=='daily'){
                if($pattern->separation_count==7){
                    $parent = TaskRecurrencePattern::where('parent_id', $pattern->parent_id)->orderBy('created_at', 'DESC')->first();
                   if($this->day_of_week==6){
                       
                        $this->task_create($parent->task_id,1,$pattern->parent_id);
                   }
                   if($this->day_of_week == 7){
                        $this->today_action($parent->task_id, $pattern->parent_id);
                   }
                }
                else{
                    $next=$last_ocurrence->addDays($pattern->separation_count);
                    // print_r($pattern->id);
                    $parent = TaskRecurrencePattern::where('parent_id', $pattern->parent_id)->orderBy('created_at', 'DESC')->first();
                    if($this->today->diffInDays($next)<2) {
                       
                       
                        $this->task_create($parent->task_id, 1,$pattern->parent_id);
                    }
                    if($this->today->diffInDays($next)==0){
                        $this->today_action($parent->task_id, $pattern->parent_id);
                    }
                }
               
            }
            //weekly
            elseif($pattern->recurring_type=='weekly'){
                $weekend=(7-(7-$this->day_of_week));
                $start_point=$this->today->subDays($weekend);
                $next_weekend=$start_point->addWeeks($pattern->separation_count);
                $next=$next_weekend->addDays($pattern->day_of_week);
                $parent = TaskRecurrencePattern::where('parent_id', $pattern->parent_id)->orderBy('created_at', 'DESC')->first();
                if ($this->today->diffInDays($next) < 6) {
                    $this->task_create($parent->task_id, 5, $pattern->parent_id);
                }
                if($this->today->diffInDays($next) == 6){
                    $this->today_action($parent->task_id, $pattern->parent_id);
                }
            }
            //monthly
            elseif($pattern->recurring_type=='monthly'){
                $start_point=$this->today->subDays($this->day_of_month-1);
                $next_month=$start_point->addMonths($pattern->separation_count);
                if($pattern->day_of_month){
                    $next=$next_month->addDays($pattern->day_of_month-1);
                }
                if($pattern->week_of_month!='' && $pattern->day_of_week!=''){
                    $next=$next_month->addWeeks($pattern->week_of_month-1);
                    $day_of_this_date=$next->dayOfWeek;
                    $weekend = (7 - $day_of_this_date);
                    $weekend=$next->addDays($weekend);
                    $next= $weekend->addDays($pattern->day_of_week);
                }
                $parent = TaskRecurrencePattern::where('parent_id', $pattern->parent_id)->orderBy('created_at', 'DESC')->first();
                if ($this->today->diffInDays($next) < 6) {
                    $this->task_create($parent->task_id, 5, $pattern->parent_id);
                }
                if($this->today->diffInDays($next) == 0){
                    $this->today_action($parent->task_id, $pattern->parent_id);
                }
                
            }
            //yearly
            else{
                $start_point=$this->today->subMonth($this->month_of_year-1);
                $start_point=$start_point->subDays($this->day_of_month-1);
                $next=$start_point->addYears($pattern->separation_count);
                if($pattern->day_of_month!='' && $pattern->month_of_year!=''){
                    $next=$next->addMonths($pattern->month_of_year-1);
                    $next=$next->addDays($pattern->day_of_month-1);
                }
                if($pattern->week_of_month!='' && $pattern->day_of_week!='' && $pattern->month_of_year!=''){
                    $next = $next->addMonths($pattern->month_of_year - 1);
                    $next = $next_month->addWeeks($pattern->week_of_month - 1);
                    $day_of_this_date = $next->dayOfWeek;
                    $weekend = (7 - $day_of_this_date);
                    $weekend = $next->addDays($weekend);
                    $next = $weekend->addDays($pattern->day_of_week);
                }
                $parent = TaskRecurrencePattern::where('parent_id', $pattern->parent_id)->orderBy('created_at', 'DESC')->first();
                if ($this->today->diffInDays($next) < 20) {
                    $this->task_create($parent->task_id, 19, $pattern->parent_id);
                }
                if($this->today->diffInDays($next) == 0){
                    $this->today_action($parent->task_id, $pattern->parent_id);
                }
            }
        }
        
    }
    public function task_create($id,$pre_day,$parent)
    {
        $taskBoardColumn = TaskboardColumn::where('slug', 'incomplete')->first();
        $old_task=Task::find($id);
        $task= new Task;
        if($old_task->company_id){
            $task->company_id=$old_task->company_id;
        }
        $task->heading=$old_task->heading;
        if($old_task->description){
            $task->description=$old_task->description;
        }
        if($old_task->user_id){
            $task->user_id=$old_task->user_id;
        }
        if($old_task->project_id){
            $task->project_id=$old_task->project_id;
        }
        if($old_task->task_category_id){
            $task->task_category_id=$old_task->task_category_id;
        }
        $task->priority=$old_task->priority;
        if($old_task->created_by){
            $task->created_by=$old_task->created_by;
        }
        if($old_task->team_id){
            $task->team_id=$old_task->team_id;
        }
        if($old_task->tag){
            $task->tag=$old_task->tag;
        }
        if($old_task->section_tiles){
            $task->section_tiles=$old_task->section_tiles;
        }
        if($old_task->est_hour){
            $task->est_hour=$old_task->est_hour;
        }
        $task->is_future_task='yes';
        $task->is_recurrence='yes';
        $task->column_priority=$old_task->column_priority;
        if($old_task->own){
            $task->own=$old_task->own;
        }
        $task->board_column_id= $taskBoardColumn->id;
        if($old_task->start_date){
            $task->start_date=$old_task->start_date;
        }

        $created_at = Carbon::parse($old_task->created_at);
        $due = Carbon::parse($old_task->due_date);
        $diff = $created_at->diffInDays($due);
        $diff=$pre_day+$diff;
        $due_date=$this->today->addDays($diff);
        $due_date=$due_date->format('Y-m-d');
        $task->due_date=$due_date;
        
        $task->save();
        $old_task_recurrence=TaskRecurrencePattern::where('parent_id',$parent)->orderBy('created_at', 'DESC')->first();
        $task_recurrence= new TaskRecurrencePattern;
        $task_recurrence->parent_id=$parent;
        $task_recurrence->task_id=$task->id;
        $task_recurrence->pattern_id=$old_task_recurrence->pattern_id;
        $task_recurrence->save();
        $views = ViewArray::all();
        foreach ($views as $view) {
            $tasks = Task::where('created_by', $view->user_id)->get();
            Task_builder::get_total_array($tasks);
        }


    }
    public function today_action($task_id,$parent_id){
        $task=Task::find($task_id);
        if($task){
            $task->is_future_task=null;
            $task->save();
        }
        $pattern= RecurrencePattern::where('parent_id',$parent_id)->first();
        if($pattern){
            $pattern->total_ocurrence=$pattern->total_ocurrence+1;
            $pattern->save();
        }
        
    }
    public static function  future_events($task_id){
        $today=Carbon::today();
        $dt = Carbon::now();
       
        $day_of_month = $dt->day;
        $week_of_month = $dt->weekOfMonth;
        $day_of_week = $dt->dayOfWeek;
        $month_of_year = $dt->month;
        $parent= TaskRecurrencePattern::where('task_id',$task_id)->first();
        $pattern = RecurrencePattern::find($parent->pattern_id);
        $future=[];
        $future[0]='No Future Task';
        // return $pattern;

      //  print_r($parent->parent_id);exit();
        $today=Carbon::now();
        $last=Carbon::parse($pattern->last_ocurrence);
        for($i=0;$i<5;$i++){
            
            if ($pattern->max_num_recurrence) {
                if ($pattern->max_num_recurrence >= ($pattern->total_ocurrence+$i)) {
                    continue;
                }
            }
            if($pattern->recurring_type=='daily'){
                if($pattern->separation_count==7 && $pattern->day_of_week==7){
                    if($i==0){
                        $weekend = (7 - $day_of_week);
                        $next = $today->addDays($weekend);
                    }else{
                        $next=$next->addWeeks(1);
                    }
                    if ($pattern->end_date) {
                        $end_date = Carbon::parse($pattern->end_date);
                        if ($end_date >= $next) {
                            continue;
                        }
                    }
                    $future[$i] = $next->toFormattedDateString();
                }
                else{
                    $last=$last->addDays($pattern->separation_count);
                    $date = $last->toFormattedDateString();
                    if ($pattern->end_date) {
                        $end_date = Carbon::parse($pattern->end_date);
                        if ($end_date >= $last) {
                            continue;
                        }
                    } 
                    $future[$i]=$date;

                }
            }
            elseif($pattern->recurring_type=='weekly'){
              //  print_r($pattern);
                if($i==0){
                    $weekend=(7-(7-$day_of_week));
                    $start_point=$today->subDays($weekend);
                    $next_weekend=$start_point->addWeeks($pattern->separation_count);
                    $next=$next_weekend->addDays($pattern->day_of_week);
                    // print_r(Carbon::today());
                   
                }else{
                    $next=$next->addDays(6);
                   // $future[$i] = $next->toFormattedDateString();
                }
                if ($pattern->end_date) {
                    $end_date = Carbon::parse($pattern->end_date);
                    if ($end_date >= $next) {
                        continue;
                    }
                }
                
                $future[$i] = $next->toFormattedDateString();

            }
            elseif($pattern->recurring_type=='monthly'){
                if($i==0){
                    $start_point = $today->subDays($day_of_month - 1);
                    $next_month = $start_point->addMonths($pattern->separation_count);
                    if ($pattern->day_of_month) {
                        $next = $next_month->addDays($pattern->day_of_month - 1);
                    }
                    if ($pattern->week_of_month != '' && $pattern->day_of_week != '') {
                        $next = $next_month->addWeeks($pattern->week_of_month - 1);
                        $day_of_this_date = $next->dayOfWeek;
                        $weekend = (7 - $day_of_this_date);
                        $weekend = $next->addDays($weekend);
                        $next = $weekend->addDays($pattern->day_of_week);
                    }
                }
                else{
                    $next=$next->addMonths($pattern->separation_count);
                }
                if ($pattern->end_date) {
                    $end_date = Carbon::parse($pattern->end_date);
                    if ($end_date >= $next) {
                        continue;
                    }
                }
                $future[$i] = $next->toFormattedDateString();

            }
            else{
                if($i==0){
                    $start_point = $today->subMonth($month_of_year - 1);
                    $start_point = $start_point->subDays($day_of_month - 1);
                    $next = $start_point->addYears($pattern->separation_count);
                    if ($pattern->day_of_month != '' && $pattern->month_of_year != '') {
                        $next = $next->addMonths($pattern->month_of_year - 1);
                        $next = $next->addDays($pattern->day_of_month - 1);
                    }
                    if ($pattern->week_of_month != '' && $pattern->day_of_week != '' && $pattern->month_of_year != '') {
                        $next = $next->addMonths($pattern->month_of_year - 1);
                        $next = $next_month->addWeeks($pattern->week_of_month - 1);
                        $day_of_this_date = $next->dayOfWeek;
                        $weekend = (7 - $day_of_this_date);
                        $weekend = $next->addDays($weekend);
                        $next = $weekend->addDays($pattern->day_of_week);
                    }
                }
                else{
                    $next=$next->addYears($pattern->separation_count);
                }
                if ($pattern->end_date) {
                    $end_date = Carbon::parse($pattern->end_date);
                    if ($end_date >= $next) {
                        continue;
                    }
                }
                $future[$i] = $next->toFormattedDateString();

            }
        }
        return $future;
    }
}