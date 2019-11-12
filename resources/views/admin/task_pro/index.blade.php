@extends('layouts.app')

@section('page-title')
    <div class="row bg-title">
        <!-- .page title -->
        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
            <h4 class="page-title"><i class="{{ $pageIcon }}"></i> {{ __($pageTitle) }}</h4>
        </div>
        <!-- /.page title -->
        <!-- .breadcrumb -->
        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12 top-task">
             <span class="badge badge-danger float-right">{{$new_task}} New</span>
            <span class="badge badge-info float-right">{{$progress}} Progress</span>
            <span class="badge badge-warning float-right">{{$completed}} Resolved</span>
            <span class="badge badge-success float-right">{{$closed}} Closed</span>
        </div>
        <!-- /.breadcrumb -->
       
    </div>
    
   
@endsection

@push('head-script')
<script src="{{ asset('plugins/bower_components/jquery/dist/jquery.min.js') }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="{{ asset('plugins/bower_components/bootstrap-select/bootstrap-select.min.css') }}">
<link rel="stylesheet" href="{{ asset('plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.css') }}">
<link rel="stylesheet" href="{{ asset('plugins/bower_components/custom-select/custom-select.css') }}">
<script src="https://kit.fontawesome.com/63ca44675a.js"></script>


@include('admin.task_pro.pro_table_css')

@endpush

@section('content')

<div id="recurrence_box">

</div>
<table style="overflow-x:scroll;width:100%" class=" task-details-matul ">
    <tr>
        <div>
        <td colspan="10">
            <div class=" col-md-12 col-sm-12  float-left">
                <ul class="top-nav-ul" style="list-style:none;cursor:pointer;">
                    <a class="float-left" id="all_task" onclick="showtaskon('all_task')">All Task ({{$total_task}})</a>
                    <a class="float-left" id="my_task" onclick="showtaskon('my_task')">My Task ({{$allTask}})</a>
                    <a class="float-left" id="today_due" onclick="showtaskon('today_due')">Today Due ({{$today_due}})</a>
                    <a class="float-left" id="tomorrow_due" onclick="showtaskon('tomorrow_due')">Tomorrow Due ({{$tomorrow_due}})</a>
                    <a class="float-left" id="due" onclick="showtaskon('due')">Over Due ({{count($over_due_cnt)}})</a>
                    
                </ul>
            </div> 
        </td>
        <td colspan="4"> 
            <div class=" col-md-12 col-sm-12    float-left">
                <span>Date</span>
                <input style="display:inline;width:25%" class="form-control" type="date" id="date_from_value" onchange="datesearcher()"  value="{{ \Carbon\Carbon::today()->subDays(15)->format('Y-m-d') }}">
                <span>To</span>
                <input type="date" style="display:inline;width:25%" class="form-control" id="date_to_value" onchange="datesearcher()"  value="{{ \Carbon\Carbon::today()->addDays(15)->format('Y-m-d') }}">
                <input type="text" style="display:inline;width:30%" placeholder="Search" onkeyup="tasksearcher_two()" id="tasksearcher_two"  class="form-control">
            </div> 
        </td>
        <!-- Dropdown Trigger -->
        <td colspan="6" style="width:7%">
            <div class="dropdown dropleft   float-left">
                <a class="btn btn-secondary dropdown-toggle" style="padding:1px" href="##" role="button" id="dropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-object-group" style="font-size:20px;color:black"></i>          
                </a>
                <ul  class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <li><a class="group_by_select" onclick="change_to_group_by('projects_name')">Project</a></li>
                    <li><a class="group_by_select" onclick="change_to_group_by('project_phase')">Project Phase </a></li>
                    <li><a class="group_by_select" onclick="change_to_group_by('task_name')">Task</a></li>
                    <li><a class="group_by_select" onclick="change_to_group_by('tag')">Tag</a></li>
                    <li><a class="group_by_select" onclick="change_to_group_by('section')">Section </a></li>
                    <li><a class="group_by_select" onclick="change_to_group_by('status')">Status</a></li>
                    <li><a class="group_by_select" onclick="change_to_group_by('due_date')">Due Date</a></li>
                    <li><a class="group_by_select" onclick="change_to_group_by('priority')">Priority</a></li>
                    <li><a class="group_by_select" onclick="change_to_group_by('client')">Client</a></li>
                    <li><a class="group_by_select" onclick="change_to_group_by('assignee')">Assignee</a></li>
                    <li><a class="group_by_select" onclick="change_to_group_by('start_date')">Start date</a></li>
                    <li><a class="group_by_select" onclick="change_to_group_by('task_cat')">Task Category</a></li>
                </ul>
            </div>
        
            <div class="dropdown dropleft    float-left">
            
            
                <a class="btn btn-secondary dropdown-toggle"  style="padding:1px" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-cogs" style="font-size:20px;color:black"></i>
                </a>

                <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <li><a tabindex="-1" href="#" onclick="hidecomplete()">Hide/Show Complete</a></li>
                    
                    <li class="dropdown-submenu " id="tcolumn">
                    @include('admin.task_pro.show_column')
                    </li>
                    <li><a onclick="event.preventDefault();exportData()" >Export To Excel</a></li>
                </ul>

            </div>
        </td>
        </div>
    </tr>

</table>

<div class="card m-b-12 col-md-12 col-sm-12 table-responsive"  style="overflow-x:scroll" id="tbod_parent">
    <div class="col-md-3 col-sm-4">
        <a  onclick="create_new_task()" class="btn btn-outline btn-success btn-sm">@lang('modules.tasks.newTask') <i class="fa fa-plus" aria-hidden="true"></i></a>  
    </div> 
   
    <div class="vgt-responsive" id="tbod">
            @include('admin.task_pro.pro_table_rows')
    </div>
    
   
</div>
   
@endsection

@push('footer-script')
   

 {{-- <script type="text/javascript" src="{{asset('materialize/js/materialize.min.js')}}"></script> --}}
<script src="{{ asset('plugins/bower_components/custom-select/custom-select.min.js') }}"></script>
<script src="{{ asset('plugins/bower_components/bootstrap-select/bootstrap-select.min.js') }}"></script>
<script src="{{ asset('plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.js') }}"></script>
@if($global->locale == 'en')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/locales/bootstrap-datepicker.{{ $global->locale }}-AU.min.js"></script>
@else
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/locales/bootstrap-datepicker.{{ $global->locale }}.min.js"></script>
@endif
{{-- <script src="{{ asset('plugins/bower_components/datatables/jquery.dataTables.min.js') }}"></script>  --}}
 {{-- <script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js"></script> --}}

<script src="{{ asset('plugins/bower_components/bootstrap-daterangepicker/daterangepicker.js') }}"></script>


@include('admin.task_pro.js') 
@endpush
