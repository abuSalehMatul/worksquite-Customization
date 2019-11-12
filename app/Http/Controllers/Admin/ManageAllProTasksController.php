<?php

namespace App\Http\Controllers\Admin;

use App\Helper\Reply;
use App\Helper\Task_builder;
use App\Helper\Search_helper;
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
use App\SubTask;
use App\User;
use App\Helper\Drag_and_drop;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;
use View;
use Auth;
use Session;
use App\RecurrencePattern;
use App\TaskRecurrencePattern;
use App\ViewArray;
use App\Team;


class ManageAllProTasksController extends AdminBaseController
{
    use ProjectProgress;

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

   
    public function pro_index(Request $request)
    {
        $this->projects = Project::all();
      
        $this->clients = User::allClients();
      
        $this->employees = User::allEmployees();
        $this->total_task=Task::count();
        $user=Auth::user();
       
        $this->taskBoardStatus = TaskboardColumn::all();
        $tasks=Task::where('created_by',$user->id)->get();
        $this->allTask=$tasks->count();
      
        $today = Carbon::today();
        $newline=$today->subDays(3); 
        $newline=$newline->format('Y-m-d');
        $today=$today->format('Y-m-d');
        $tomorrow = Carbon::tomorrow();
        $tomorrow=$tomorrow->format('Y-m-d');
        $this->over_due_cnt=$tasks->where('due_date', '<=', $today);
        $this->tomorrow_due=$tasks->where('due_date','=',$tomorrow)->count();
        $this->today_due=$tasks->where('due_date','=',$today)->count();
        $this->new_task=$tasks->where('start_date','>=',$newline)->count();
        $this->progress=$tasks->where('due_date','>=',$today)->count();
        $coloum=Task::join('taskboard_columns', 'taskboard_columns.id', '=', 'tasks.board_column_id')
                ->where('tasks.created_by',$user->id)
                ->where('taskboard_columns.column_name','=', 'completed')->count();
        $this->completed=$coloum;
        $this->closed=$tasks->where('end_data','<',$today)
                            ->where('end_date','!=','')->count();
       // return  $tasks;      
        Session::put('role', 'admin');
      
        $check_if_session_has=Session::get('put_data_session');
       
        if(empty(Session::get('put_data_session'))){
          //  return $tasks;
           Task_builder::get_total_array($tasks);
            //
        }
        if($check_if_session_has=='true'){
            Task_builder::get_total_array($tasks);
        }
       // Task_builder::get_total_array($tasks);
        $total_assignee=array();
        $total_client=array();
        foreach($tasks as $t){
            $arr=json_decode($t->user_id);
            foreach($arr as $a){
                array_push($total_assignee,$a);
            }
            if($t->project_id!=null){
                $project=Project::find($t->project_id);
                if($project->client_id!=null){
                    array_push($total_client,$project->client_id);
                }
            }
        }
        $total_assignee= array_unique($total_assignee);
        $total_client= array_unique($total_client);
        $total_assignee=json_encode($total_assignee);
        $total_client=json_encode($total_client);
        Session::put('total_client',$total_client);
        Session::put('total_assignee',$total_assignee);
        $view=view('admin.task_pro.index', $this->data);
        $view=$view->render();
        return response($view);
       
    }
    public function showTaskon(Request $request)
    {
        $user = Auth::user();
        $all=Task::get();
        $tasks = Task::where('created_by', $user->id)->get();
        $today = Carbon::today();
        $today = $today->format('Y-m-d');
        $tomorrow = Carbon::tomorrow();
        $tomorrow = $tomorrow->format('Y-m-d');

        if($request->data== 'all_task'){
            Task_builder::get_total_array($tasks);
        }
        if($request->data== 'my_task'){
            Task_builder::get_total_array($tasks);
        }
        if($request->data== 'today_due'){
            $this->today_due = $tasks->where('due_date', '=', $today);
            Task_builder::get_total_array($this->today_due);
        }
        if($request->data== 'tomorrow_due'){
            $this->tomorrow_due = $tasks->where('due_date', '=', $tomorrow);
            Task_builder::get_total_array($this->tomorrow_due);
        }
        if($request->data== 'due'){
            $this->due = $tasks->where('due_date', '<=', $today);
            Task_builder::get_total_array($this->due);
        }
       
    }
    public function quick_change(Request $request){
        $column=$request->column;
        $id=Reply::idFiler($request->id);
        
        if($column=='project_phase' || $column=='project_name' || $column=='category_id' || $column=='client_id'){
            $task=Task::find($id['task_id']);
            $project=Project::find($task->project_id);
            $project->$column=$request->new_value;
            $project->save();
        }
        elseif($column=='heading' || $column=='due_date' || $column=='priority' || $column=='task_category_id' || $column=='est_hour' || $column=='act_hour' || $column=='section_tiles' || $column=='tag'){
            $task=Task::find($id['task_id']);
            $task->$column=$request->new_value;
            $task->save();
        }
        return 'success';
    }
    public function datesearcher(Request $request){
        $user=Auth::user();
        $tasks=DB::table('tasks')
                ->whereNotNull('start_date')
                ->where('created_by',$user->id)
                ->where('start_date','>',$request->from)
                ->where('start_date','<',$request->to)->get();
        Task_builder::get_total_array($tasks);
        return 'success';
    }
    public function tasksearcher_two(Request $request){
        $user = Auth::user();
        $tasks=DB::table('tasks')->where('created_by', $user->id)->where('heading','LIKE','%'.$request->value.'%')->get();
        Task_builder::get_total_array($tasks);
        return 'success';
    }
    public function showFullView(Request $request){
        return view('admin.task_pro.pro_table_rows');
    }
    public function data(Request $request, $startDate = null, $endDate = null, $hideCompleted = null, $projectId = null)
    {
        $this->projects = Project::all();
        $check_if_session_has = Session::get('put_data_session');
        if ($check_if_session_has == 'true') {
            Session::put('put_data_session', 'false');
            $user = Auth::user();
            $tasks = Task::where('created_by', $user->id)->get();
            Session::put('role', 'admin');
            Task_builder::get_total_array($tasks);
        }
        Session::put('role', 'admin');
       
        return view('admin.task_pro.pro_table_rows');   
    }
    public function only_view(Request $request){
        return view('admin.task_pro.pro_table_rows');   
    }
    public function change_num_record_to_show(Request $request){
        Session::put('change_num_record_to_show',$request->num);
    }
    public function get_change_position(Request $request){
        // print_r($request->ids);
        $drag_drop= new Drag_and_drop;
        $res=$drag_drop->execute($request->ids,$request->old_ids);
        return 'success';
    }
    public function sub_to_parent_change(Request $request){
        $drag_drop= new Drag_and_drop;
        $res=$drag_drop->sub_task_organizer($request->ids);
        return 'success';
    }
    public function sub_to_task(Request $request){
        $drag_drop= new Drag_and_drop;
        $res=$drag_drop->to_task($request->id);
        Session::put('put_data_session', 'true');
        return 'success';
    }
    public function showSubTaskForm(Request $request){
        $view=view('admin.task_pro.pro_subtask_input')->with('id', $request->value);
        $rendered=$view->render();
        return response()->json(['html'=>$rendered]);
    }
    public function post_subtask(Request $request){
       // return $request;
        $subTask = SubTask::store($request);
        Session::put('put_data_session', 'true');
       // return $subTask;
        if($subTask=='success'){
            return 'success';
        }
        elseif($subTask == 'User needed'){
            return 'User Needed';
        }
        else{
            return 'error';
        }
       
    }
    public function getSearchResult(Request $request){
      
        $user = Auth::user();
        $view=array();
        $task_id_arr=array();
        if($request->value!='' && $request->value!='all'){
           // return $request;
            $search_obj = new Search_helper();
            $taskarr = Task::where('created_by', $user->id)->get();
            foreach($taskarr as $tas){
                array_push($task_id_arr,$tas->id);
            }
            $search_obj->search($request->id, $request->type, $request->value, $task_id_arr);
            $view = Session::get('view_array');
            $view = json_decode($view, true);
        }
       
        else{
           
            $view=ViewArray::where('user_id', $user->id)->where('role', 'admin')->first();
           // return $view;
            $view=json_decode($view->array,true);
        }
       
        $view_orginal=ViewArray::where('user_id', $user->id)->where('role', 'admin')->first();
        $view_orginal=json_decode($view_orginal->array,true);
       // print_r($view_orginal);
       
        $id_array=array();
        foreach($view as $task_key=>$sub_task){
            // print_r(($sub_task));
            $ch = 'task' . $task_key . 'subTask-100';
            array_push($id_array, $ch);
            if(sizeof($sub_task)>0){
                foreach($sub_task as $sub){
                   // print_r($sub);
                    $ch='task'. $task_key.'subTask'.$sub;
                        array_push($id_array,$ch);
                }
            }
           
            
        }
       // print_r($view_orginal);
        // exit();
        $id_orginal=array();
        foreach($view_orginal as $key=>$sub_item){
            $ch = 'task' . $key . 'subTask-100';
            array_push($id_orginal, $ch);
                if(sizeof($sub_item)>0){
                    foreach($sub_item as $s){
                        $ch = 'task' . $key . 'subTask' . $s;
                        array_push($id_orginal, $ch);  
                    }
                }
               
            
        }
        // return $id_array;
        return [
            'orginal'=> $id_orginal,
            'result'=> $id_array
        ];

    }
    public function getSearchView(Request $request){
        if($request->id== 'putclientsearcher'){
           $user= User::allClients();
           $user=$user->where('name','LIKE','%'.$request->value.'%')->get();
           $output='';
           foreach($user as $user){
               $output.='<option>'.$user->name.'</option>';
           }
        }else{
            $user = User::get();
            $user = $user->where('name', 'LIKE', '%' . $request->value . '%')->get();
            $output = '';
            foreach ($user as $user) {
                $output .= '<option>' . $user->name . '</option>';
            }
        }
        return $output;
    }

