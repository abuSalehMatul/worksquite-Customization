@php
 
    $assignee=App\User::allEmployees();
    $priority=DB::table('priority')->get();
    $categories=App\TaskCategory::all();
    $teams=App\Team::all();
    $projects = App\Project::all();
   
    $s='storeTask'.$random;
@endphp
<div id="">


    {!! Form::open(['id'=>$s,'class'=>'ajax-form','method'=>'POST']) !!}
       
       
       
       
        <td colspan="2">
             <button class="tasksubbutton animated bounce" onclick="onTaskSubmit({{$random}})">Save</button>
        </td>
        
         <td colspan="3">
             <label for="">Task Name</label>
             <input class="form-control task_input_field " placeholder="" onclick=" event.preventDefault();" onkeydown="if(event.keyCode === 13){event.preventDefault();$('#input_project_id{{$s}}').show();}"   id="input_taskname" name="heading" tabindex="1"  type="text">
        </td>
         
         <td colspan="2">
             <div style="display:none" id="input_project_id{{$s}}">
                <label for="">Project</label>
            
              <select class="select2 form-control task_input_field " onchange="$('#input_assigne{{$s}}').show();" data-placeholder="@lang("app.selectProject")"   name="project_id" tabindex="2">
                <option value=""></option>
                @foreach($projects as $project)
                    <option value="{{ $project->id }}">
                        {{ ucwords($project->project_name) }}
                    </option>
                @endforeach
                </select>
             </div>
         </td>
         <td></td>
        
         <td colspan="2" >
             <div class="form-group float-left" style="display:none" id="input_assigne{{$s}}">
                <select  multiple id="assignee" class=" form-control float-left task_input_field" onchange="$('#input_team_id{{$s}}').show();"  name="user_id[]"  data-style="form-control" >
                <option value="" style="color:blue">Select From a Individual</option>
                    @if($assignee)
                    <option>Chose an assignee</option>
                        @foreach($assignee as $as)
                            <option value="{{$as->id}}">{{$as->name}}</option>
                        @endforeach
                    @endif
                </select>
             </div>
             <div class="form-group float-left" style="display:none" id="input_team_id{{$s}}">
                    <select multiple class=" form-control float-left task_input_field"   name="team_id[]"  onchange="$('#input_start_date{{$s}}').show();" >
                        <option value="" style="color:blue">Select From a team</option>
                        @foreach($teams  as $team)
                            <option value="{{ $team->id }}">{{ ucwords($team->team_name) }}</option>
                        @endforeach
                    </select>
             </div>
             
         

            
        </td>
         
         <td>
             <div style="display:none" id="input_start_date{{$s}}">
                <label for="">Start Date</label>
                <input class="form-control task_input_field" name="start_date" type="date"  onchange="$('#input_due_date{{$s}}').show();">
             </div>
        </td>
         <td>
             <div style="display:none" id="input_due_date{{$s}}">
                <label for="">End Date</label>
                <input class="form-control task_input_field"  name="due_date" type="date"   onchange="$('#input_priority{{$s}}').show();">
             </div>
             
        </td>
        
         
        
         <td colspan="2">
             
                <div class="form-group" id="input_priority{{$s}}" style="display:none" >
                    <label class="control-label">@lang('modules.tasks.priority')</label>

                    <div class="radio radio-danger">
                        <input type="radio" name="priority" id="radio13"  onclick="$('#input_category_id{{$s}}').show();" 
                                value="high">
                        <label for="radio13" class="text-danger">
                            @lang('modules.tasks.high') </label>
                    </div>
                    <div class="radio radio-warning">
                        <input type="radio" name="priority"  onclick="$('#input_category_id{{$s}}').show();" 
                                id="radio14" checked value="medium">
                        <label for="radio14" class="text-warning">
                            @lang('modules.tasks.medium') </label>
                    </div>
                    <div class="radio radio-success">
                        <input type="radio" name="priority" id="radio15" onclick="$('#input_category_id{{$s}}').show();"  
                                value="low">
                        <label for="radio15" class="text-success">
                            @lang('modules.tasks.low') </label>
                    </div>
                </div>
         </td>
         <td colspan="2">
             <div id="input_category_id{{$s}}"  style="display:none">
                <label for="">Task Category</label>
                <select class="selectpicker form-control task_input_field" name="category_id"  onchange="$('#input_est_hour{{$s}}').show();"  
                        data-style="form-control">
                        <option value=""  >@lang('messages.noTaskCategoryAdded')</option>
                    @foreach($categories as $category)
                        <option value="{{ $category->id }}"   >{{ ucwords($category->category_name) }}</option>
                    @endforeach
                        
                   
                </select>
             </div>
             
         </td>
        
         <td colspan="2">
            <div id="input_est_hour{{$s}}"  style="display:none">
                  <label for=""> Estimate hour</label>
                  <input class="form-control task_input_field" onclick="event.preventDefault();" onkeydown="if(event.keyCode === 13){event.preventDefault();$('#input_selection_tiles{{$s}}').show();}"  name="est_hour"  type="text" >
            </div> 
          
        </td>
        
         <td colspan="2">
            <div id="input_selection_tiles{{$s}}" style="display:none">
                <label for="">Section Tiles</label>
                <input type="text" class="form-control task_input_field"  onclick="event.preventDefault();" onkeydown="if(event.keyCode === 13){event.preventDefault();$('#input_tag{{$s}}').show();}"  name="section_tiles"  >
            </div> 
        </td>
         <td colspan="2">
            <div id="input_tag{{$s}}" style="display:none">
                <label for="">Tag</label>
                <input class="form-control task_input_field" name="tag" onclick="event.preventDefault();"  type="text" tabindex="10" >
            </div> 
        </td>
         <td></td>
         
    {!! Form::close() !!}
 </div>  

<style>
.tasksubbutton{
    padding:3px;
    background: white;
    color: seagreen;
    font-weight: 600;
}
.tasksubbutton:hover{
    padding:5px;
    background: green;
    color: white;
    font-weight: 800;
}
</style>