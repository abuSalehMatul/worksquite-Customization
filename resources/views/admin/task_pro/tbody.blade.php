@include('admin.task_pro.pro_table_css')
@php

    $v_data=App\ViewArray::where('user_id',Auth::user()->id)->first();
    $raw=$v_data;
    $v_data=$v_data->array;
    $v_data=json_decode($v_data,true);
    $task_category=DB::table('task_category')->get();
    $project_category=DB::table('project_category')
    //  print_r($v_data);
    //  exit();
   
@endphp
 <table>     
       
        <tbody>
            @if($v_data)
                @foreach($v_data as $pro_key=>$task_id)
                    @if($pro_key!=-100)
                        @php
                            
                            $pro=App\Project::find($pro_key);
                            $pro_cat=$pro->category;
                            $client=$pro->client
                        
                        @endphp
                            <tr style="width:10%"> <td colspan="8"><h3>{{$pro->project_phase}} </h3> </td> </tr>
                            @if($task_id)
                                @foreach($task_id as $task_key=>$sub_task)
                                    @php
                                        $task=App\Task::find($task_key);
                                        $task_cat=$task->category;
                                        $task_cat=$task_cat['category_name'];
                                        $board_data =\DB::table('tasks')
                                                
                                                    ->join('taskboard_columns', 'taskboard_columns.id', '=', 'tasks.board_column_id')
                                                    ->leftJoin('users as creator_user', 'creator_user.id', '=', 'tasks.created_by')
                                                    ->select('tasks.id', 'tasks.due_date','tasks.start_date', 'taskboard_columns.column_name', 'taskboard_columns.label_color','taskboard_columns.updated_at as board_updated_at','creator_user.image as created_image','creator_user.name as created_by','creator_user.image as created_image')
                                                    ->where('tasks.id','=',$task_key)
                                                    ->first();
                                        $users=App\User::whereIn('id',json_decode($task->user_id))->get();
                                        
                                    @endphp
                                    <tr draggable="true" id="<?php echo 'pro'.$pro->id.'task'.$task->id; ?>">    
                                            
                                    
                                        <td colspan="1">
                                        <i> <input class="float-left" type="checkbox" style="display:inline"> </i>
                                                                                        
                                        </td>
                                    
                                        
                                        <td class="dropdown">
                                            <i class="fas fa-caret-square-down dropdown"></i>
                                                <ul class="dropdown-content">
                                                    <li>Pick up</li>
                                                    <li>Mark complete</li>
                                                    <li>Duplicate</li>
                                                    <li>Move </li>
                                                    <li>Copy</li>
                                                    <li>Delete</li>
                                                </ul>  
                                            <i class="fas fa-redo"></i> 
                                            <input type="hidden" value="<?php echo 'pro'.$pro->id.'task'.$task->id; ?>" id="item" name="item">                   
                                        </td> 

                                        <td ondblclick="showSubTaskForm({{$task->id}})" onclick="show_sub_task(<?php echo json_encode($sub_task); ?>,{{$task->id}})"><i class="fa fa-plus-square @if(sizeof($sub_task)>0) green @endif" ></i>  {{$task->heading}} </td>
                                        <td></td>
                                        <td></td>
                                        @if($raw->is_project==1)  
                                        <td>{{$pro->project_name}}</td>
                                        @endif

                                        @if($raw->is_project_phase==1)
                                        <td>{{$pro->project_phase}}</td>
                                        @endif

                                        <td >{{$client}}</td>
                                        <td style="padding:0px 0px 11px 0px;">
                                            @if($users)
                                                @foreach($users as $user)
                                                        @if($user->image==null)
                                                            <img class="img-circle" width="20" src="{{asset('default-profile-3.png')}}">
                                                        @else 
                                                            <img class="img-circle" width="20" src="{{asset('user-uploads/avatar/'.$user->image)}}">
                                                        @endif
                                                
                                                @endforeach
                                            @endif
                                        </td>
                                        <td style="padding:0px 0px 11px 0px;">{{$board_data->created_by}}</td>
                                        <td>{{$pro->admin}}</td>
                                        @if($raw->is_start_date==1)
                                        <td>{{$board_data->start_date}}</td>
                                        @endif
                                        
                                        @if($raw->is_due_date==1)
                                        <td style="color:{{ App\Helper\Reply::measure_due($board_data->due_date)}};font-weight:500;">{{$board_data->due_date}}</td>
                                        @endif
                                        <td>Frequency </td>
                                        @if($raw->is_end_date==1)
                                            @if($board_data->column_name=='Completed')
                                            <td>{{$board_data->board_updated_at}}</td>
                                            @else 
                                            <td></td>
                                            @endif
                                        @endif
                                        
                                        <td>{{$task->priority}}</td>
                                        @if($raw->is_task_cat==1)
                                        <td>{{$task_cat}}</td>
                                        @endif
                                        @if($raw->is_project_cat==1)
                                        <td>{{$pro_cat->category_name}}</td>
                                        @endif
                                        @if($raw->is_est_hour==1)
                                        <td>{{$task->est_hour}}</td>
                                        @endif
                                        @if($raw->is_act_hour==1)
                                        <td>{{$task->act_hour}}</td>
                                        @endif
                                        @if($raw->is_created_at==1)
                                        <td>{{$task->created_at}}</td>
                                        @endif
                                        @if($raw->is_section_tiles==1)
                                        <td>{{$task->section_tiles}}</td>
                                        @endif
                                        @if($raw->is_tag==1)
                                        <td>{{$task->tag}}</td>
                                        @endif
                                        <td><span class="status" style="background-color:{{$board_data->label_color}}">{{$board_data->column_name}}</span></td> 
                                    </tr>
                                    <tr id="sub_task_input">

                                    </tr>
                                    @if($sub_task)
                                        @foreach($sub_task as $sub_task)
                                        @php
                                            $sub=App\SubTask::find($sub_task);
                                        @endphp
                                            <tr style="display:none" id="task{{$task->id}}sub{{$sub_task}}" >
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            
                                                <td>{{$sub->title}}</td>
                                                <td>check list</td>
                                                @if($raw->is_project==1)  
                                                <td>{{$pro->project_name}}</td>
                                                @endif
                                                @if($raw->is_project_phase==1)
                                                <td>{{$pro->project_phase}}</td>
                                                @endif
                                                <td>{{$client}}</td>
                                                <td>{{$sub->assignee}}</td>
                                                <td>{{$board_data->created_by}}</td>
                                                <td>{{$pro->admin}} </td>
                                                @if($raw->is_start_date==1)
                                                <td>{{$sub->start_date}}</td>
                                                @endif
                                                @if($raw->is_due_date==1)
                                                <td style="color:{{ App\Helper\Reply::measure_due($board_data->due_date)}};font-weight:500;">{{$sub->due_date}}</td>
                                                @endif
                                                <td></td>
                                                @if($raw->is_end_date==1)
                                                    @if($sub->status=='Completed')
                                                    <td>{{$sub->board_updated_at}}</td>
                                                    @else 
                                                    <td></td>
                                                    @endif
                                                @endif
                                                <td>{{$sub->priority}}</td>
                                                @if($raw->is_task_cat==1)
                                                <td></td>
                                                @endif
                                                @if($raw->is_project_cat==1)
                                                <td></td>
                                                @endif
                                                @if($raw->is_est_hour==1)
                                                <td>{{$sub->est_hour}}</td>
                                                @endif
                                                @if($raw->is_act_hour==1)
                                                <td>{{$sub->act_hour}}</td>
                                                @endif
                                                @if($raw->is_created_at==1)
                                                <td>{{$sub->created_at}}</td>
                                                @endif
                                                @if($raw->is_section_tiles==1)
                                                <td></td>
                                                @endif
                                                @if($raw->is_tag==1)
                                                <td>{{$sub->tag}}</td>
                                                @endif
                                                <td>{{$sub->status}}</td>
                                            </tr>
                                        @endforeach
                                    @endif
                                @endforeach
                            @endif
                        <tr>
                            <td id="taskform" >
                                <input type="hidden" id="projectID" value="{{$pro->id}}">
                                &nbsp;
                            </td>
                        </tr>
                        <tr id="task_input">

                        </tr>
                    @else 
                    {{-- project of null id --}}
                       
                            <tr style="width:10%"> <td colspan="8"><h3>No Project Phase </h3> </td> </tr>
                            @if($task_id)
                                @foreach($task_id as $task_key=>$sub_task)
                                    @php
                                        $task=App\Task::find($task_key);
                                        $task_cat=$task->category;
                                        $task_cat=$task_cat['category_name'];
                                        $board_data =\DB::table('tasks')
                                                
                                                    ->join('taskboard_columns', 'taskboard_columns.id', '=', 'tasks.board_column_id')
                                                    ->leftJoin('users as creator_user', 'creator_user.id', '=', 'tasks.created_by')
                                                    ->select('tasks.id', 'tasks.due_date','tasks.start_date', 'taskboard_columns.column_name', 'taskboard_columns.label_color','taskboard_columns.updated_at as board_updated_at','creator_user.image as created_image','creator_user.name as created_by','creator_user.image as created_image')
                                                    ->where('tasks.id','=',$task_key)
                                                    ->first();
                                        $users=App\User::whereIn('id',json_decode($task->user_id))->get();
                                        
                                    @endphp
                                    <tr draggable="true" id="<?php echo 'pro-100'.'task'.$task->id; ?>">    
                                            
                                    
                                        <td colspan="1">
                                        <i> <input class="float-left" type="checkbox" style="display:inline"> </i>
                                                                                        
                                        </td>
                                    
                                        
                                        <td class="dropdown">
                                            <i class="fas fa-caret-square-down dropdown"></i>
                                                <ul class="dropdown-content">
                                                    <li>Pick up</li>
                                                    <li>Mark complete</li>
                                                    <li>Duplicate</li>
                                                    <li>Move </li>
                                                    <li>Copy</li>
                                                    <li>Delete</li>
                                                </ul>  
                                            <i class="fas fa-redo"></i> 
                                            <input type="hidden" value="<?php echo 'pro-100'.'task'.$task->id; ?>" id="item" name="item">                   
                                        </td> 

                                        <td ondblclick="showSubTaskForm({{$task->id}})" onclick="show_sub_task(<?php echo json_encode($sub_task); ?>,{{$task->id}})"><i class="fa fa-plus-square @if(sizeof($sub_task)>0) green @endif" ></i>  {{$task->heading}} </td>
                                        <td></td>
                                        <td></td>
                                        @if($raw->is_project==1)  
                                        <td></td>
                                        @endif

                                        @if($raw->is_project_phase==1)
                                        <td></td>
                                        @endif

                                        <td ></td>
                                        <td style="padding:0px 0px 11px 0px;">
                                            @if($users)
                                                @foreach($users as $user)
                                                        @if($user->image==null)
                                                            <img class="img-circle" width="20" src="{{asset('default-profile-3.png')}}">
                                                        @else 
                                                            <img class="img-circle" width="20" src="{{asset('user-uploads/avatar/'.$user->image)}}">
                                                        @endif
                                                
                                                @endforeach
                                            @endif
                                        </td>
                                        <td style="padding:0px 0px 11px 0px;">{{$board_data->created_by}}</td>
                                        <td></td>
                                        @if($raw->is_start_date==1)
                                        <td>{{$board_data->start_date}}</td>
                                        @endif
                                        
                                        @if($raw->is_due_date==1)
                                        <td style="color:{{ App\Helper\Reply::measure_due($board_data->due_date)}};font-weight:500;">{{$board_data->due_date}}</td>
                                        @endif
                                        <td>Frequency </td>
                                        @if($raw->is_end_date==1)
                                            @if($board_data->column_name=='Completed')
                                            <td>{{$board_data->board_updated_at}}</td>
                                            @else 
                                            <td></td>
                                            @endif
                                        @endif
                                        
                                        <td>{{$task->priority}}</td>
                                        @if($raw->is_task_cat==1)
                                        <td>{{$task_cat}}</td>
                                        @endif
                                        @if($raw->is_project_cat==1)
                                        <td></td>
                                        @endif
                                        @if($raw->is_est_hour==1)
                                        <td>{{$task->est_hour}}</td>
                                        @endif
                                        @if($raw->is_act_hour==1)
                                        <td>{{$task->act_hour}}</td>
                                        @endif
                                        @if($raw->is_created_at==1)
                                        <td>{{$task->created_at}}</td>
                                        @endif
                                        @if($raw->is_section_tiles==1)
                                        <td>{{$task->section_tiles}}</td>
                                        @endif
                                        @if($raw->is_tag==1)
                                        <td>{{$task->tag}}</td>
                                        @endif
                                        <td><span class="status" style="background-color:{{$board_data->label_color}}">{{$board_data->column_name}}</span></td> 
                                    </tr>
                                    <tr id="sub_task_input">

                                    </tr>
                                    @if($sub_task)
                                        @foreach($sub_task as $sub_task)
                                        @php
                                            $sub=App\SubTask::find($sub_task);
                                        @endphp
                                            <tr style="display:none" id="task{{$task->id}}sub{{$sub_task}}" >
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            
                                                <td>{{$sub->title}}</td>
                                                <td>check list</td>
                                                @if($raw->is_project==1)  
                                                <td></td>
                                                @endif
                                                @if($raw->is_project_phase==1)
                                                <td></td>
                                                @endif
                                                <td></td>
                                                <td>{{$sub->assignee}}</td>
                                                <td>{{$board_data->created_by}}</td>
                                                <td> </td>
                                                @if($raw->is_start_date==1)
                                                <td>{{$sub->start_date}}</td>
                                                @endif
                                                @if($raw->is_due_date==1)
                                                <td style="color:{{ App\Helper\Reply::measure_due($board_data->due_date)}};font-weight:500;">{{$sub->due_date}}</td>
                                                @endif
                                                <td></td>
                                                @if($raw->is_end_date==1)
                                                    @if($sub->status=='Completed')
                                                    <td>{{$sub->board_updated_at}}</td>
                                                    @else 
                                                    <td></td>
                                                    @endif
                                                @endif
                                                <td>{{$sub->priority}}</td>
                                                @if($raw->is_task_cat==1)
                                                <td></td>
                                                @endif
                                                @if($raw->is_project_cat==1)
                                                <td></td>
                                                @endif
                                                @if($raw->is_est_hour==1)
                                                <td>{{$sub->est_hour}}</td>
                                                @endif
                                                @if($raw->is_act_hour==1)
                                                <td>{{$sub->act_hour}}</td>
                                                @endif
                                                @if($raw->is_created_at==1)
                                                <td>{{$sub->created_at}}</td>
                                                @endif
                                                @if($raw->is_section_tiles==1)
                                                <td></td>
                                                @endif
                                                @if($raw->is_tag==1)
                                                <td>{{$sub->tag}}</td>
                                                @endif
                                                <td>{{$sub->status}}</td>
                                            </tr>
                                        @endforeach
                                    @endif
                                @endforeach
                            @endif
                        <tr>
                            <td id="taskform" >
                                <input type="hidden" id="projectID" value="@if($pro_key!=-100)-100@else{{$pro->id}}@endif">
                                &nbsp;
                            </td>
                        </tr>
                        <tr id="task_input">

                        </tr>
                    {{-- end of project of null id --}}
                    @endif
                @endforeach
            @endif
        </tbody>

 </table>