    public function showTaskForm(Request $request){
        $user=Auth::user();
        $output='';
        $ids = Reply::idFiler($request->id);
        if ($ids['sub_id'] != -100) {
            $tasks=Task::where('created_by',$user->id)->get();
            $view=view('admin.task_pro.mass_action')->with('tasks',$tasks)->with('type',$request->val)->with('to','Task')->with('action',$request->action);
            
        }
        else {
            $project = DB::table('projects')->leftJoin('tasks', 'tasks.project_id', '=', 'projects.id')
                ->where('tasks.created_by', $user->id)
                ->select('projects.id', 'projects.project_name')->get()->groupBy('projects.project_name')->toArray();
            $pro_arr = array();
            if ($project) {
                foreach ($project as $pro) {
                    foreach ($pro as $p) {
                        if (in_array($p->project_name, $pro_arr) != true) {
                            $pro_arr[$p->id] = $p->project_name;
                        }
                    }
                }
            }
            $view = view('admin.task_pro.mass_action_project')->with('projects', $pro_arr)
                                                            ->with('type', $request->val)
                                                            ->with('task_id',$ids['task_id'])
                                                            ->with('to', 'Project')
                                                            ->with('action', $request->action);
        }

        $view = $view->render();
        return response($view);
       
    }
    public function showColumn(Request $request){
       $data= Reply::showData($request->id_value,$request->current_status);
       $name= $data['name'];
       $user=Auth::user();
       $view=ViewArray::where('user_id',$user->id)->where('role','admin')->first();
      
       $view->$name=$data['changed_status'];

       $view->save();
        Session::put('put_data_session', 'true');
      // view::render('admin.task_pro.show_column');
       return 'success';
    }
    public function hideComplete(Request $request){
        $user=Auth::user();
         $view = ViewArray::where('user_id', $user->id)->where('role', 'admin')->first();
        if($view->hide_show_completed==0){
            $view->hide_show_completed=1;
        }else{
            $view->hide_show_completed=0;
        }
        $view->save();
        Session::put('put_data_session', 'true');
      
       return 'success';

      
    }
    public function chagne_group_by(Request $request){
        $res= Task_builder::get_group_by_table_info($request->group);
        $user = Auth::user();
        $view = ViewArray::where('user_id', $user->id)->where('role', 'admin')->first();
        $view->group_by_column=$res['col'];
        $view->group_by_table=$res['table'];
        Session::put('put_data_session','true');
        $view->save();
    }
    public function action_executer($id,$action,$pro_id='',$due_date,$name=''){
        $user = Auth::user();
        $ids = Reply::idFiler($id);
        if($ids!='matul'){

        
        if ($ids['sub_id'] != -100) {
            $sub_task=SubTask::find($ids['sub_id']);
            if ($action == 'copy') {
                $dupli= new SubTask;
                $dupli->title=$sub_task->title;
                $dupli->due_date=$due_date;
                $dupli->task_id=$pro_id;
                if($sub_task->tag){
                    $dupli->tag = $sub_task->tag;
                }
               
                if($sub_task->priority){
                    $dupli->priority = $sub_task->priority;
                }
               
                $dupli->user_id=$sub_task->user_id;
                if($sub_task->team_id){
                    $dupli->team_id = $sub_task->team_id;
                }
                if($sub_task->est_hour){
                    $dupli->est_hour=$sub_task->est_hour;
                }
                if($sub_task->start_date){
                    $dupli->start_date=$sub_task->start_date;
                }
                $dupli->save();
               
                
                
            }
            if ($action == 'move') {
                $sub_task->task_id = $pro_id;
                $sub_task->due_date = $due_date;
                $sub_task->save();
            }
            if ($action == 'delete') {
                SubTask::destroy($ids['sub_id']);
                return ['status' => 'success', 'message' => 'Sub task deleted'];
            }
            if ($action == 'duplicate') {
                $dupli = new SubTask;
                $dupli->title ='A copy of '. $sub_task->title;
                $dupli->due_date = $due_date;
                $dupli->task_id = $pro_id;
                if ($sub_task->tag) {
                    $dupli->tag = $sub_task->tag;
                }

                if ($sub_task->priority) {
                    $dupli->priority = $sub_task->priority;
                }

                $dupli->user_id = $sub_task->user_id;
                if ($sub_task->team_id) {
                    $dupli->team_id = $sub_task->team_id;
                }
                if ($sub_task->est_hour) {
                    $dupli->est_hour = $sub_task->est_hour;
                }
                if ($sub_task->start_date) {
                    $dupli->start_date = $sub_task->start_date;
                }
                $dupli->save();
            }
            if ($action == 'mark_complete') {
                if($sub_task->status=='incomplete'){
                    $sub_task->status='complete';
                    $sub_task->completed_on=Carbon::today()->format('Y-m-d');
                    $sub_task->end_date=Carbon::today()->format('Y-m-d');
                    $sub_task->save();
                    return ['status' => 'success', 'message' => 'This Sub task has marked Completed Successfully !!..'];
                }else{
                    return ['status' => 'success', 'message' => 'This Sub task has already marked Completed !!..'];
                }
            }
            if ($action == 'pick_up') {
                $idss = json_decode($sub_task->user_id);
                if (in_array($user->id, $idss)) {
                    return ['status' => 'success', 'message' => 'you are already in'];
                } else {
                    $arr = $idss;
                    array_push($arr, $user->id);
                    // return $task->user_id;
                    $sub_task->user_id = json_encode($arr);
                    $sub_task->save();
                    return ['status' => 'success', 'message' => 'Assigned yourself successfully'];
                }
            }
            
        } else {
            $task = Task::findOrFail($ids['task_id']);
            //  return $task->id;
            if ($action == 'copy') {
                $dupli = new Task;
                $dupli->heading =  $name;
                $dupli->tag = $task->tag;
                $dupli->company_id = $task->company_id;
                $dupli->description = $task->description;
                $dupli->user_id  = $task->user_id;
                $dupli->project_id  = $pro_id;
                $dupli->task_category_id  = $task->task_category_id;
                $dupli->priority  = $task->priority;
                $dupli->created_by  = $task->created_by;
                $dupli->team_id  = $task->team_id;
                $dupli->section_tiles  = $task->section_tiles;
                $dupli->est_hour = $task->est_hour;
                $dupli->board_column_id = $task->board_column_id;
                $dupli->column_priority = $task->column_priority;
                $dupli->start_date = $task->start_date;
                $dupli->due_date = $due_date;
                $dupli->save();
                return ['status' => 'success', 'message' => 'task Copied'];
            }
            if ($action == 'move') {
                $task->project_id=$pro_id;
                $task->due_date=$due_date;
                $task->heading= $name;
                $task->save();
                
            }
            if ($action == 'delete') {
                $this->destroy($ids['task_id']);
                return ['status'=>'success','message'=>'task deleted'];
            }
            if ($action == 'duplicate') {
               $dupli=new Task;
               $dupli->heading= $name;
               $dupli->tag=$task->tag;
               $dupli->company_id=$task->company_id;
               $dupli->description=$task->description;
               $dupli->user_id  = $task->user_id; 
               $dupli->project_id  = $task->project_id; 
               $dupli->task_category_id  = $task->task_category_id; 
               $dupli->priority  = $task->priority; 
               $dupli->created_by  = $task->created_by; 
               $dupli->team_id  = $task->team_id; 
               $dupli->section_tiles  = $task->section_tiles;
               $dupli->est_hour =$task->est_hour; 
               $dupli->board_column_id =$task->board_column_id; 
               $dupli->column_priority =$task->column_priority; 
               $dupli->start_date =$task->start_date;
               $dupli->due_date=$due_date;
               $dupli->save();
                return ['status' => 'success', 'message' => 'task duplicated'];
            }
            if ($action == 'mark_complete') {
                $one_incomplete=0;
                $all_sub_tasks=SubTask::where('task_id',$task->id)->get();
                foreach($all_sub_tasks as $sub){
                    if($sub->status=='incomplete'){
                        $one_incomplete=1;
                    }
                }
                if($one_incomplete==0){
                    $taskBoardColumn = TaskboardColumn::where('slug', 'completed')->first();
                    $task->board_column_id=$taskBoardColumn->id;
                    $task->status=$taskBoardColumn->column_name;
                    $task->completed_on=Carbon::today()->format('Y-m-d');
                    $task->save();
                    return ['status' => 'success', 'message' => 'Task been marked Complete.......'];
                }
                else{

                    return ['status' => 'success', 'message' => 'Not all SubTask been marked Complete.........'];
                }

            }
            if ($action == 'pick_up') {
                $idss = json_decode($task->user_id);
                if (in_array($user->id, $idss)) {
                    return ['status'=>'success','message' => 'you are already in'];
                } else {
                    $arr = $idss;
                    array_push($arr, $user->id);
                    // return $task->user_id;
                    $task->user_id = json_encode($arr);
                    $task->save();
                    return ['status'=>'success','message' => 'Assigned yourself successfully'];
                }
            }
        }
    }
    }
    public function take_action(Request $request){
       
        if(is_array($request->id)){
            foreach($request->id as $id){
                $response=$this->action_executer($id,$request->action,$request->pro_id,$request->due_date);
            }
        }
        else{
          $response = $this->action_executer($request->id, $request->action,$request->pro_id,$request->due_date,$request->name);
        }
        Session::put('put_data_session', 'true');
        return $response;
       
    }
    public function returnColumnView(Request $request){
        return view('admin.task_pro.show_column');
    }
   
   
    public function edit(Request $request)
    {
        $id=Reply::idFiler($request->id);
        $this->task = Task::findOrFail($id['task_id']);
        $this->projects = Project::all();
        $this->employees = User::allEmployees();
        $this->categories = TaskCategory::all();
        $this->taskBoardColumns = TaskboardColumn::all();
        $this->own=User::all();
        $this->teams = Team::all();
        $view = view('admin.task_pro.edit_pro', $this->data);
        $view = $view->render();
        return response($view);
    }

