@if($projects)
<div class="card project-selector">
    
    @php
        $task=App\Task::find($task_id);
    @endphp
        <div class="card-body form-group">
            <label for="">Name</label>
            @if($action=='duplicate')
                <input type="text" @if($task) value="A Copy Of {{$task->heading}}" @endif class="form-control" id="action_task_name">
            @elseif($action=='move')
                 <input type="text" @if($task) value="{{$task->heading}}" @endif class="form-control" id="action_task_name">
            @elseif($action=='copy')
                 <input type="text" @if($task) value="{{$task->heading}}" @endif class="form-control" id="action_task_name">
            @endif

        </div>
        <div class="card-body form-group">
            @if($action!='duplicate')
                <p class="card-header">To
                    @if(isset($to))
                        {{$to}}
                    @endif

                </p>
            <select  class="form-control"  id="select_for_pro">
                @foreach($projects as $res_key=>$name)
                   <option value="{{$res_key}}">{{$name}}</option>
                @endforeach 
            </select>
            @endif
        </div>
        <div class="form-group">
            <label>Due Date: </label>
            <input value="" class="form-control" type="date" id="new_date">
        </div>
        <div>
            @if($type=='single')
            <button class="btn btn-danger" onclick="take_pro_copy_move_on_single()">Confirm</button>
            @else 
            <button class="btn btn-danger" onclick="take_pro_copy_move()">Confirm</button>
            @endif
        </div>
</div>
    
@endif