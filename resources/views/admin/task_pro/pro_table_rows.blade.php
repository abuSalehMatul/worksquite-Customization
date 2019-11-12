
@php

    $raw=App\ViewArray::where('user_id',Auth::user()->id)->first();
    $v_data=Session::get('view_array');
    $v_data=json_decode($v_data,true);
    if(empty(Session::get('change_num_record_to_show'))){
        $change_num_record_to_show=sizeof($v_data);
    }else{

        $change_num_record_to_show=Session::get('change_num_record_to_show');
    }
    $v_data_size=sizeof($v_data);
    $task_category=DB::table('task_category')->get();
    $project_category=App\ProjectCategory::distinct()->get(['category_name','id']);
    $group_by=$raw->group_by_column;
    $group_name[0]='No Group';
    // print_r($v_data);
    //  exit();
    $uu=Auth::user();
    $show_empty_row=0;
   $num_of_loop_occurrence=0;
   $show_last_occurrence_empty_row=false;
   $total_client=Session::get('total_client');
   $total_assignee=Session::get('total_assignee');
   $total_assignee=json_decode($total_assignee,true);
   $total_client=json_decode($total_client,true);

   
@endphp
<div class="summernote">

</div>
<div class="card">

</div>
    <table class="vgt-table  default table"  id="old_table" >       
        <thead>
            <tr>          
                <th class="" colspan="2"  >
                    <div>

                   
                    <i> <input class="float-left " onclick="checked_id('mass')" id="checkedAllcheck" type="checkbox" style="display:inline;float:left"> </i>
                 
                {{-- </th> 
                <th >   --}}
                    <span class="dropdown">
                        <i style="cursor:pointer;display:inline;float:right" id="caret_pointer" onclick="$('#ul_mass').show();" class="fas fa-caret-down dropdown"></i>
                        <ul id="ul_mass" style="display:none" class="dropdown-content">
                            <li onclick="massaction('pick_up')">Pick up</li>
                            <li onclick="massaction('mark_complete')">Mark complete</li>
                            <li onclick="massactionOnproject('duplicate')">Duplicate</li>
                            <li onclick="massactionOnproject('move')">Move </li>
                            <li onclick="massactionOnproject('copy')">Copy</li>
                            <li onclick="massaction('delete')">Delete</li>
                        </ul>
                    </span>
                     </div>
                </th>
                
                <th class="vgt-left-align" style="min-width: 200px; max-width: 200px; width: 200px;">Task
                    <i class="fas fa-sort-up" onclick="do_sort('asc','heading')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','heading')"></i>
                    <br><input class="searchable filter-th vgt-input vgt-pull-left" onkeyup="searcher('tasksearcher','string')" id="tasksearcher" type="text">
                </th>
                <th class="vgt-left-align" style="min-width: auto; width: auto;">Sub Task
                   
                    <br>
                </th> 
                <th class="vgt-left-align" style="min-width: 80px; max-width: 80px; width: 80px;">#Check List
                    <i class="sort-by"></th>
                @if($raw->is_project==1)   
                <th class="vgt-left-align" style="min-width: 200px; max-width: 200px; width: 200px;">Project
                    <i class="fas fa-sort-up" onclick="do_sort('asc','project_name')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','project_name')"></i>
                    <br><input class="filter-th vgt-input searchable" onkeyup="searcher('projectsearcher','string')" id="projectsearcher" type="text">
                </th>
                @endif
                @if($raw->is_project_phase==1)
                <th class="vgt-left-align" style="min-width: 200px; max-width: 200px; width: 200px;">Project Phase
                    <i class="fas fa-sort-up" onclick="do_sort('asc','project_phase')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','project_phase')"></i>
                    <br><input class="filter-th vgt-input searchable" onkeyup="searcher('projectphasesearcher','string')" id="projectphasesearcher" type="text">
                </th>
                @endif
                <th class="vgt-left-align" style="min-width: 150px; max-width: 150px; width: 150px;">Client
                    <i class="fas fa-sort-up" onclick="do_sort('asc','client')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','client')"></i>
                    <br>
                    {{-- <input class="filter-th vgt-inputsearchable searchable" onkeyup="searcher('clientsearcher','string')"  id="clientsearcher" type="text"> --}}
                    <select class="filter-th vgt-input searchable" name="" id="clientsearcher" onchange="searcher('clientsearcher','string')">
                        <option value="all">All</option>
                        @if($total_client)
                            @foreach($total_client as $asgn)
                                @php
                                    $get_user=App\User::find($asgn);

                                @endphp
                                 <option value="{{$get_user->id}}">{{$get_user->name}}</option>
                            @endforeach
                       
                        @endif
                    </select>
                    
                </th>
                <th class="vgt-left-align" style="min-width: 150px; max-width: 150px; width: 150px;">Assignee
                    <i class="fas fa-sort-up" onclick="do_sort('asc','assignee')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','assignee')"></i>
                    <br>
                    {{-- <input class="filter-th vgt-input searchable"  onkeyup="searcher('assigneesearcher','string')"  id="assigneesearcher" type="text"> --}}
                     <select class="filter-th vgt-input searchable" name="" id="assigneesearcher" onchange="searcher('assigneesearcher','string')">
                        <option value="all">All</option>
                        @if($total_assignee)
                            @foreach($total_assignee as $asgn)
                                @php
                                    $get_user=App\User::find($asgn);

                                @endphp
                                 <option value="{{$get_user->id}}">{{$get_user->name}}</option>
                            @endforeach
                       
                        @endif
                    </select>
                   
                </th>
                <th class="vgt-left-align" style="min-width: auto; width: auto;">Assigner
                    <i class="fas fa-sort-up" onclick="do_sort('asc','assigner')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','assigner')"></i>
                </th>
                <th class="vgt-left-align" style="min-width: auto; width: auto;">Own
                    <i class="fas fa-sort-up" onclick="do_sort('asc','own')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','own')"></i>
                </th>
                @if($raw->is_start_date==1)
                <th class="vgt-left-align" style="min-width: 120px; max-width: 120px; width: 120px;">Start Date
                    <i class="fas fa-sort-up" onclick="do_sort('asc','start_date')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','start_date')"></i>
                    <br><input  class="filter-th vgt-input searchable" onchange="searcher('startdatesearcher','date')" id="startdatesearcher" type="date" value="{{ \Carbon\Carbon::today()->subDays(15)->format('Y-m-d') }}">
                </th>
                @endif
                @if($raw->is_due_date==1)
                <th class="vgt-left-align" style="min-width: 120px; max-width: 120px; width: 120px;">Due Date
                    <i class="fas fa-sort-up" onclick="do_sort('asc','due_date')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','due_date')"></i>
                    <br><input  class="filter-th vgt-input searchable" onchange="searcher('duedatesearcher','date')" id="duedatesearcher" type="date" ">
                </th>
                @endif
                <th class="vgt-left-align" style="min-width: auto; width: auto;">Frequency
                    <i class="fas fa-sort-up" onclick="do_sort('asc','frequency')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','frequency')"></i>
                    <br>
                    {{-- <input class="searchable" onkeyup="searcher('frequencysearcher')" id="frequencysearcher" type="text"> --}}
                    <select class="filter-th vgt-input searchable" name="" id="frequencysearcher" onchange="searcher('frequencysearcher','string')">
                        <option value="all">All</option>
                        <option value="daily">Daily</option>
                        <option value="monthly">Monthly</option>
                        <option value="yearly">Yearly</option>
                    </select>
                </th>
                @if($raw->is_end_date==1)
                <th class="vgt-left-align" style="min-width: 120px; max-width: 120px; width: 120px;">End Date
                    <i class="fas fa-sort-up" onclick="do_sort('asc','end_date')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','end_date')"></i>
                    <br><input  class="filter-th vgt-input searchable" onchange="searcher('enddatesearcher','date')" id="enddatesearcher" type="date" value="{{ \Carbon\Carbon::today()->addDays(15)->format('Y-m-d') }}">
                </th>
                @endif
                <th class="vgt-left-align" style="min-width: auto; width: auto;">Priority
                    <i class="fas fa-sort-up" onclick="do_sort('asc','priority')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','priority')"></i>
                    <br><input class="searchable" onkeyup="searcher('prioritysearcher','string')" id="prioritysearcher" type="text">
                </th>
                @if($raw->is_task_cat==1)
                <th class="vgt-left-align" style="min-width: 150px; max-width: 150px; width: 150px;">Task Cat
                    <i class="fas fa-sort-up" onclick="do_sort('asc','task_cat')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','task_cat')"></i>
                    <br>
                    <select class="filter-th vgt-input searchable" onchange="searcher('taskcatsearcher','hour')" id="taskcatsearcher">
                        <option value="all">All</option>
                        @if($task_category)
                            @foreach ($task_category as $item)
                                <option value="{{$item->id}}">{{$item->category_name}}</option>
                            @endforeach
                        @endif
                    </select>
                    
                    {{-- <input class="searchable" onkeyup="searcher('taskcatsearcher','string')" id="taskcatsearcher" type="text"> --}}
                </th>
                @endif
                @if($raw->is_project_cat==1)
                <th class="vgt-left-align" style="min-width: 150px; max-width: 150px; width: 150px;">Project Cat
                    <i class="fas fa-sort-up" onclick="do_sort('asc','project_cat')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','project_cat')"></i>
                    <br>
                    {{-- <input class="searchable" onkeyup="searcher('projectcatsearcher','string')" id="projectcatsearcher" type="text"> --}}
                    <select class="filter-th vgt-input searchable" onchange="searcher('projectcatsearcher','hour')" id="projectcatsearcher">
                       <option value="all">All</option>
                        @if($project_category)
                             @foreach ($project_category as $item)
                                <option value="{{$item->category_name}}">{{$item->category_name}}</option>
                            @endforeach
                        @endif
                    </select>
                </th>
                @endif
                @if($raw->is_est_hour==1)
                <th class="vgt-left-align" style="min-width: auto; width: auto;">EST Hours
                    <i class="fas fa-sort-up" onclick="do_sort('asc','est_hour')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','est_hour')"></i>
                    <br><input class="filter-th vgt-input searchable" onkeyup="searcher('esthoursearcher','hour')" id="esthoursearcher" type="text">
                </th>
                @endif
                @if($raw->is_act_hour==1)
                <th class="vgt-left-align" style="min-width: auto; width: auto;">Actual Hours
                    <i class="fas fa-sort-up" onclick="do_sort('asc','act_hour')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','act_hour')"></i>
                    <br><input class="filter-th vgt-input searchable" onkeyup="searcher('acthoursearcher','hour')" id="acthoursearcher" type="text">
                </th>
                @endif
                @if($raw->is_created_at==1)
                <th class="vgt-left-align" style="min-width: 120px; max-width: 120px; width: 120px;">Created at
                    <i class="fas fa-sort-up" onclick="do_sort('asc','created_at')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','created_at')"></i>
                    <br><input style="width:60%" class="filter-th vgt-input searchable" onchange="searcher('createdatsearcher','date')" id="createdatsearcher" type="date" value="{{ \Carbon\Carbon::today()->subDays(15)->format('Y-m-d') }}">
                </th>
                @endif
                @if($raw->is_section_tiles==1)
                <th class="vgt-left-align" style="min-width: auto; width: auto;">Section Tiles
                    <i class="fas fa-sort-up" onclick="do_sort('asc','section_tile')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','section_tile')"></i>
                    <br><input class="filter-th vgt-input searchable" onkeyup="searcher('sectionsearcher','string')" id="sectionsearcher" type="text">
                </th>
                @endif
                @if($raw->is_tag==1)
                <th class="vgt-left-align" style="min-width: auto; width: auto;">Tags
                    <i class="fas fa-sort-up" onclick="do_sort('asc','tag')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','tag')"></i>
                    <br><input class="filter-th vgt-input searchable" onkeyup="searcher('tagsearcher','string')" id="tagsearcher" type="text">
                </th>
                @endif
                <th class="vgt-left-align" style="min-width: auto; width: auto;">Status
                    <i class="fas fa-sort-up" onclick="do_sort('asc','status')" style=" font-size: 15px !important;"></i><i style=" font-size: 15px !important;" class="fas fa-sort-down" onclick="do_sort('desc','status')"></i>
                    <br>
                    {{-- <input class="searchable" onkeyup="searcher('statussearcher','string')" id="statussearcher" type="text"> --}}
                    <select class="filter-th vgt-input searchable" onchange="searcher('statussearcher','string')" id="statussearcher">
                        <option value="all">All</option>
                        <option value="Complete">Complete</option>
                        <option value="Incomplete">Incomplete</option>
                        <option value="Working">Working</option>
                    </select>
                </th> 
            </tr>
        </thead>

        <tbody class="row_position" id="sortable-table" >
            @if($v_data)
                @foreach($v_data as $task_id=>$sub_task)
                  
                    @php
                        
                        
                        $task=App\Task::find($task_id);
                        if($raw->hide_show_completed==0){
                            if($task->status=='completed'){continue;}
                        }
                        $pro=App\Project::find($task->project_id);
                        $pro_cat='';
                        $client='';
                        if($pro){
                             $pro_cat=$pro->category;
                            $client=$pro->client;
                        }
                       
                        $task_cat=$task->category;
                        $task_cat=$task_cat['category_name'];
                        
                        $board_data =\DB::table('tasks')
                                            
                                                ->join('taskboard_columns', 'taskboard_columns.id', '=', 'tasks.board_column_id')
                                                ->leftJoin('users as creator_user', 'creator_user.id', '=', 'tasks.created_by')
                                                ->select('tasks.id', 'tasks.due_date','tasks.start_date', 'taskboard_columns.column_name', 'taskboard_columns.label_color','taskboard_columns.updated_at as board_updated_at','creator_user.image as created_image','creator_user.name as created_by','creator_user.image as created_image')
                                                ->where('tasks.id','=',$task_id)
                                                ->first();
                        if($task->user_id!=null){
                            $users=App\User::whereIn('id',json_decode($task->user_id))->get();
                        }  
                        if($task->team_id!=null){

                        }   
                        $show_group_row=0;
                        $group_by_for_row=App\Helper\Task_builder::get_group_by($task_id,$raw->group_by_column,$raw->group_by_table);                   
                        if($group_name[0]!=$group_by_for_row ){
                            $group_name[0]=$group_by_for_row;
                            $show_group_row=1;
                           
                            
                        }

                        
                        
                    @endphp
                     {{-- empty row --}}
                            @php
                                $num_of_loop_occurrence++;
                                if($num_of_loop_occurrence== sizeof($v_data)){
                                    $show_last_occurrence_empty_row=true;
                                }
                                $random=rand(0,5000);
                                
                              
                            @endphp
                            @if($show_group_row==1 && $show_empty_row==1) 
                            <tr id="taskform{{$random}}" ondblclick="showTaskform({{$random}})">
                                <td  ondblclick="showTaskform({{$random}})" >
                                
                                    &nbsp;
                                    <td colspan="10" id="hidethen{{$random}}"><h6  ondblclick="showTaskform({{$random}})">Create A task by double clicking here</h6></td>
                                    
                                    
                                </td>
                            </tr>
                            <tr style="display:none" id="taskformdata{{$random}}">
                                @include('admin.task_pro.pro_task_input')
                            </tr>
                            @endif
                            @php
                                $show_empty_row=1;
                            @endphp




                    {{-- group row printing --}}
                            @if($show_group_row==1)
                             <tr style="width:10%; padding-left: 20px;" class="kmneki vgt-left-align vgt-row-header" id="{{$group_name[0]}}"> <td colspan="8"><h4 class="pro_phase">{{$group_name[0]}} </h4> </td> </tr>
                            @endif
                            @php
                                $id_value='task'.$task->id.'subTask-100';
                            @endphp
                        {{-- row printing --}}
                            <tr draggable="true"  class="@if($task->is_recurrence=='yes')field-tip @endif kmneki original_row" @if($task->is_future_task=='yes') style="background: beige" @endif  id="<?php echo 'task'.$task->id.'subTask-100'; ?>">    
                                    
                            
                                <td colspan="1">
                                <i> <input class="float-left checkSingle" onchange="checked_id('<?php echo $id_value;?>')" type="checkbox" style="display:inline"/> </i>
                                                                                
                                </td>
                            
                                
                                <td class="dropdown">
                                    <i class="fas fa-caret-square-down dropdown" onclick="$('#ul_single_row{{$id_value}}').show();"></i>
                                        <ul class="dropdown-content" id="ul_single_row{{$id_value}}" style="overflow:scroll">
                                            <li onclick="action('pick_up','{{$id_value}}')">Pick up</li>
                                            <li onclick="edit_single_task('{{$id_value}}')">Edit</li>
                                            <li  onclick="action('mark_complete','{{$id_value}}')">Mark complete</li>
                                            <li  onclick="actionOnproject('duplicate','{{$id_value}}')">Duplicate</li>
                                            <li  onclick="actionOnproject('move','{{$id_value}}')">Move </li>
                                            <li onclick="actionOnproject('copy','{{$id_value}}')">Copy</li>
                                            <li onclick="action('delete','{{$id_value}}')">Delete</li>
                                            <li onclick="recurrence('{{$id_value}}')">Recurrence</li>
                                            <li onclick="showSubTaskForm('{{$task->id}}')">Create SubTask</li>
                                        </ul>  
                                    @if($task->is_recurrence=='yes')    
                                    <i class="fas fa-redo " onclick="calculate_future({{$task->id}})">
                                         <span class="tip-content" style="font-weight:900">Calculating Future Recurrence....</span>
                                    </i> 
                                    @endif
                                    <input type="hidden" value="<?php echo 'task'.$task->id.'subTask-100'; ?>" id="item" name="item">                   
                                </td> 

                                <td ondblclick="$('#quickform{{$id_value}}task').show();$('#quickform{{$id_value}}taski').hide();"  
                                onclick="show_sub_task(<?php echo json_encode($sub_task); ?>,{{$task->id}});">
                                <i class="fa fa-plus-square" @if(sizeof($sub_task)==0) style="display:none" @endif  ></i>
                                    <i class="task-heading" id="quickform{{$id_value}}taski"> 
                                        {{$task->heading}}
                                       
                                    </i>  
                                    <input type="text" class="form-control"
                                    value="{{$task->heading}}"style="display:none;"
                                     id="quickform{{$id_value}}task" 
                                     onkeydown="if(event.keyCode === 13)
                                     {event.preventDefault();
                                     quickchange('quickform{{$id_value}}task','{{$id_value}}','heading');}">
                                </td>
                                <td>
                                    @if(sizeof($sub_task)>0)
                                        {{sizeof($sub_task)}}
                                    @endif
                                </td>
                                <td></td>
                                @if($raw->is_project==1)  
                                <td ondblclick="$('#quickform{{$id_value}}pro').show();$('#quickform{{$id_value}}proi').hide();">
                                    @if($pro)
                                     <span id="quickform{{$id_value}}proi">{{$pro->project_name}}</span>
                                     <input type="text" class="form-control"
                                      value="{{$pro->project_name}}" style="display:none;" 
                                      id="quickform{{$id_value}}pro"
                                      onkeydown="if(event.keyCode === 13)
                                     {event.preventDefault();
                                     quickchange('quickform{{$id_value}}pro','{{$id_value}}','project_name');}">
                                    @endif
                                </td>
                                @endif

                                @if($raw->is_project_phase==1)
                                <td ondblclick="$('#quickform{{$id_value}}pro_phase').show();$('#quickform{{$id_value}}pro_phasei').hide();">
                                    @if($pro)
                                    <span id="quickform{{$id_value}}pro_phasei">{{$pro->project_phase}}</span>
                                    
                                    <input type="text" class="form-control" 
                                    value="{{$pro->project_phase}}" style="display:none;" 
                                    id="quickform{{$id_value}}pro_phase"
                                    onkeydown="if(event.keyCode === 13)
                                     {event.preventDefault();
                                     quickchange('quickform{{$id_value}}pro_phase','{{$id_value}}','project_phase');}">
                                    @endif
                                </td>
                                @endif

                                <td ondblclick="$('#quickform{{$id_value}}client').show();$('#quickform{{$id_value}}clienti').hide();">
                                    <span id="quickform{{$id_value}}clienti">
                                        @if($client)
                                         {{$client->name}}
                                        @endif 
                                    </span>
                                   <select type="text" class="form-control" value="{{$client}}"
                                    style="display:none;" id="quickform{{$id_value}}client"
                                    onkeydown="if(event.keyCode === 13)
                                     {event.preventDefault();
                                     quickchange('quickform{{$id_value}}client','{{$id_value}}','client_id');}">
                                        @php
                                          $all_clents_in=App\User::allClients();  
                                        @endphp
                                        @if($all_clents_in)
                                        @foreach($all_clents_in as $ac)
                                            <option value="{{$ac->id}}">{{$ac->name}}</option>
                                        @endforeach
                                        @endif
                                    </select>
                                </td>
                                <td style="padding:0px 0px 11px 0px;">
                                    @if($users)
                                        @foreach($users as $user)
                                               
                                            <i>{{$user->name}}, </i>
                                        @endforeach
                                    @endif
                                    @if($task->team_id!=null)
                                    @php
                                         $team_ids=json_decode($task->team_id);
                                    @endphp
                                   
                                        @foreach ($team_ids as $team_item)
                                        @php
                                            $get_team=App\Team::find($team_item);
                                        @endphp
                                            <h6 style="display: inline;border-radius: 46%;padding: 4px;color: blue;font-weight: 500;background: burlywood;">{{$get_team->team_name}}</h6> 
                                        @endforeach
                                    @endif
                                </td>
                                <td style="padding:0px 0px 11px 0px;">
                                   
                                    <i>{{$board_data->created_by}} </i>
                                    
                                </td>
                                <td>{{$task->own}}</td>
                                @if($raw->is_start_date==1)
                                <td contenteditable='true'>
                                    {{$board_data->start_date}}
                                </td>
                                @endif
                                
                                @if($raw->is_due_date==1)
                                <td ondblclick="$('#quickform{{$id_value}}due_date').show();$('#quickform{{$id_value}}due_datei').hide();"
                                style="color:{{ App\Helper\Reply::measure_due($board_data->due_date)}};font-weight:500;">
                                    <span id="quickform{{$id_value}}due_datei">{{$board_data->due_date}}</span>
                                    <input type="date" value="{{$board_data->due_date}}" style="display:none" id="quickform{{$id_value}}due_date"
                                    onkeydown="if(event.keyCode === 13)
                                    {event.preventDefault();
                                    quickchange('quickform{{$id_value}}due_date','{{$id_value}}','due_date');}" >
                                </td>
                                @endif
                                <td>
                                    @php
                                        $frequency='';
                                        $parent=App\TaskRecurrencePattern::where('task_id',$task->id)->first();
                                       
                                        if($parent){
                                           $pattern=App\RecurrencePattern::find($parent->pattern_id);
                                          
                                            if($pattern){
                                            $frequency=$pattern->recurring_type;
                                            }
                                         
                                        }
                                    @endphp
                                    {{$frequency}}
                                </td>
                                @if($raw->is_end_date==1)
                                    @if($task->completed_on!='')
                                    <td>{{$task->completed_on}}</td>
                                    @else 
                                    <td></td>
                                    @endif
                                @endif
                                
                                <td ondblclick="$('#quickform{{$id_value}}priority').show();$('#quickform{{$id_value}}priorityi').hide();">
                                    <span id="quickform{{$id_value}}priorityi">
                                         {{$task->priority}}
                                    </span>
                                     <div class="form-group" id="quickform{{$id_value}}priority" style="display:none" >
                                      

                                        <div class="radio radio-danger">
                                            <input type="radio" name="priority" id="radioquickchangehign"  onclick="
                                            quickchange('radioquickchangehign','{{$id_value}}','priority');" 
                                                    value="high">
                                            <label for="radio13" class="text-danger">
                                                @lang('modules.tasks.high') </label>
                                        </div>
                                        <div class="radio radio-warning">
                                            <input type="radio" name="priority"  onclick="
                                            quickchange('radioquickchangemedium','{{$id_value}}','priority');" 
                                                    id="radioquickchangemedium" checked value="medium">
                                            <label for="radio14" class="text-warning">
                                                @lang('modules.tasks.medium') </label>
                                        </div>
                                        <div class="radio radio-success">
                                            <input type="radio" name="priority" id="radioquickchangelow" onclick="
                                            quickchange('radioquickchangelow','{{$id_value}}','priority');"  
                                                    value="low">
                                            <label for="radio15" class="text-success">
                                                @lang('modules.tasks.low') </label>
                                        </div>
                                    </div>
                                   
                                </td>
                                @if($raw->is_task_cat==1)
                                <td ondblclick="$('#quickform{{$id_value}}task_cat').show();$('#quickform{{$id_value}}task_cati').hide();">
                                    <span id="quickform{{$id_value}}task_cati"> {{$task_cat}}</span>
                                    
                                       
                                        <select id="quickform{{$id_value}}task_cat"  style="display:none"  
                                        class="selectpicker form-control task_input_field" 
                                        onkeydown="
                                        quickchange('quickform{{$id_value}}task_cat','{{$id_value}}','task_category_id');"
                                        >
                                            @if($task_category)   
                                            @foreach($task_category as $category)
                                                <option value="{{ $category->id }}"   >{{ ucwords($category->category_name) }}</option>
                                            @endforeach
                                            @endif   
                                        
                                        </select>
                                   
                                   
                                </td>
                                @endif
                                @if($raw->is_project_cat==1)
                                <td ondblclick="$('#quickform{{$id_value}}pro_cat').show();$('#quickform{{$id_value}}pro_cati').hide();">
                                    @if($pro)
                                    <span id="quickform{{$id_value}}pro_cati"> {{$pro_cat->category_name}}</span>
                                       
                                            <select style="display:none" 
                                            onchange="quickchange('quickform{{$id_value}}pro_cat','{{$id_value}}','category_id');" 
                                            id="quickform{{$id_value}}pro_cat" class="select2 form-control task_input_field "  
                                            data-placeholder="@lang("app.selectProject")" value="{{$pro_cat->category_name}}"   
                                            name="project_id">
                                                <option value=""></option>
                                                @if($project_category)
                                                    @foreach($project_category as $project)
                                                        <option value="{{ $project->id }}">
                                                            {{ ucwords($project->category_name) }}
                                                        </option>
                                                    @endforeach
                                                @endif
                                            </select>
                                       
                                   
                                    @endif
                                </td>
                                @endif
                                @if($raw->is_est_hour==1)
                                <td ondblclick="$('#quickform{{$id_value}}est').show();$('#quickform{{$id_value}}esti').hide();">
                                    <span id="quickform{{$id_value}}esti"> {{$task->est_hour}}</span>
                                    
                                        
                                    <input id="quickform{{$id_value}}est" class="form-control task_input_field"  style="display:none"
                                    value="{{$task->est_hour}}" 
                                    onclick="event.preventDefault();" 
                                    onkeydown="if(event.keyCode === 13){quickchange('quickform{{$id_value}}est','{{$id_value}}','est_hour');}"
                                    type="text" >
                                   
                                   
                                </td>
                                @endif
                                @if($raw->is_act_hour==1)
                                <td ondblclick="$('#quickform{{$id_value}}act').show();$('#quickform{{$id_value}}acti').hide();">
                                    <span id="quickform{{$id_value}}acti">{{$task->act_hour}}</span>
                                    
                                       
                                        <input id="quickform{{$id_value}}act"  style="display:none"
                                        class="form-control task_input_field" value="{{$task->act_hour}}" 
                                        onclick="event.preventDefault();" 
                                        onkeydown="if(event.keyCode === 13){quickchange('quickform{{$id_value}}act','{{$id_value}}','act_hour');}"   type="number" >
                                   
                                </td>
                                @endif
                                @if($raw->is_created_at==1)
                                <td>{{$task->created_at}}</td>
                                @endif
                                @if($raw->is_section_tiles==1)
                                <td ondblclick="$('#quickform{{$id_value}}sec').show();$('#quickform{{$id_value}}seci').hide();">
                                    
                                    <span id="quickform{{$id_value}}seci">
                                        {{$task->section_tiles}}
                                    </span>
                                   
                                    <input class="form-control task_input_field"
                                    id="quickform{{$id_value}}sec"  style="display:none"
                                    value=" {{$task->section_tiles}}" 
                                   
                                    onkeydown="if(event.keyCode === 13){quickchange('quickform{{$id_value}}sec','{{$id_value}}','section_tiles');}"  
                                    type="text" >
                                  
                                </td>
                                @endif
                                @if($raw->is_tag==1)
                                <td ondblclick="$('#quickform{{$id_value}}tag').show();$('#quickform{{$id_value}}tagi').hide();">
                                    <span id="quickform{{$id_value}}tagi"> {{$task->tag}}</span>
                                   
                                       
                                    <input class="form-control task_input_field" value="{{$task->tag}}"
                                    id="quickform{{$id_value}}tag"  style="display:none"
                                    
                                    onclick="if(event.keyCode === 13){quickchange('quickform{{$id_value}}tag','{{$id_value}}','tag');}"  type="text" >
                                   
                                   
                                </td>
                                @endif
                                <td>
                                    <span class="status" style="background-color:{{$board_data->label_color}}">
                                        {{$board_data->column_name}}
                                    </span>
                                </td> 
                            </tr> 
                            {{-- lower on drag fake row --}}
                            <tr  class="lower_on_drag_fake_row" id="lower_drag_id{{$id_value}}">
                                <td style="height:40px;"  colspan="12">
                                    <h6 style="opacity:.1">.</h6>
                                </td>
                            </tr>
                            {{-- end of lower on drag fake row --}}
                           
                                {{-- end of row printing  --}}
                                
                                {{-- sub row  --}}
                                @if($sub_task)
                                    @foreach($sub_task as $sub_task)
                                    @php
                                        $sub=App\SubTask::find($sub_task);
                                        $id_value='task'.$task->id.'subTask'.$sub_task;
                                    @endphp
                                        <tr  style="display:none" class="kmneki " id="task{{$task->id}}subTask{{$sub_task}}" >
                                               
                                            <td colspan="1">
                                            <i> <input class="float-left" type="checkbox" onclick="checked_id('{{$id_value}}')" style="display:inline"> </i>                                                
                                            </td>
                                        
                                            
                                            <td class="dropdown">
                                                <i class="fas fa-caret-square-down dropdown" onclick="$('#ul_single_sub_row{{$id_value}}').show();"></i>
                                                    <ul class="dropdown-content" id="ul_single_sub_row{{$id_value}}" style="overflow:scroll">
                                                        {{-- <li onclick="action('pick_up','{{$id_value}}')">Pick up</li> --}}
                                                        <li  onclick="action('mark_complete','{{$id_value}}')">Mark complete</li>
                                                        <li  onclick="actionOnproject('duplicate','{{$id_value}}')">Duplicate</li>
                                                        <li  onclick="actionOnproject('move','{{$id_value}}')">Move </li>
                                                        <li onclick="actionOnproject('copy','{{$id_value}}')">Copy</li>
                                                        <li onclick="action('delete','{{$id_value}}')">Delete</li>
                                                    </ul>  
                                                {{-- <i class="fas fa-redo"></i>  --}}
                                                <input type="hidden" value="task{{$task->id}}subTask{{$sub_task}}" id="item" name="item">                   
                                            </td> 
                                            
                                        
                                            <td style="padding-left:40px">{{$sub->title}}</td>
                                            <td></td>
                                            <td>check list</td>
                                            @if($raw->is_project==1)  
                                            <td>@if($pro){{$pro->project_name}}@endif</td>
                                            @endif
                                            @if($raw->is_project_phase==1)
                                            <td>@if($pro){{$pro->project_phase}}@endif</td>
                                            @endif
                                            <td>
                                                @if($client)
                                                {{$client->name}}
                                                @endif
                                            </td>
                                            @php
                                                $sub_users=App\User::whereIn('id',json_decode($sub->user_id))->get();;
                                            @endphp
                                            <td>
                                                 @if($sub_users)
                                                    @foreach($sub_users as $sub_user)
                                                            {{-- @if($sub_user->image==null)
                                                                <img class="img-circle" width="20" src="{{asset('default-profile-3.png')}}">
                                                            @else 
                                                                <img class="img-circle" width="20" src="{{asset('user-uploads/avatar/'.$sub_user->image)}}">
                                                            @endif --}}
                                                            <i>{{$sub_user->name}}, </i>
                                                    
                                                    @endforeach
                                                @endif
                                                @if($sub->team_id!=null)
                                                @php
                                                    $sub_team_ids=json_decode($sub->team_id);
                                                @endphp
                                            
                                                    @foreach ($sub_team_ids as $sub_team_item)
                                                    @php
                                                        $sub_get_team=App\Team::find($sub_team_item);
                                                    @endphp
                                                        <h6 style="display: inline;border-radius: 46%;padding: 4px;color: blue;font-weight: 500;background: burlywood;">{{$sub_get_team->team_name}}</h6> 
                                                    @endforeach
                                                @endif
                                                {{-- {{$sub->assignee}} --}}
                                            </td>
                                            <td>
                                                {{-- @if($board_data->created_image==null)
                                                    <img class="img-circle" width="25" src="{{asset('default-profile-3.png')}}">
                                                @else 
                                                    <img class="img-circle" width="25" src="{{asset('user-uploads/avatar/'.$board_data->created_image)}}">
                                                @endif --}}
                                                 <i>{{$board_data->created_by}}, </i>
                                            </td>
                                            <td>{{$task->own}} </td>
                                            @if($raw->is_start_date==1)
                                            <td>{{$sub->start_date}}</td>
                                            @endif
                                            @if($raw->is_due_date==1)
                                            <td style="color:{{ App\Helper\Reply::measure_due($sub->due_date)}};font-weight:500;">{{$sub->due_date}}</td>
                                            @endif
                                            <td></td>
                                            @if($raw->is_end_date==1)
                                                @if($sub->status=='complete')
                                                <td>{{$sub->end_date}}</td>
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
                                         {{-- lower on drag fake row on subtask --}}
                                        <tr  class="lower_on_drag_fake_row" id="lower_drag_id{{$id_value}}">
                                            <td style="height:40px;"  colspan="12">
                                                <h6 style="opacity:.1">.</h6>
                                            </td>
                                        </tr>
                                        {{-- end of lower on drag fake row  on subtask--}}
                                    @endforeach
                                @endif
                                {{-- end of sub row --}}
                                {{-- empty row for sub row --}}
                                <tr id="sub_task_input{{$task->id}}">

                                </tr>
                               

                             {{-- empty row --}}
                            @php
                                $random=rand(0,5000);

                            @endphp
                            @if($show_last_occurrence_empty_row==true) 
                            <tr id="taskform{{$random}}" ondblclick="showTaskform({{$random}})">
                                <td  ondblclick="showTaskform({{$random}})" >
                                
                                    &nbsp;
                                    <td colspan="10" id="hidethen{{$random}}"><h6  ondblclick="showTaskform({{$random}})">Create A task by double clicking here</h6></td>
                                    
                                    
                                </td>
                            </tr>
                            <tr style="display:none" id="taskformdata{{$random}}">
                                @include('admin.task_pro.pro_task_input')
                            </tr>
                            @endif

                @endforeach
            @endif
            <tr>
                <td colspan="12" id="pagination_links_my">
                    <label for="">Shows</label>
                    <input type="number"  id="shows_how_many_record" onchange="change_num_record_to_show( '{{$v_data_size}}','{{$change_num_record_to_show}}')" name="">
                </td>
            </tr>
        </tbody>
</table>