    public function update(StoreTask $request, $id)
    {
        $this->validate($request,[
            'heading' => 'required',

        ]);
      
        $task = Task::find($request->task_id);
        $task->heading = $request->heading;
        if ($request->description != '') {
            $task->description = $request->description;
        }
        $task->start_date = Carbon::parse($request->start_date)->format('Y-m-d');
        $task->due_date = Carbon::parse($request->due_date)->format('Y-m-d');
        if (isset($request->user_id)) {
            if (sizeof($request->user_id) > 0) {

                $task->user_id = json_encode($request->user_id);
            }
            else{
                return 'User Needed';
                exit();   
            }
        } 
        else{
            return 'User Needed';
            exit();
        }
        if (isset($request->team_id)) {
            if (sizeof($request->team_id) > 0) {

                $task->team_id = json_encode($request->team_id);
            }
        }

        $task->project_id = $request->project_id;
        $task->task_category_id = $request->category_id;
        $task->priority = $request->priority;
        $task->tag=$request->tag;
        $task->section_tiles=$request->section_tiles;

        
        if($request->own){
            $task->own=$request->own;
        }

        $task->save();

        //calculate project progress if enabled
        $this->calculateProjectProgress($request->project_id);

       

        if (!is_null($request->project_id)) {
            $this->logProjectActivity($request->project_id, __('messages.newTaskAddedToTheProject'));
        }

        //log search
        $this->logSearchEntry($task->id, 'Task ' . $task->heading, 'admin.all-tasks.edit');
        Session::put('put_data_session', 'true');

       
        return $task->id;
    }

