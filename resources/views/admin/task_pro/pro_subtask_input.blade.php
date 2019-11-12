@php
    $project=App\Project::find($id);
    $clients=App\User::allClients();
    $assignee=App\User::allEmployees();
     $categories=App\TaskCategory::all();
    $teams=App\Team::all();
     $priority=DB::table('priority')->get();
@endphp

    <form action="{{url('admin/task/all-task/pro/ajx/submitSubTaskForm')}}" method="POST" id="subtaskform">
        @csrf
         <input type="hidden" id="taskID_sub" value="{{$id}}">
       
         <td colspan="2"><button class="btn"  onclick="onSubTaskSubmit()">Save</button></td>
        
        
        
         <td colspan="3">
             <label for="">Sub Task Name</label>
             <input class="form-control" name="subtask_sub" id="subtask_sub" placeholder="Sub Task" type="text" required>
            
        </td>
        
        <td colspan="2">
            
        </td>
        <td colspan="3">
             <select  multiple id="assignee_sub" class="float-left" id="assigne"  name="user_id[]"  data-style="form-control" required>
               <option value="" style="color:blue">Select From a Individual</option>
                @if($assignee)
                <option>Chose an assignee</option>
                    @foreach($assignee as $as)
                        <option value="{{$as->id}}">{{$as->name}}</option>
                    @endforeach
                @endif
             </select>
             <select multiple class="select2 float-left"  name="team_id[]" id="team_id_sub" >
                <option value="" style="color:blue">Select From a team</option>
                @foreach($teams  as $team)
                    <option value="{{ $team->id }}">{{ ucwords($team->team_name) }}</option>
                @endforeach
            </select>
            
        </td>
         
         <td colspan="2">
             <label for="">Start Date</label>
             <input class="form-control" type="date" name="start_date" id="start_date_sub"   value="{{ \Carbon\Carbon::today()->format('Y-m-d') }}"></td>
         <td colspan="2">
             <label for="">Due Date</label>
             <input class="form-control" type="date" name="due_date" id="due_date_sub"   value="{{ \Carbon\Carbon::today()->addDays(15)->format('Y-m-d') }}"></td>
         
        
          <td>
             <div class="form-group">
                    <label class="control-label">@lang('modules.tasks.priority')</label>

                    <div class="radio radio-danger">
                        <input type="radio" name="priority" id="radio13"
                                value="high">
                        <label for="radio13" class="text-danger">
                            @lang('modules.tasks.high') </label>
                    </div>
                    <div class="radio radio-warning">
                        <input type="radio" name="priority"
                                id="radio14" checked value="medium">
                        <label for="radio14" class="text-warning">
                            @lang('modules.tasks.medium') </label>
                    </div>
                    <div class="radio radio-success">
                        <input type="radio" name="priority" id="radio15"
                                value="low">
                        <label for="radio15" class="text-success">
                            @lang('modules.tasks.low') </label>
                    </div>
                </div>
         </td>
        
         
         <td colspan="3"><input class="form-control" id="est_hour" name="est_hour_sub" placeholder="est hour" type="text"></td>
         
         <td colspan="3"><input class="form-control" id="tag" name="tag_sub" placeholder="Tag" type="text"></td>
        
        
    </form>
  
