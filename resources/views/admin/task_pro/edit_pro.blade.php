<style>
        .panel-black .panel-heading a, .panel-inverse .panel-heading a {
            color: unset!important;
        }
    </style>
    @php
        $random=rand(0,5000);
         $s='storeEditTask'.$random;
    @endphp
        <div class="row" id="quick_task_create">
            <div class="col-md-12">
    
                <div class="panel panel-inverse">
                    <div class="panel-heading"> Edit Task</div>
                    <div class="panel-wrapper collapse in" aria-expanded="true">
                        <div class="panel-body">
                            {!! Form::open(['id'=>$s,'class'=>'ajax-form','method'=>'POST']) !!}
                        
                            <input type="hidden" value="{{$task->id}}" name="task_id">
                            <div class="form-body">
                                <div class="row">
    
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">@lang('app.project')</label>
                                            <select class="select2 form-control" data-placeholder="@lang("app.selectProject")" id="project_id" name="project_id">
                                               @if($task->project_id)
                                               @php
                                                    $current_project=App\Project::find($task->project_id);
                                                @endphp
                                                <option value="{{ $current_project->id }}">{{ ucwords($current_project->project_name) }}</option>
                                                @else 
                                                <option value=""></option>
                                                @endif
                                                @foreach($projects as $project)
                                                    <option
                                                    value="{{ $project->id }}">{{ ucwords($project->project_name) }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                   
                                    <div class="row">
                                        <div class="col-md-6 ">
                                            <div class="form-group">
                                               
                                                <label for="">Task Category</label>
                                                <select class="select2 form-control" name="category_id" id="category_id"
                                                        data-style="form-control">
                                                        @if($task->task_category_id)
                                                            @php
                                                                $current_category=App\TaskCategory::find($task->task_category_id);
                                                            @endphp
                                                            
                                                            <option value="{{ $current_category->id }}">{{ ucwords($current_category->category_name) }}</option>
                                                        @else 
                                                            <option value=""></option>    
                                                        @endif
                                                        @forelse($categories as $category)
                                                        <option value="{{ $category->id }}">{{ ucwords($category->category_name) }}</option>
                                                    @empty
                                                        <option value="">@lang('messages.noTaskCategoryAdded')</option>
                                                    @endforelse
                                                </select>
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                        </div>
                                    </div>
                                   
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label">@lang('app.title')</label>
                                            <input type="text" id="heading" value="{{$task->heading}}" name="heading" class="form-control" >
                                        </div>
                                    </div>
                                    <!--/span-->
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label">@lang('app.description')</label>
                                            <textarea id="description"  name="description" class="form-control summernote">
                                                {{$task->description}}
                                            </textarea>
                                        </div>
                                    </div>
                                    <!--/span-->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">@lang('app.startDate')</label>
                                            <input type="date" value="{{ $task->start_date }}" name="start_date" id="start_date2" class="form-control" >
                                        </div>
                                    </div>
                                    <!--/span-->
                                    <!--/span-->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">@lang('app.dueDate')</label>
                                            <input type="date" name="due_date" value="{{$task->due_date}}"  id="due_date2" class="form-control" >
                                        </div>
                                    </div>
                                    <!--/span-->
                                    <div class="col-md-6">
                                        <div class="">
                                            <label class="control-label">@lang('modules.tasks.assignTo')</label>
                                            <select   class="form-control" name="user_id[]" id="user_id" multiple="multiple" >
                                                <option value="">@lang('modules.tasks.chooseAssignee')</option>
                                                @foreach($employees as $employee)
                                                    <option value="{{ $employee->id }}">{{ ucwords($employee->name) }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
    
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">Assign To a Team</label>
                                            <select   class="form-control" name="team_id[]" id="team_id" multiple="multiple">
                                                <option value="">Chose A Team</option>
                                                @foreach($teams  as $team)
                                                    <option value="{{ $team->id }}">{{ ucwords($team->team_name) }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="ownby">Owned By:</label>
                                            <select name="own" class="form-control" id="ownby">
                                                @if($task->own)
                                                @php
                                                    $current_own=App\User::find($task->own);
                                                @endphp
                                                @if($current_own)
                                                <option value="{{$current_own->id}}">{{$current_own->name}}</option>
                                                @endif
                                                @else 
                                                <option value=""></option>
                                                @endif
                                                @foreach($employees as $employee)
                                                    <option value="{{ $employee->id }}">{{ ucwords($employee->name) }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-lg-4 form-group">
                                        <label for="">Tag</label>
                                        <input type="text" class="form-control" value="{{$task->tag}}"  name="tag">
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-lg-4 form-group">
                                        <label for="">Section Tiles</label>
                                        <input type="text" class="form-control" value="{{$task->section_tiles}}"  name="section_tiles">
                                    </div>
                                    <!--/span-->
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label">@lang('modules.tasks.priority')</label>
    
                                            <div class="radio radio-danger">
                                                <input type="radio" name="priority" id="radio13"
                                                       value="high" @if($task->priority=='high') checked=true @endif>
                                                <label for="radio13" class="text-danger">
                                                    @lang('modules.tasks.high') </label>
                                            </div>
                                            <div class="radio radio-warning">
                                                <input type="radio" name="priority"
                                                       id="radio14"  value="medium" @if($task->priority=='medium') checked=true @endif>
                                                <label for="radio14" class="text-warning">
                                                    @lang('modules.tasks.medium') </label>
                                            </div>
                                            <div class="radio radio-success">
                                                <input type="radio" name="priority" id="radio15"
                                                       value="low" @if($task->priority=='low') checked=true @endif>
                                                <label for="radio15" class="text-success">
                                                    @lang('modules.tasks.low') </label>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/span-->
    
                                </div>
                                <!--/row-->
                                
                            </div>
                            <div class="form-actions">
                               <button class="btn btn-success" onclick="onTaskEditSubmit({{$random}})">Save</button>
                               <button class="btn btn-info" onclick="onTaskEditSubmit({{$random}},'recurrence')">Save As a Reccurent Task</button>
                               <button onclick="event.preventDefault();$('#quick_task_create').hide();" class="btn btn-danger">Cancel</button>
                            </div>
                            {!! Form::close() !!}
                        {{-- </form> --}}
                        </div>
                    </div>
                </div>
            </div>
        </div>    <!-- .row -->
    
     
@push('footer-script')
<script>

$('#team_id,#user_id').select2();
</script>
@endpush  
    
    