    public function destroy($id)
    {
        $task = Task::findOrFail($id);
        Task::destroy($id);

        //calculate project progress if enabled
        $this->calculateProjectProgress($task->project_id);
        Session::put('put_data_session', 'true');
        return Reply::success(__('messages.taskDeletedSuccessfully'));
    }

    public function create()
    {
        $this->projects = Project::all();
        $this->employees = User::allEmployees();
        $this->categories = TaskCategory::all();
        $this->own=User::all();
        $this->teams = Team::all();
       // $view=view::make();
      //  return view('admin.task_pro.create_pro', $this->data);
        $view = view('admin.task_pro.create_pro', $this->data);
        $view = $view->render();
        return response($view);

    }
    public function save_task(Request $request){
        $this->validate($request,[
            'heading' => 'required',

        ]);
        $taskBoardColumn = TaskboardColumn::where('slug', 'incomplete')->first();
        $task = new Task();
        $task->heading = $request->heading;
        if ($request->description != '') {
            $task->description = $request->description;
        }
        $task->start_date = Carbon::parse($request->start_date)->format('Y-m-d');
        $task->due_date = Carbon::parse($request->due_date)->format('Y-m-d');
        if (isset($request->user_id)) {
            if (sizeof($request->user_id) > 0) {

                $task->user_id = json_encode($request->user_id);
            }
            else{
                return 'User Needed';
                exit();   
            }
        } 
        else{
            return 'User Needed';
            exit();
        }
        if (isset($request->team_id)) {
            if (sizeof($request->team_id) > 0) {

                $task->team_id = json_encode($request->team_id);
            }
        }

        $task->project_id = $request->project_id;
        $task->task_category_id = $request->category_id;
        $task->priority = $request->priority;
        $task->board_column_id = $taskBoardColumn->id;
        $task->created_by = $this->user->id;

        if ($request->board_column_id) {
            $task->board_column_id = $request->board_column_id;
        }

        if ($taskBoardColumn->slug == 'completed') {
            $task->completed_on = Carbon::now()->format('Y-m-d H:i:s');
        } else {
            $task->completed_on = null;
        }
        if($request->own){
            $task->own=$request->own;
        }

        $task->save();

        //calculate project progress if enabled
        $this->calculateProjectProgress($request->project_id);

        //      Send notification to user
       
        // if (sizeof($request->user_id) > 0) {
        //     foreach($request->user_id as $user_man){
        //         $notifyUser = User::withoutGlobalScope('active')->findOrFail($user_man);
        //     }
           
           
        // }
        // //  return $notifyUser;

        // try {
        //     $notifyUser->notify(new NewTask($task));
        // } catch (Exception $e) { }


        // if ($task->project_id != null) {
        //     if ($task->project->client_id != null && $task->project->allow_client_notification == 'enable') {
        //         $notifyUser = User::withoutGlobalScope('active')->findOrFail($task->project->client_id);
        //        // $notifyUser->notify(new NewClientTask($task));
        //     }
        // }

        if (!is_null($request->project_id)) {
            $this->logProjectActivity($request->project_id, __('messages.newTaskAddedToTheProject'));
        }

        //log search
        $this->logSearchEntry($task->id, 'Task ' . $task->heading, 'admin.all-tasks.edit');
        Session::put('put_data_session', 'true');

        // if ($request->board_column_id) {
        //     return Reply::redirect(route('admin.taskboard.index'), __('messages.taskCreatedSuccessfully'));
        // }
        return $task->id;
    }

