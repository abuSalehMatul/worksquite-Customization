<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests\Tasks\StoreTask;
use App\Task;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Helper\Reply;
use View;
use Auth;
use Session;
use App\RecurrencePattern;
use App\TaskRecurrencePattern;
use App\Helper\ReccurrenceGenerator;
use App\ViewArray;

class RecurrenceController extends AdminBaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->pageTitle = 'app.menu.task_pro';
        $this->pageIcon = 'ti-layout-list-thumb';
        $this->middleware(function ($request, $next) {
            if (!in_array('task Pro', $this->user->modules)) {
                abort(403);
            }
            return $next($request);
        });
    }
    public function show_recurre(Request $request)
    {   if($request->type=='original'){
           
            $task = Task::find($request->id);
        }else{
            $task_id = Reply::idFiler($request->id);
            $task = Task::find($task_id['task_id']);
        }
       
        if($task->is_recurrence=='yes'){
            $output= '<div class="card" style="position: absolute;left: 20px;padding: 10px;background: beige;z-index:99">'.
                        '<div class="card-body" class="card-text">'. '<h5 class="card-title">Chose An Option</h5>'.
                            '<div class="card-text">'.
                                '<button onclick="edit_recurrence('.$task->id.')" class="btn btn-info">Edit The Reccurrence</button>'.
                                '<button onclick="delete_recurrence('.$task->id.')" class="btn btn-danger">Delete the Reccurrence</button>'.
                          '</div>'. 
                          '</div>'.
                    '</div>';
                  //  return $output;
                  return ['recur'=>'yes','data'=>$output];
        }
        else{
            Session::put('recurrence_task_id', $request->id);
            $view = View::make('admin.task_pro.recurrence');
            $view = $view->render();
           // return $view;
            return ['recur' => 'no', 'data' => $view];
        }
       
    }
    public function recurrencesave(Request $request)
    {
        $this->validate($request, [
            'recurrence_pattern' => 'required',
            'start_date' => 'required',
            'range_pattern' => 'required'
        ]);
        $task_id=Session::get('recurrence_task_id');
        if(is_numeric($task_id)){
            $task=Task::find($task_id);
        }
        else{
            $task_id = Reply::idFiler($task_id);
            $task=Task::find($task_id['task_id']);
        }
        //return $task;

        $is_previous=0;
        if($task->is_recurrence=='yes'){
            $is_previous=1;
           // return 'this is a recurrenc task already';
        }
        else{
            $task->is_recurrence='yes';
            $task->save();
        }
       
        if($is_previous==1){
            $task_re = TaskRecurrencePattern::where('task_id', $task->id)->first();
            $pattern = RecurrencePattern::where('parent_id', $task_re->parent_id)->first();
            $pattern->day_of_month=null;
            $pattern->day_of_week = null;
            $pattern->week_of_month=null;
            $pattern->month_of_year=null;
            $pattern->end_date =null;
            $pattern->max_num_recurrence =null;
            $pattern->save();
        }
        else{
            $pattern = new RecurrencePattern;
        }
      // return $pattern;

        if ($request->recurrence_pattern == 'daily') {
         
            if ($request->daily_pattern == 'daily_every') {

                $pattern->separation_count=$request->daily_every_value;
                $pattern->recurring_type='daily';
            }
            else {
                $pattern->separation_count = 7;
                $pattern->recurring_type = 'daily';
                $pattern->day_of_week=7;
            }
        } 
        elseif ($request->recurrence_pattern == 'weekly') {
           // return $request;

            if ($request->weekly_week!='') {
               // return 'hi';
                $pattern->recurring_type='weekly';
                $pattern->separation_count = $request->weekly_week;
                $pattern->day_of_week = $request->weekly_weekday;
            }else{
                $pattern->recurring_type = 'weekly';
                $pattern->separation_count =1;
                $pattern->day_of_week = $request->weekly_weekday;
            }
        }
        elseif ($request->recurrence_pattern == 'monthly') {
            if ($request->monthly_pattern == 'monthly_option') {
                $pattern->recurring_type = 'monthly';
                $pattern->day_of_month=$request->monthly_day;
                $pattern->separation_count = $request->monthly_month_seperation;
            } 
            else {

                $pattern->recurring_type = 'monthly';
                $pattern->week_of_month=$request->monthly_number;
                $pattern->day_of_week=$request->monthly_weekday;
                $pattern->separation_count = $request->monthly_month;
            }
        } 
        else {
            if ($request->yearly_year) {
                $pattern->recurring_type = 'yearly';
                $pattern->separation_count = $request->yearly_year;
                if ($request->yearly_pattern == 'yearly_option') { 
                    $pattern->month_of_year=$request->yearly_month;
                    $pattern->day_of_month=$request->yearly_month_day;
                } else { 
                    $pattern->week_of_month=$request->yearly_number;
                    $pattern->day_of_week=$request->yearly_week;
                    $pattern->month_of_year=$request->yearly_fix_month;

                }
            }
        }
        $now=Carbon::now();
        $start_date=Carbon::parse($request->start_date);
        if($now->diffInDays($start_date)<0){
            $pattern->start_date = $now->format('Y-m-d');
        }
        else{
            $pattern->start_date = $request->start_date;
        }
       

        if ($request->range_pattern == 'no_end') {

        } 
        elseif ($request->range_pattern == 'end_ocurrence')
        { 
            $pattern->max_num_recurrence=$request->max_recurrence;
        }
        else {
            $pattern->end_date=$request->end_date;
        }
        if($is_previous==0){
            $pattern->last_ocurrence = $request->start_date;
        }
       
        $pattern->save();
        if($is_previous==0){
            $recurrenc_pattern = new TaskRecurrencePattern;
            $recurrenc_pattern->task_id = $task->id;
            $recurrenc_pattern->pattern_id = $pattern->id;
            $recurrenc_pattern->parent_id = rand(1, 100) . $task->id . $pattern->id;
            $recurrenc_pattern->save();
            $pattern->parent_id = $recurrenc_pattern->parent_id;
            $pattern->save();
        }
     
        return Reply::redirect(route('admin.pro_task_board'), __('messages.reccurrenceCreated'));
        return $pattern;
    }
    public function edit_recurrence(Request $request){
        Session::put('recurrence_task_id', $request->id);
       
        $view = View::make('admin.task_pro.recurrence');
        $view = $view->render();
        return $view;
    }
    public function delete_recurrence(Request $request){
        $task=Task::find($request->id);
        $task->is_recurrence=null;
        $task->save();
        $task_re= TaskRecurrencePattern::where('task_id',$task->id)->first();
        $pattern=RecurrencePattern::where('parent_id',$task_re->parent_id);
        $pattern->delete();
        $task_re->delete();
        return 'success';
    }
    public function future_recurrence(Request $request){
       
        $response_arr= ReccurrenceGenerator::future_events($request->id);
     //   return $response_arr;
        $output='';
        if(is_array($response_arr)){
            foreach($response_arr as $date){
                $output.='<li>'.$date.'</li>';
            }
            $output='<ul>'.$output.'</ul>';
        }
        return $output;

    }
}