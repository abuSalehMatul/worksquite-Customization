@php
   
    $task_id=Session::get('recurrence_task_id');
    $task='';
    if(is_numeric($task_id)){
        $task=App\Task::find($task_id);
    }
    
    $day=['','Monday','TuesDay','WednesDay','ThusDay','FriDay','SaturDay','SunDay'];

@endphp
<form action="{{url('admin/task/all-task/pro/recurrence/save')}}" method="POST" id="recurrencefrm">
    @csrf
        <div class="col-md-8 col-sm-8 recurrence ">
            <div id="top-div">
                <h5 class="float-left" style="display:inline">Task Recurrence </h5>
                <i class="far fa-times-circle cross-and-cancel" id="cross-and-cancel" ></i>
            </div>
            <div class="card" style="box-shadow: 1px 1px 1px 1px grey;
    margin: 4px;
    padding: 5px;">
                @if($task!='')
                    @if($task->is_recurrence=='yes')
                        <h5 style="font-style: normal;font-size: 17px;color: darkcyan;font-weight: 600;">Your Current Recurrence Pattern:</h5>
                        @php
                            
                            $parent=App\TaskRecurrencePattern::where('task_id',$task->id)->first();
                             $pattern = App\RecurrencePattern::find($parent->pattern_id);
                        @endphp
                        <p style="font-size: 16px;font-weight: 500;">
                            <i style="    font-weight: 900;">Every </i> 
                            @if($pattern->recurring_type=='daily')
                                @if($pattern->separation_count==7 && $pattern->day_of_week==7)
                                    Weekend
                                @else 
                                    In {{$pattern->separation_count}} Days...
                                @endif
                            @elseif($pattern->recurring_type=='weekly')
                                {{$pattern->separation_count}} weeks in {{$day[$pattern->day_of_week]}}
                            @elseif($pattern->recurring_type=='monthly')
                                {{$pattern->separation_count}} Months in 
                                @if($pattern->day_of_month)
                                        {{$pattern->day_of_month}}
                                @else 
                                   no.{{$pattern->week_of_month}} week in {{$day[$pattern->day_of_week]}}
                                @endif
                            
                            @else 
                                {{$pattern->separation_count}} Years in {{$pattern->month_of_year}} month
                                @if($pattern->week_of_month)
                                    no.{{$pattern->week_of_month}} week in {{$day[$pattern->day_of_week]}}
                                @else 
                                     {{$pattern->day_of_month}}
                                @endif

                            @endif
                        </p>
                    @endif
                @endif
            </div>
            <div class="card col-md-12 select-recurrence-option">
               

                <div class="col-md-4 card-body float-left option-div">
                     <h3 >Recurrence pattern</h3>
                    <div class="custom-control custom-radio">
                        <input type="radio" checked id="customRadio1"  onclick="show_recurrence_module('customRadiodiv1')" name="recurrence_pattern" value="daily" class="custom-control-input">
                        <label class="custom-control-label" for="customRadio1">Daily</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input type="radio" id="customRadio2" onclick="show_recurrence_module('customRadiodiv2')" name="recurrence_pattern" value="weekly" class="custom-control-input">
                        <label class="custom-control-label" for="customRadio2">Weekly</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input type="radio" id="customRadio3" onclick="show_recurrence_module('customRadiodiv3')" name="recurrence_pattern" value="monthly" class="custom-control-input">
                        <label class="custom-control-label" for="customRadio3">Monthly</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input type="radio" id="customRadio4" onclick="show_recurrence_module('customRadiodiv4')" name="recurrence_pattern" value="yearly" class="custom-control-input">
                        <label class="custom-control-label" for="customRadio4">Yearly</label>
                    </div>
                   
                </div>

              {{-- days --}}
                <div class="col-md-8 card-body float-left show-option" id="customRadiodiv1" style="display:block">
                    <div class="col-md-12 custom-control custom-radio">
                        <input type="radio" id="dayRadio1" name="daily_pattern" value="daily_every" checked class="custom-control-input float-left">
                         <p style="display:inline-block" class="float:left">Every</p>
                        <input type="number" name="daily_every_value" style="display:inline-block" class="float:left recurrence-input">Days
                    </div>
                    <div class="col-md-12 custom-control custom-radio">
                        <input type="radio" id="dayRadio2" name="daily_pattern" value="daily_weekend" class="custom-control-input">
                        <label class="custom-control-label" for="dayRadio2">Every Weekday</label>
                    </div>
                   
                    
                </div>
                {{-- week --}}
                <div class="col-md-8 card-body float-left show-option" id="customRadiodiv2" style="display:none">
                    <p style="display:inline">Recur Every
                        <input type="number" name="weekly_week" style="display:inline"> weeks(s) on:
                    </p>
                    <p>
                        <input type="radio" name="weekly_weekday" checked value="1" class="custom-control-input" id="weekcheck1">
                        <label class="custom-control-label" for="weekcheck1">Monday</label>
                        <input type="radio" name="weekly_weekday" value="2" class="custom-control-input" id="weekcheck2">
                        <label class="custom-control-label" for="weekcheck2">Tuesday</label>
                        <input type="radio" name="weekly_weekday" value="3" class="custom-control-input" id="weekcheck3">
                        <label class="custom-control-label" for="weekcheck3">Wednesday</label>
                        <input type="radio" name="weekly_weekday" value="4" class="custom-control-input" id="weekcheck4">
                        <label class="custom-control-label" for="weekcheck4">Thusday</label>
                        <input type="radio" name="weekly_weekday" value="5" class="custom-control-input" id="weekcheck5">
                        <label class="custom-control-label" for="weekcheck5">Friday</label>
                        <input type="radio" name="weekly_weekday" value="6" class="custom-control-input" id="weekcheck6">
                        <label class="custom-control-label" for="weekcheck6">Saturday</label>
                        <input type="radio" name="weekly_weekday" value="7" class="custom-control-input" id="weekcheck7">
                        <label class="custom-control-label" for="weekcheck7">Sunday</label>
                    </p>
                        

                  
                </div>
                {{-- month --}}
                <div class="col-md-8 card-body float-left show-option" id="customRadiodiv3" style="display:none">                  
                   <div>
                        <p style="display:inline">
                            <input style="display:inline" type="radio" id="monthlyRadio1" name="monthly_pattern" value="monthly_option" class="custom-control-input">
                            Day <input type="number" name="monthly_day" style="display:inline"> of Every <input type="number" name="monthly_month_seperation" style="display:inline"> month(s)
                        </p>
                   </div> 
                   <div>
                        <p style="display:inline">
                            <input style="display:inline" type="radio" id="monthlyRadio2" checked name="monthly_pattern" value="monthly_fix" class="custom-control-input"> The 
                            <select name="monthly_number" id="" style="display:inline">
                                <option value="1">First </option>
                                <option value="2">Second </option>
                                <option value="3">Third </option>
                                <option value="4">Forth </option>
                            </select>
                            <select name="monthly_weekday" id="" style="display:inline">
                                <option value="1">Monday </option>
                                <option value="2">Tuesday </option>
                                <option value="3">Wednesday </option>
                                <option value="4">Thusday </option>
                                <option value="5">Friday </option>
                                <option value="6">Saturday </option>
                                <option value="7">Sunday </option>
                            </select> of every 
                            <input style="display:inline" class="recurrence-input" type="number" name="monthly_month"> month(s)
                        </p>
                   </div>
                </div>
                {{-- year --}}
                <div class="col-md-8 card-body float-left show-option" id="customRadiodiv4" style="display:none">
                    <div>
                         <p style="display:inline">
                            Recure in every <input type="number" name="yearly_year" class="recurrence-input" style="display:inline"> year(s)
                        </p>
                    </div>
                   
                   
                    <div>
                        <p style="display:inline">
                             <input style="display:inline" checked type="radio" id="yearRadio1" name="yearly_pattern" value="yearly_option" class="custom-control-input">ON
                        
                             <select style="display:inline" name="yearly_month" id="">
                                <option value="1">January</option>    
                                <option value="2">February</option>    
                                <option value="3">March</option>    
                                <option value="4">April</option>    
                                <option value="5">May</option>    
                                <option value="6">June</option>    
                                <option value="7">July</option>    
                                <option value="8">August</option>    
                                <option value="9">September</option>    
                                <option value="10">October</option>    
                                <option value="11">November</option>    
                                <option value="12">Dicember</option>    
                            </select>
                             <input style="display:inline" class="recurrence-input" name="yearly_month_day" type="number" > 
                        </p>
                       
                       
                       
                    </div>
                    <div >
                        <p  style="display:inline">
                            <input style="display:inline" type="radio" id="" name="yearly_pattern" value="yearly_fix" class="custom-control-input">
                            on the 
                            <select class="" style="display:inline" name="yearly_number" id="">
                                <option value="1">First </option>
                                <option value="2">Second </option>
                                <option value="3">Third </option>
                                <option value="4">Fourth </option>
                            </select>
                            <select name="yearly_week" id="" style="display:inline">
                                <option value="1">Monday </option>
                                <option value="2">Tuesday </option>
                                <option value="3">Wednesday </option>
                                <option value="4">Thusday </option>
                                <option value="5">Friday </option>
                                <option value="6">Saturday </option>
                                <option value="7">Sunday </option>
                            </select>
                            <select style="display:inline" name="yearly_fix_month" id="">
                                <option value="1">January</option>    
                                <option value="2">February</option>    
                                <option value="3">March</option>    
                                <option value="4">April</option>    
                                <option value="5">May</option>    
                                <option value="6">June</option>    
                                <option value="7">July</option>    
                                <option value="8">August</option>    
                                <option value="9">September</option>    
                                <option value="10">October</option>    
                                <option value="11">November</option>    
                                <option value="12">Dicember</option>     
                            </select>
                        </p>
                        
                        
                    </div>

                </div>
            </div>
            <div class="card col-md-12 bottom-div">
                <h3>Range of Recurrence</h3>
                <div class="col-md-6 float-left option-div">
                   <p style="display:inline">Start At: </p>
                   <input type="date" class="" value="{{ \Carbon\Carbon::today()->format('Y-m-d') }}" name="start_date" style="display:inline" required>
                </div>
                <div class="col-md-6 float-left show-option-bottom">
                    <div class="col-md-12 custom-control custom-radio">
                        <input type="radio" checked id="range_pattern1" value="no_end" name="range_pattern" class="custom-control-input">
                        <label class="custom-control-label" for="range_pattern1">NO end date</label>
                        
                    </div>
                    <div class="col-md-12 custom-control custom-radio">
                        <input type="radio" id="range_pattern2" value="end_ocurrence" name="range_pattern" class="custom-control-input">
                         <p style="display:inline">
                             End after <input style="display:inline" class="recurrence-input" name="max_recurrence"  type="number"> occurrence
                         </p>
                    </div>
                    <div class=" col-md-12 custom-control custom-radio">
                        <input type="radio" id="range_pattern3" name="range_pattern" value="end_date" class="custom-control-input">
                        <p style="display:inline">
                            End by <input type="date" value="{{ \Carbon\Carbon::today()->addMonths(12)->format('Y-m-d') }}" class="recurrence-input" name="end_date" style="display:inline">
                        </p>
                    </div>
                </div>
            </div>
            <div>
                <button class="btn btn-info">Save</button>
                <a class="btn btn-danger cross-and-cancel" >Cancel</a>
            </div>
        </div>
</form>
   <script>
       function show_recurrence_module(data){
           var arr=['customRadiodiv1','customRadiodiv2','customRadiodiv3','customRadiodiv4'];
           for(var i=0;i<5;i++){
               if(arr[i]==data){
                   $('#'+arr[i]).show();
               }else{
                   $('#'+arr[i]).hide();
               }
           }
       }
   
   $('.cross-and-cancel').click(function(e){
        //  console.log('hirec');
           
            $('#recurrence_box').hide();
   });
    
   </script>