    public function membersList($projectId)
    {
        $this->members = ProjectMember::byProject($projectId);
        $list = view('admin.tasks.members-list', $this->data)->render();
        return Reply::dataOnly(['html' => $list]);
    }

    public function store(StoreTask $request)
    {

        $taskBoardColumn = TaskboardColumn::where('slug', 'incomplete')->first();
        $task = new Task();
        $task->heading = $request->heading;
        if ($request->description != '') {
            $task->description = $request->description;
        }
        $task->start_date = Carbon::parse($request->start_date)->format('Y-m-d');
        $task->due_date = Carbon::parse($request->due_date)->format('Y-m-d');
        $task->user_id = $request->user_id;
        $task->project_id = $request->project_id;
        $task->task_category_id = $request->category_id;
        $task->priority = $request->priority;
        $task->board_column_id = $taskBoardColumn->id;
        $task->created_by = $this->user->id;

        if ($request->board_column_id) {
            $task->board_column_id = $request->board_column_id;
        }

        if ($taskBoardColumn->slug == 'completed') {
            $task->completed_on = Carbon::now()->format('Y-m-d H:i:s');
        } else {
            $task->completed_on = null;
        }

        $task->save();

        //calculate project progress if enabled
        $this->calculateProjectProgress($request->project_id);

        //      Send notification to user
        $notifyUser = User::withoutGlobalScope('active')->findOrFail($request->user_id);
        $notifyUser->notify(new NewTask($task));

        if ($task->project_id != null) {
            if ($task->project->client_id != null && $task->project->allow_client_notification == 'enable') {
                $notifyUser = User::withoutGlobalScope('active')->findOrFail($task->project->client_id);
                $notifyUser->notify(new NewClientTask($task));
            }
        }

        if (!is_null($request->project_id)) {
            $this->logProjectActivity($request->project_id, __('messages.newTaskAddedToTheProject'));
        }
        Session::put('put_data_session', 'true');
        //log search
        $this->logSearchEntry($task->id, 'Task ' . $task->heading, 'admin.all-tasks.edit');

        if ($request->board_column_id) {
            return Reply::redirect(route('admin.taskboard.index'), __('messages.taskCreatedSuccessfully'));
        }
        return Reply::redirect(route('admin.all-tasks.index'), __('messages.taskCreatedSuccessfully'));
    }

