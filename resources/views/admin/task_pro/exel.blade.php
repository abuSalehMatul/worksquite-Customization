
@php

    $raw=App\ViewArray::where('user_id',Auth::user()->id)->first();
    $v_data=Session::get('view_array');
   
    $v_data=json_decode($v_data,true);
    $task_category=DB::table('task_category')->get();
    $project_category=App\ProjectCategory::distinct()->get(['category_name','id']);
    $group_by=$raw->group_by_column;
    $group_name[0]='No Group';
    
    $uu=Auth::user();
    $show_empty_row=0;
   $num_of_loop_occurrence=0;
   $show_last_occurrence_empty_row=false;
   $total_client=Session::get('total_client');
   $total_assignee=Session::get('total_assignee');
   $total_assignee=json_decode($total_assignee,true);
   $total_client=json_decode($total_client,true);

   
@endphp

    <table >       
        <thead>
           
                
                <th >Task
                    
                </th>
                <th >Sub Task
                    
                </th> 
                <th >#Check List</th>
                @if($raw->is_project==1)   
                <th >Project
                   
                </th>
                @endif
                @if($raw->is_project_phase==1)
                <th >Project Phase
                   
                </th>
                @endif
                <th  >Client
                   
                    
                </th>
                <th  >Assignee
                   
                </th>
                <th >Assigner</th>
                <th >Own</th>
                @if($raw->is_start_date==1)
                <th  >Start Date
                   
                </th>
                @endif
                @if($raw->is_due_date==1)
                <th  >Due Date
                  
                </th>
                @endif
                <th >Frequency
                    
                </th>
                @if($raw->is_end_date==1)
                <th  >End Date
                  
                </th>
                @endif
                <th >Priority
                   
                </th>
                @if($raw->is_task_cat==1)
                <th  >Task Cat
                  
                </th>
                @endif
                @if($raw->is_project_cat==1)
                <th  >Project Cat
                   
                </th>
                @endif
                @if($raw->is_est_hour==1)
                <th >EST Hours
                   
                </th>
                @endif
                @if($raw->is_act_hour==1)
                <th >Actual Hours
                   
                </th>
                @endif
                @if($raw->is_created_at==1)
                <th  >Created at
                   
                </th>
                @endif
                @if($raw->is_section_tiles==1)
                <th >Section Tiles
                   
                </th>
                @endif
                @if($raw->is_tag==1)
                <th >Tags
                    
                </th>
                @endif
                <th >Status
                    
                </th> 
            </tr>
        </thead>

        <tbody  >
            @if($v_data)
                @foreach($v_data as $task_id=>$sub_task)
                  
                    @php
                        
                       
                        $task=App\Task::find($task_id);
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
                   
                          
                            <tr  >    
                                    
                            

                                <td >
                               
                                        {{$task->heading}}
                                </td>
                                <td>
                                    @if(sizeof($sub_task)>0)
                                        {{sizeof($sub_task)}}
                                    @endif
                                </td>
                                <td></td>
                                @if($raw->is_project==1)  
                                <td >
                                    @if($pro)
                                     {{$pro->project_name}}
                                     
                                    @endif
                                </td>
                                @endif

                                @if($raw->is_project_phase==1)
                                <td >
                                    @if($pro)
                                    {{$pro->project_phase}}
                                    
                                    
                                    @endif
                                </td>
                                @endif

                                <td >
                                    
                                        @if($client)
                                         {{$client->name}}
                                        @endif 
                                    
                                   
                                </td>
                                <td >
                                    @if($users)
                                        @foreach($users as $user)
                                               
                                            {{$user->name}}, 
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
                                            <h6 >{{$get_team->team_name}}</h6> 
                                        @endforeach
                                    @endif
                                </td>
                                <td >
                                   
                                    {{$board_data->created_by}} 
                                    
                                </td>
                                <td>{{$task->own}}</td>
                                @if($raw->is_start_date==1)
                                <td contenteditable='true'>
                                    {{$board_data->start_date}}
                                </td>
                                @endif
                                
                                @if($raw->is_due_date==1)
                                <td >
                                    {{$board_data->due_date}}
                                  
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
                                
                                <td >
                                    
                                         {{$task->priority}}
                                    
                                    
                                   
                                </td>
                                @if($raw->is_task_cat==1)
                                <td >
                                     {{$task_cat}}
                                    
                                       
                                       
                                   
                                   
                                </td>
                                @endif
                                @if($raw->is_project_cat==1)
                                <td >
                                    @if($pro)
                                     {{$pro_cat->category_name}}
                                       
                                            
                                       
                                   
                                    @endif
                                </td>
                                @endif
                                @if($raw->is_est_hour==1)
                                <td >
                                     {{$task->est_hour}}
                                    
                                        
                                   
                                   
                                </td>
                                @endif
                                @if($raw->is_act_hour==1)
                                <td >
                                    {{$task->act_hour}}
                                    
                                       
                                      
                                   
                                </td>
                                @endif
                                @if($raw->is_created_at==1)
                                <td>{{$task->created_at}}</td>
                                @endif
                                @if($raw->is_section_tiles==1)
                                <td >
                                    
                                    
                                        {{$task->section_tiles}}
                                    
                                   
                                   
                                  
                                </td>
                                @endif
                                @if($raw->is_tag==1)
                                <td >
                                     {{$task->tag}}
                                   
                                       
                                  
                                   
                                   
                                </td>
                                @endif
                                <td>
                                    <span>
                                        {{$board_data->column_name}}
                                    
                                </td> 
                            </tr>
                                {{-- end of row printing  --}}
                                
                                {{-- sub row  --}}
                                @if($sub_task)
                                    @foreach($sub_task as $sub_task)
                                    @php
                                        $sub=App\SubTask::find($sub_task);
                                        $id_value='task'.$task->id.'subTask'.$sub_task;
                                    @endphp
                                        <tr >
                                               
                                            <td >
                                           
                                            </td>
                                        
                                            
                                            
                                            
                                        
                                            <td >{{$sub->title}}</td>
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
                                                            {{$sub_user->name}}, 
                                                    
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
                                                 {{$board_data->created_by}}, 
                                            </td>
                                            <td>{{$task->own}} </td>
                                            @if($raw->is_start_date==1)
                                            <td>{{$sub->start_date}}</td>
                                            @endif
                                            @if($raw->is_due_date==1)
                                            <td >{{$sub->due_date}}</td>
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
                                    @endforeach
                                @endif
                                
                           

                @endforeach
            @endif
        </tbody>
</table>
