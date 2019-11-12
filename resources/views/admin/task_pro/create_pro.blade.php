<style>
    .panel-black .panel-heading a, .panel-inverse .panel-heading a {
        color: unset!important;
    }
</style>
@php
    $random=rand(0,5000);
     $s='storeTask'.$random;
@endphp
    <div class="row" id="quick_task_create">
        <div class="col-md-12">

            <div class="panel panel-inverse">
                <div class="panel-heading"> @lang('modules.tasks.newTask')</div>
                <div class="panel-wrapper collapse in" aria-expanded="true">
                    <div class="panel-body">
                        {!! Form::open(['id'=>$s,'class'=>'ajax-form','method'=>'POST']) !!}
                    {{-- <form method="POST" action="{{route('admin.all-tasks.store')}}">
                        @csrf --}}
                        <div class="form-body">
                            <div class="row">

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">@lang('app.project')</label>
                                        <select class="select2 form-control" data-placeholder="@lang("app.selectProject")" id="project_id" name="project_id">
                                            <option value=""></option>
                                            @foreach($projects as $project)
                                                <option
                                                value="{{ $project->id }}">{{ ucwords($project->project_name) }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                              
                                    <div class="col-md-4 ">
                                        <div class="form-group">
                                           
                                            <label for="">Task Category</label>
                                            <select class="select2 form-control" name="category_id" id="category_id"
                                                    data-style="form-control">
                                                @forelse($categories as $category)
                                                    <option value="{{ $category->id }}">{{ ucwords($category->category_name) }}</option>
                                                @empty
                                                    <option value="">@lang('messages.noTaskCategoryAdded')</option>
                                                @endforelse
                                            </select>
                                            
                                        </div>
                                    </div>
                                    
                              

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">@lang('app.title')</label>
                                        <input type="text" id="heading" name="heading" class="form-control" >
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">@lang('app.description')</label>
                                        <textarea id="description" name="description" class="form-control summernote"></textarea>
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">@lang('app.startDate')</label>
                                        <input type="date" value="{{ \Carbon\Carbon::today()->format('Y-m-d') }}" name="start_date" id="start_date2" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                                <!--/span-->
                                <!--/span-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">@lang('app.dueDate')</label>
                                        <input type="date" name="due_date" value=""  id="due_date2" class="form-control" >
                                    </div>
                                </div>
                                <!--/span-->
                                <div class="col-md-4">
                                    <div class="">
                                        <label class="control-label">@lang('modules.tasks.assignTo')</label>
                                        <select   class="form-control" name="user_id[]" id="user_id" multiple required>
                                            <option value="">@lang('modules.tasks.chooseAssignee')</option>
                                            @foreach($employees as $employee)
                                                <option value="{{ $employee->id }}">{{ ucwords($employee->name) }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Assign To a Team</label>
                                        <select   class="form-control" name="team_id[]" id="team_id" multiple>
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
                                            @foreach($employees as $employee)
                                                <option value="{{ $employee->id }}">{{ ucwords($employee->name) }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-lg-4 form-group">
                                    <label for="">Tag</label>
                                    <input type="text" class="form-control"  name="tag">
                                </div>
                                <div class="col-md-4 col-sm-4 col-lg-4 form-group">
                                    <label for="">Section Tiles</label>
                                    <input type="text" class="form-control"  name="section_tiles">
                                </div>
                                <!--/span-->
                                <div class="col-md-4">
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
                                </div>
                                <!--/span-->

                            </div>
                            <!--/row-->
                            
                        </div>
                        <div class="form-actions">
                           <button class="btn btn-success" onclick="onTaskSubmit({{$random}})">Save</button>
                           <button class="btn btn-info" onclick="onTaskSubmit({{$random}},'recurrence')">Save As a Reccurent Task</button>
                           <button onclick="event.preventDefault();$('#quick_task_create').hide();" class="btn btn-danger">Cancel</button>
                        </div>
                        {!! Form::close() !!}
                    {{-- </form> --}}
                    </div>
                </div>
            </div>
        </div>
    </div>    <!-- .row -->

 


