@if($tasks)
<div class="card project-selector">
    <p class="card-header">To
        @if(isset($to))
            {{$to}}
        @endif

    </p>
        <div class="card-body form-group">
            <select  class="form-control"  id="select_for_pro">
                @foreach($tasks as $task)
                   <option value="{{$task->id}}">.$task->heading.</option>
                @endforeach 
            </select>
        </div>
        <div class="form-group">
            <label>Due Date: </label>
            <input  class="form-control" class="form-control" type="date" id="new_date">
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