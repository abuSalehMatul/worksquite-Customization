@php
    $user=Auth::user();
    $view=DB::table('view_arrays')->where('user_id',$user->id)->where('role','admin')->first();
@endphp
<style>
ul{
    list-style: none;
}
.dropdown-menu-two li{
    cursor: pointer;
}
</style>
<a class="test" tabindex="-1" href="#">Show Data <span class="caret"></span></a>
                <ul class="dropdown-menu-two">
                <li id="due_date" value="{{$view->is_due_date}}" onclick="show_column('due_date')">
                   
                    @if($view->is_due_date=0)<i class="far fa-times-circle"></i>
                    @else<i class="fas fa-check"></i>@endif
                        Due Date
                </li>
                <li  id="project_phase" value="{{$view->is_project_phase}}" onclick="show_column('project_phase')">
                    @if($view->is_project_phase==0)<i class="far fa-times-circle"></i>
                    @else<i class="fas fa-check"></i>@endif
                        Project Phase
                </li>
                <li  id="project" value="{{$view->is_project}}" onclick="show_column('project')">
                    @if($view->is_project==0)<i class="far fa-times-circle"></i>
                    @else<i class="fas fa-check"></i>@endif
                        project
                </li>
                <li  id="start_date" value="{{$view->is_start_date}}" onclick="show_column('start_date')">
                    @if($view->is_start_date==0)<i class="far fa-times-circle"></i>
                    @else<i class="fas fa-check"></i>@endif
                        Start Date
                </li>
                <li  id="end_date" value="{{$view->is_end_date}}" onclick="show_column('end_date')">
                    @if($view->is_end_date==0)<i class="far fa-times-circle"></i>
                    @else<i class="fas fa-check"></i>@endif
                        End Date
                </li>
                <li  id="task_cat"}} value="{{$view->is_task_cat}}" onclick="show_column('task_cat')">
                    @if($view->is_task_cat==0)<i class="far fa-times-circle"></i>
                    @else<i class="fas fa-check"></i>@endif
                        Task Category
                </li>
                <li  id="pro_cat" value="{{$view->is_project_cat}}" onclick="show_column('pro_cat')">
                    @if($view->is_project_cat==0)<i class="far fa-times-circle"></i>
                    @else<i class="fas fa-check"></i>@endif
                        Project Category
                </li>
                <li  id="est_hour" value="{{$view->is_est_hour}}" onclick="show_column('est_hour')">
                    @if($view->is_est_hour==0)<i class="far fa-times-circle"></i>
                    @else<i class="fas fa-check"></i>@endif
                        Est Hour
                </li>
                <li  id="act_hour" value="{{$view->is_act_hour}}" onclick="show_column('act_hour')">
                    @if($view->is_act_hour==0)<i class="far fa-times-circle"></i>
                    @else<i class="fas fa-check"></i>@endif
                        Actual Hour
                </li>
                <li  id="created_at" value="{{$view->is_created_at}}" onclick="show_column('created_at')">
                    @if($view->is_created_at==0)<i class="far fa-times-circle"></i>
                    @else<i class="fas fa-check"></i>@endif
                        Created At
                </li>
                <li  id="selection_tiles" value="{{$view->is_section_tiles}}" onclick="show_column('selection_tiles')">
                    @if($view->is_section_tiles==0)<i class="far fa-times-circle"></i>
                    @else<i class="fas fa-check"></i>@endif
                        Selection Tiles
                </li>
                <li  id="tags" value="{{$view->is_tag}}" onclick="show_column('tags')">
                    @if($view->is_tag==0)<i class="far fa-times-circle"></i>
                    @else<i class="fas fa-check"></i>@endif
                        Tag
                </li>
                
                </ul>


<script>
function show_column(data){
    var value=$('#'+data).val();
   // console.log(value)
    $.ajax({
              type:'get',
              url:'{{url('admin/task/all-task/pro/ajx/showColumn')}}',
              data:{id_value:data,current_status:value},
              success:function(response){
                  console.log(response);
                  if(response=='success'){
                       $('#tbod').fadeOut();
                       $('#tbod').load('{{url('admin/task/all-task/pro/ajx')}}', function() {
                                 $('#tbod').fadeIn();
                                });
                       $('#tcolumn').load('{{url('admin/task/all-task/pro/ajx/getColumn')}}', function() {
                                 $('#tcolumn').fadeIn();
                                });
                     
                    
                  }else{
                      alert('Some thing Went Wrong');
                  }
              }

          });
}
</script>