    public function ajaxCreate($columnId)
    {
        $this->projects = Project::all();
        $this->columnId = $columnId;
        $this->employees = User::allEmployees();
        return view('admin.tasks.ajax_create', $this->data);
    }

    public function remindForTask($taskID)
    {
        $task = Task::with('user')->findOrFail($taskID);

        // Send  reminder notification to user
        $notifyUser = $task->user;
        $notifyUser->notify(new TaskReminder($task));

        return Reply::success('messages.reminderMailSuccess');
    }

    public function show($id)
    {
        $this->task = Task::with('board_column')->findOrFail($id);
        $view = view('admin.tasks.show', $this->data)->render();
        return Reply::dataOnly(['status' => 'success', 'view' => $view]);
    }

    /**
     * @param $startDate
     * @param $endDate
     * @param $projectId
     * @param $hideCompleted
     */
    public function export($startDate=null, $endDate=null, $projectId=null, $hideCompleted=null)
    {
       
       
        Excel::create('WorkSuite', function($excel) {

            $excel->sheet('Task Table', function($sheet) {
        
                $sheet->loadView('admin.task_pro.exel');
        
            });
        
        })->download('xlsx');
    }

    public function do_sort(Request $request){
        $v_data=Session::get('view_array');
        $v_data=json_decode($v_data,true);
        $initial_arr=[];
        $task_id_arry=[];
        foreach($v_data as $key=>$value){
            array_push($task_id_arry,$key);
        }
        if($request->data=='project_name' || $request->data=='project_name' || $request->data=='client' || $request->data=='project_cat'){
            $niddle=$request->data;
            $str_arr=[];
            $tasks=DB::table('tasks')->join('projects','projects.id','=','tasks.project_id')
                                        ->whereIn('tasks.id', $task_id_arry)
                                        ->whereNotNull('projects.'.$request->data)
                                        ->select('tasks.id','projects.'.$request->data)->get();
            foreach($tasks as $value){
                $d=$request->data;
               // print_r($value->$d);
                $initial_arr[$value->$d]=$value->id;
               array_push($str_arr,$d);
            }
            print_r($initial_arr);

        }
        elseif($request->data=='status'){

        }
        else{

        }
    }

}