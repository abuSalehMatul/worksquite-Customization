<script>
var click_for_drag_db=0;
var click_for_drag=false;
var id_list = new Array(); 
var is_mass= 'false';
var saved_action;
var saved_id;
var size= [];
var container_bucket_rows=[];
var all_row_postion_id=new Array();
function change_num_record_to_show(v_data_size,change_num_record_to_show){
    let number_is=$('#shows_how_many_record').val();
   // console.log(number_is);
    $.ajax({
        type:'get',
        data:{'num':number_is},
        url:'{{url('admin/task/all-task/pro/ajx/change_num_record_to_show')}}',
        success:function(){
                let total=[];
                $('.kmneki').each(function() {
                    total.push($(this).attr("id"));
                });
                let per_page=total.length/number_is;
                let p=per_page;
                let tem=[];
                container_bucket_rows=[];
                //console.log(total.length/per_page);
                let j=0;
                for(let i=0;i<total.length/p;i++){
                    //    console.log(per_page);
                    for(;j<per_page;j++){
                        console.log(j);
                        console.log(total[j]);
                        tem.push(total[j]);
                    }
                    per_page=p*(i+2);
                    container_bucket_rows.push(tem);
                    tem=[];
                }
                console.log(container_bucket_rows);
            //ajax_reloader_slide();
            pagination_build();
            show_section_of(0);
          
        }
    });
   

}
function pagination_build(){
    let node;
    let n=document.querySelectorAll('.pagination_class');
    for(let j=0;j<n.length;j++){
        n[j].remove();
    }
    for(let i=0;i<container_bucket_rows.length;i++){
        node=document.createElement('div');
        node.innerHTML="<button class='btn btn-sm btn-secondary float-left' onclick='show_section_of("+i+")'>"+ i+ "</button>";
        let parent=document.getElementById('pagination_links_my');
        node.style.display="inline";
        $(node).addClass('pagination_class');
        parent.appendChild(node);
    }
}
function show_section_of(page_no){
    for(let i=0;i<container_bucket_rows.length;i++){
        if(i==page_no){
            for(let j=0;j<container_bucket_rows[i].length;j++){
                let n=document.getElementById(container_bucket_rows[i][j]);
                $(n).show();
            }
        }
        else{
            for(let j=0;j<container_bucket_rows[i].length;j++){
                let n=document.getElementById(container_bucket_rows[i][j]);
                $(n).hide();
            }
        }
    }
}
function construct_new_sel(other_rows,single_row,tar){
  //  console.log(other_rows);
    let is_insert=0;
    let build_arr=[];
    for(let i=0;i<other_rows.length;i++){
        if(other_rows[i]==tar){
            build_arr.push(other_rows[i]);
            build_arr.push(single_row);
        }
        else{
            build_arr.push(other_rows[i]);
        }
    }

    return build_arr;
}
function create_new_task(){
    event.preventDefault();
    $.ajax({
        type:'get',
        url:'{{url('admin/task/all-task/pro/create_new')}}',
        success:function(res){
            
            let n=document.getElementById('recurrence_box');
            $(n).addClass('middling_popup');
           
            $('#recurrence_box').html(res);
        }

    });
}
$(document).click(function (e) {
    if (!$(e.target).hasClass("fas") 
        && $(e.target).parents(".dropdown").length === 0) 
    {
        $(".dropdown-content").hide();
    }
});
//onload function 
window.onload = function() {
  get_all_row_position_id();
  drag_and_drop();
 // console.log(all_row_postion_id);
  
};
//hide all dami row
function hide_fake_rows(){
    let all_fake_rows=document.getElementsByClassName('lower_on_drag_fake_row');
    $.each(all_fake_rows,function(){
        $(this).hide();
    });
}
//show fake row for drop targer
function show_fake_rows(current_el){
    hide_fake_rows();
    let pos=$(current_el).offset();
    pos=pos.top;
    let res;
    for(let i=0;i<size.length;i++){
        if(size[i][0]>pos){
            res=size[i-1][1];
            break;
        }
    }
    $('#lower_drag_id'+res).show();
    return res;

}
// list of all rows(visiable right now)
function list_down_all_visible_row_height(){
    let rows=[];
    rows=document.getElementsByClassName('kmneki');
    size= [];
    let tem_arr=[];
    $.each(rows,function(){
       
        if(size.length>0){
            let get_last=size[size.length-1][0];
            if($(this).offset().top > get_last && $(this).is(":visible")){
                tem_arr=[];
                tem_arr.push($(this).offset().top);
                tem_arr.push($(this).attr('id'));
                size.push(tem_arr);
               // console.log();
            }
        }else{

            tem_arr=[];
            tem_arr.push($(this).offset().top);
            tem_arr.push($(this).attr('id'));
            size.push(tem_arr);
        }
    });
  //  console.log(size);
}

// drag and drop core function
function drag_and_drop(){
    get_all_row_position_id();
    let initial_size=document.getElementsByClassName('kmneki')[0].getBoundingClientRect();
    let initial_left=initial_size.x;
    click_for_drag=false;
    let last_left;
    let last_top;
    hide_fake_rows();
    let all_rows=[];
    all_rows=document.querySelectorAll('.kmneki');
    for(let i=0;i<all_rows.length;i++){      
        all_rows[i].ondragstart = function() {
            return false;
        };
        
        // all_rows[i].addEventListener('dbclick',function(){
        //     click_for_drag_db=1;
        // });
        all_rows[i].addEventListener('click',function(event){
            event.stopPropagation();
            click_for_drag=false;
            setTimeout(function(){
                click_for_drag=true;
                 console.log(click_for_drag);
            },300);
            setTimeout(function(){
                click_for_drag=false;
                  console.log(click_for_drag);
            },800);
            console.log(click_for_drag);
        });
       
       
        //console.log(all_rows[i].id);
       // all_rows[i].removeEventListener('mousedown',function(){});
        all_rows[i].addEventListener('mousedown',function(event){ 
        event.stopPropagation();
        if(click_for_drag==true){   
            click_for_drag=true;   
            let firstx=event.pageX;  
           
            // var old_table=document.getElementById('old_table');
            // let parent= document.getElementById('tbod');
            list_down_all_visible_row_height();
            all_rows[i].style.position='absolute';
            all_rows[i].classList.add('dragging_tr');
            all_rows[i].style.zIndex = 1000;
            document.body.append(all_rows[i]);
            let chnagex=0;
            
            moveAt(event.pageX, event.pageY);
            function moveAt(pageX, pageY) {
                if(chnagex== 0){
                    chnagex=initial_left;
                } 
                else{
                chnagex=pageX-firstx;
                chnagex=chnagex+initial_left;
                }
                
                all_rows[i].style.left =chnagex + 'px';
                all_rows[i].style.top = pageY - all_rows[i].offsetHeight/2 + 'px';
                show_fake_rows(all_rows[i]);
            }
            // (3) move the ball on mousemove
            function onMouseMove(event) {
               
                event.stopPropagation();
                moveAt(event.pageX, event.pageY);
            }
            // (3) move the ball on mousemove
            document.addEventListener('mousemove', onMouseMove);
            // (4) drop the ball, remove unneeded handlers
            document.addEventListener('mouseup', function(event){
                var dragged_el_id=all_rows[i].id;
                let initial_top;
                document.removeEventListener('mousedown',function(){});
                document.removeEventListener('mousemove', onMouseMove);
                event.stopPropagation();
                let task_or_sub=check_what_is_dragging(dragged_el_id);
               
                last_left=$('#'+dragged_el_id).offset().left;
                last_top=$('#'+dragged_el_id).offset().top;
                for(let i=0;i<size.length;i++){
                    if(size[i][1]==dragged_el_id){
                        initial_top=size[i][0];
                      //  console.log(size);
                    }
                }
              //  console.log(initial_left);
               
                if(initial_left+200 > last_left && initial_left-100 < last_left){
                    if(task_or_sub=='sub'){
                        //sub to parent
                       
                      //  console.log(last_left);
                        if(initial_top-last_top<30 ){
                            console.log('subtotask');
                            if(initial_left-last_left>-70 && initial_left-last_left<70){
                                  //  updateOrder('sub_to_task');
                                  console.log('subtotask');
                                  sub_to_task(dragged_el_id,all_rows[i]);
                            }
                        }
                            
                        //end of sub to parent
                        else{
                            var selected_id=[];
                            let n=show_fake_rows(all_rows[i]);
                            $(all_rows[i]).removeClass('kmneki');
                            $('.kmneki').each(function() {
                                    selected_id.push($(this).attr('id'));
                            });
                            let construct_new_selected=construct_new_sel(selected_id,all_rows[i].id,n);
                            console.log(construct_new_selected);
                            change_parent_sub(construct_new_selected,all_rows[i]);
                        }
                    }
                    else{
                        var selected_id=[];
                        let n=show_fake_rows(all_rows[i]);
                        $(all_rows[i]).removeClass('kmneki');
                        $('.kmneki').each(function() {
                                selected_id.push($(this).attr('id'));
                        });
                        let construct_new_selected=construct_new_sel(selected_id,all_rows[i].id,n);
                      //  console.log(construct_new_selected);
                        updateOrder(construct_new_selected,all_rows[i]);
                    }
                }
                else{
                  //  console.log('niche');
                    
                    event.stopPropagation();
                    all_rows[i].remove();
                    $('#tbod').load('{{url('admin/task/all-task/pro/ajx')}}', function() {
                    drag_and_drop();
                    });
                }

            });
        }
       });
        
   }
}
//check what is dragging row or column
function check_what_is_dragging(attr_id){
    for(let i=0;i<attr_id.length;i++){
        if(attr_id[i]=='s' && attr_id[i+1]=='u' && attr_id[i+2]=='b' && attr_id[i+3]=='T'){
            if(attr_id[i+7]=='-'){
                return 'task';
            }else{
                return 'sub';
            }
        }
    }
}

//subtotaks
function sub_to_task(id,node){
   
    $.ajax({
                type:'get',
                url:'{{url('admin/task/all-task/pro/ajx/sub_to_task')}}',
                data:{'id':id},
                success:function(dta){
                  //  console.log(dta);
                    if(dta=='success'){
                    //    console.log(dta);
                       ajax_reloader_slide();
                       node.remove();
                    }
                }
            });
}
//update function 
function updateOrder(select_ids,node){
           // console.log(current);
          
            $.ajax({
                type:'get',
                url:'{{url('admin/task/all-task/pro/ajx/change_position')}}',
                data:{'ids':select_ids,'old_ids':all_row_postion_id},
                success:function(dta){
                  //  console.log(dta);
                    if(dta=='success'){
                    //    console.log(dta);
                       ajax_reloader_slide();
                       node.remove();
                    }
                }
            });
   }
//end of update function
// change prnt
function change_parent_sub(data,node){
    node.remove();
        $.ajax({
            type:'get',
            url:'{{url('admin/task/all-task/pro/ajx/sub_to_parent_change')}}',
            data:{'ids':data},
            success:function(dta){
                //  console.log(dta);
                if(dta=='success'){
                //    console.log(dta);
                    ajax_reloader_slide();
                    //location.reload();
                }
            }
        });
}
//end of chang par
function iterate_input_to(id){
     $("#"+id).show();

   
}
function get_all_row_position_id(){
     $('.kmneki').each(function() {
                all_row_postion_id.push($(this).attr("id"));
        });

}
function quickchange(id_to_get,id_to_change,column){
    var new_value=$('#'+id_to_get).val();
    $.ajax({
        type:'get',
        url:'{{url('admin/task/all-task/pro/ajx/quick_change_row')}}',
        data:{'new_value':new_value,'id':id_to_change,'column':column},
        success:function(data){
         //   console.log(data);
            if(data=='success'){
                ajax_reloader_slide();
            }
        }
    })
}
function edit_single_task(id_value){
    $.ajax({
        type:'get',
        data:{'id':id_value},
        url:'{{url('admin/task/all-task/pro/ajx/edit_single_row')}}',
        success:function(res){
            $('#recurrence_box').html(res);
        }
    })
}

function showtaskon(data){
    // console.log(data);
var arr=['all_task','my_task','today_due','tomorrow_due','due'];
    $.ajax({
        type:'get',
        url:'{{url('admin/task/all-task/pro/ajx/showTaskon')}}',
        data:{'data':data},
        success:function(response){
         //   console.log(response);
         ajax_reloader_slide();
            
        }
    });
        var i;
            for(i=0;i<5;i++){
                
                if(arr[i]==data){
                    // console.log();
                    $('#'+arr[i]).addClass('top-bar-select');
                }else{
                    $('#'+arr[i]).removeClass('top-bar-select');
                }
            }
}

    $('.dropdown-submenu a.test').on("click", function(e){
        $(this).next('ul').toggle();
        e.stopPropagation();
        e.preventDefault();
    });
    function tasksearcher_two(){
        var value=$('#tasksearcher_two').val();
        $.ajax({
            type:'get',
            url:'{{url('admin/task/all-task/pro/ajx/tasksearcher_two')}}',
            data:{'value':value},
            success:function(){
                ajax_reloader_slide();
            }
        });
    }
    function datesearcher(){
        var from=$('#date_from_value').val();
        var to=$('#date_to_value').val();
       
        if(to<from){
            alert('Invalid secquence of input sir..');
        }else{
            $.ajax({
                 type:'get',
                 url:'{{url('admin/task/all-task/pro/ajx/datesearcher')}}',
                 data:{'from':from, 'to':to},
                 success:function(response){
                    ajax_reloader_slide();
                 }
            });
        }
    }
  
    function searcher(id,type){
        var value=$('#'+id).val();
      //  console.log(value);
     
             $.ajax({
            type:'get',
            url:'{{url('admin/task/all-task/pro/ajx/search')}}',
            data:{'id':id,'type':type,'value':value},
            success:function(data){
              //  console.log(data);
                var i;
                var arr=data.orginal;
                var res=data.result;
                
                    for(i=0;i<arr.length;i++){
                        if(res.includes(arr[i])){
                            $('#'+arr[i]).show();
                        }else{
                            $('#'+arr[i]).hide();
                        }
                    }
             
                
    
            }
        });
      
       
    }
    function hidecomplete(){
        $.ajax({
            type:'get',
            url:'{{url('admin/task/all-task/pro/ajx/hidecomplete')}}',
            success:function(){
                ajax_reloader_slide();
            }
        });
    }
    function change_to_group_by(group_name){
        $.ajax({
            type:'get',
            url:'{{url('admin/task/all-task/pro/ajx/change_group_by')}}',
            data:{'group':group_name},
            success:function(){
                 ajax_reloader_slide();
            }

        })
    }
    function date_setter(date){
        var d=date.getDate();
        var m=date.getMonth() + 1;
        var year = date.getFullYear();
        return year+'-'+m+'-'+d;
    }
    function onSubTaskSubmit(){
     
      var sub_name=$('#subtask_sub').val();
   
     var assignee=$('#assignee_sub').val();
     var team=$('#team_id_sub').val();
     var start_date = new Date($('#start_date_sub').val());
         start_date=date_setter(start_date);
      var priority=$('#priority_sub').val();
      var due_date= new Date($('#due_date_sub').val());
          due_date=date_setter(due_date);
      var tag=$('#tag_sub').val();
      var est_hour=$('#est_hour_sub').val();
      var act_hour=$('#act_hour_sub').val();
      var taskid=$('#taskID_sub').val();
   
   //   console.log(start_date);
     
      if(sub_name=='' ){
           
          alert('Not sufficient info. Please fill all the feild');
      }else{
          $.ajax({
              type:'get',
              url:'{{url('admin/task/all-task/pro/ajx/submitSubTaskForm')}}',
              data:{'name':sub_name,'taskID':taskid,'start_date':start_date,'priority':priority,
                    'tag':tag,'est_hour':est_hour,'team':team,'assignee':assignee,'due_date':due_date},
              success:function(data){
                //  console.log(data);
                  if(data=='success'){
                    ajax_reloader_slide();
                     
                    
                  }else{
                      alert(data);
                  }
              }

          });
      }
    }
   
    function recurrence(task_id,type='psudu'){
        event.stopPropagation();
        $.ajax({
            type:'get',
            url:'{{url('admin/task/all-task/pro/ajx/recurrence')}}',
            data:{'id':task_id,'type':type},
            success:function(res){
                if(res.recur=='no'){
                     let n=document.getElementById('recurrence_box');

                     $(n).addClass('middling_popup_re');
                     $('#recurrence_box').show();
                     $('#recurrence_box').html(res.data);
                }
                else{
                    let n=document.getElementById('recurrence_box');
                    $(n).addClass('middling_popup_re');
                     $('#recurrence_box').show();
                     $('#'+task_id).html(res.data);
                }
                
               
            }
        })
    }
    function delete_recurrence(id){
         $.ajax({
            type:'get',
            url:'{{url('admin/task/all-task/pro/ajx/delete_recurrence')}}',
            data:{'id':id},
            success:function(res){
                if(res=='success'){
                     ajax_reloader_slide();
                }
            }
        });
    }
    function edit_recurrence(id){
        $.ajax({
            type:'get',
            url:'{{url('admin/task/all-task/pro/ajx/edit_recurrence')}}',
            data:{'id':id},
            success:function(res){
              //  console.log(res);
               
                      $('#recurrence_box').show();
                       $('#recurrence_box').html(res);
              

            }
        });
    }
    function calculate_future(task_id){
        $.ajax({
            type:'get',
            url:'{{url('admin/task/all-task/pro/ajx/future_recurrence')}}',
            data:{'id':task_id},
            success:function(res){
                $('.tip-content').html(res);
            }
        });
    }
    $('.dropdown-trigger-setting').dropdown();

 
function show_sub_task(sub, task){
    var arrayLength = sub.length;
    for (var i = 0; i < arrayLength; i++) {
    //    console.log(sub[i]);
        $('#task'+task+'subTask'+sub[i]).toggle();
        
    }
    list_down_all_visible_row_height();
   
}
function actionOnproject( action, id){
    saved_action=action;
    saved_id=id;
     $.ajax({
        type:'get',
        url:'{{url('admin/task/all-task/pro/ajx/showProjectForm')}}',
        data:{'val':'single','id':id,'action':action},
        success:function(res){
            $('.summernote').html(res);

        }
    });
}
function massactionOnproject(data){
    saved_action=data;
    $.ajax({
        type:'get',
        url:'{{url('admin/task/all-task/pro/ajx/showProjectForm')}}',
        data:{'val':data},
        success:function(res){
            $('.summernote').html(res);

        }
    });
}
function take_pro_copy_move(){
    var pro_id=$('#select_for_pro').val();
    var due_date=$('#new_date').val();
  //  console.log(due_date);
    massaction(saved_action,pro_id,due_date);
}
function take_pro_copy_move_on_single(){
     var pro_id=$('#select_for_pro').val();
      var due_date=$('#new_date').val();
      var name=$('#action_task_name').val();
  //  console.log(due_date);
     action(saved_action,saved_id,pro_id,due_date,name);
}
$('#caret_pointer').click(function(e){
    $('.ul-nav-item').toggle();
})
function showTaskform(data){
    $('#taskformdata'+data).show();
    $('#hidethen'+data).hide();
}
function onTaskSubmit(random,is_recur='no'){
    event.preventDefault();
    var id='storeTask'+random;
    $.easyAjax({
            url: '{{route('admin.pro_task_save')}}',
            container: '#'+id,
            type: "POST",
            data: $('#'+id).serialize(),
            success: function (data) {
              //  console.log(data);
              //  console.log(is_recur);
               
                     $('#'+id).trigger("reset");
                    // $('.summernote').summernote('code', '');
                    $('#quick_task_create').hide();
                  
                    if(is_recur=='recurrence'){
                        recurrence(data,'original');
                    }
                    else{
                        ajax_reloader_slide();
                    }
                
                
            }
    })
}
function onTaskEditSubmit(random,is_recur='no'){
    event.preventDefault();
    var id='storeEditTask'+random;
    $.easyAjax({
            url: '{{route('admin.pro_task_edit')}}',
            container: '#'+id,
            type: "POST",
            data: $('#'+id).serialize(),
            success: function (data) {
               // console.log(data);
               // console.log(is_recur);
               
                     $('#'+id).trigger("reset");
                    // $('.summernote').summernote('code', '');
                    $('#quick_task_create').hide();
                  
                    if(is_recur=='recurrence'){
                        recurrence(data,'original');
                    }
                    else{
                        ajax_reloader_slide();
                    }
                
                
            }
    })
}
function ajax_reloader_slide(){
  
  
    
    $('#tbod').load('{{url('admin/task/all-task/pro/ajx')}}', function() {
        drag_and_drop();
    });
  //  click_for_drag=false;
    
   
}
function  contain_id_in_list(data){
    if(id_list.includes(data)==true){
        return true;
    }else{
        return false;
    }
}

function checked_id(id){
    var res;
    if(id=='mass' && is_mass==='false'){
     //   console.log(is_mass);
        is_mass='true';
        id_list=all_row_postion_id;
       
    }
    else if(id=='mass' && is_mass==='true'){
        is_mass='false';
        id_list=[];
    }
    else if(id!=='mass' && is_mass=='true'){
         res= contain_id_in_list(id);
         if(res==true){
             for( var i = 0; i < id_list.length; i++){ 
                    if ( id_list[i] == id) {
                        id_list.splice(i, 1); 
                    }
            }
         }
    }
    else if(id!=='mass' && is_mass=='false'){
        
        res= contain_id_in_list(id);
       
        if(res==false && id!='mass')
        {    // console.log('hi');
            id_list.push(id);
        
        } else {
        // console.log('hello');
            for( var i = 0; i < id_list.length; i++){ 
                    if ( id_list[i] == id) {
                        id_list.splice(i, 1); 
                    }
            }
            
        }
    }
  
  //  console.info(id_list);
}
function action(action,id,pro_id='',due_date='2020-04-11',name){
    $.ajax({
        type:'get',
        url:'{{url('admin/task/all-task/pro/ajx/take_action')}}',
        data:{'action':action,'id':id,'pro_id':pro_id,'due_date':due_date,'name':name},
        success:function(response){
          //  console.log(response);
            if(response.status=='success'){
                alert(response.message);
            }
            ajax_reloader_slide();
        }
    });
}
function massaction(action,pro_id='',due_date='2020-04-11'){
    $.ajax({
        type:'get',
        url:'{{url('admin/task/all-task/pro/ajx/take_action')}}',
        data:{'action':action,'id':id_list,'pro_id':pro_id,'due_date':due_date},
        success:function(response){
          //  console.log(response);
             if(response.status=='success'){
                alert(response.message);
            }
            ajax_reloader_slide();
        }
    })
}
function mass_setter(){
    if(id_list[0]!='mass'){
        for( var i = 0; i < id_list.length; i++){ 
            id_list.splice(i, 1); 
        }
        id_list.push('mass');
         
    }else{
        id_list.pop();
    }
    
}
$(document).on('click', '#checkedAllcheck', function() {
  
     if(this.checked){
      $(".checkSingle").each(function(){
        this.checked=true;
      })              
    }else{
      $(".checkSingle").each(function(){
        this.checked=false;
      })              
    }
});

$(document).on('click', '#div', function() {
   
    if ($(this).is(":checked")){
      var isAllChecked = 0;
      $(".checkSingle").each(function(){
        if(!this.checked)
           isAllChecked = 1;
      })              
      if(isAllChecked == 0){ $("#checkedAllcheck").prop("checked", true); }     
    }else {
      $("#checkedAllcheck").prop("checked", false);
    }
});


function showSubTaskForm(data){
    var id=data;
    $.ajax({
        type:'get',
        url:'{{url('admin/task/all-task/pro/ajx/showSubTaskForm')}}',
        data:{value:data},
        success:function(data){
            //   console.log(data);
                $('#sub_task_input'+id).html(data.html);
        }
    })
}
 function do_sort(order,data){
    $.ajax({
        type:'get',
        url:'{{url('admin/task/all-task/pro/ajx/do_sort')}}',
        data:{'order':order,'data':data},
        success:function(res){
           
        }
    })
}

//   function children(){
//       console.log('children');
//   }
    // var is_changing_sub=0;
   
//    $( ".row_position" ).sortable({
//        connectWith: '.row_position',
//         cursor: 'move',
//         tolerance: "pointer",
//         delay: 150,
//         scroll: true,
//         distance: 5,
//         classes: {
//             "ui-sortable": "highlight"
//         },
//         start:function(event,ui){
//             is_changing_sub=1;
//             console.log('start');
            
//             attr_id = ui.item.attr('id');
//             for(let i=0;i<attr_id.length;i++){
//                 if(attr_id[i]=='s' && attr_id[i+1]=='u' && attr_id[i+2]=='b' && attr_id[i+3]=='T'){
//                     if(attr_id[i+7]=='-'){
//                         is_changing_sub=0;
//                     }else{
                    
//                     }
//                 }
//             }
//             console.log(is_changing_sub);
//         },
//         update: function (event, ui) {
//             console.log('update');
//             console.log(ui);
//              is_updating=1;
                        
//             // // task201subTask-100
           
            
//         },
//         stop: function(event, ui) {
//             console.log('stop');
//             console.log(ui);
//             if(is_changing_sub==0){
//                 if(is_updating==1){
//                 previous_top=ui.originalPosition.top;
//                 previous_left= ui.originalPosition.left;
//                 now_top= ui.position.top;
//                 now_left=ui.position.left;
//                 }else{
//                     previous_left= ui.originalPosition.left;
//                     now_left=ui.position.left;
                   
//                 }
//             }else{
//                 if(is_updating==1){
//                 previous_top=ui.originalPosition.top;
//                 previous_left= ui.originalPosition.left;
//                 now_top= ui.position.top;
//                 now_left=ui.position.left;
//                 if(previous_top-now_top <50 && previous_top-now_top> -50){
//                     if(now_left-previous_left50){
//                         //sub to task
//                         daction='sub_to_task';
//                     }
//                 }
//                 }else{
//                     previous_left= ui.originalPosition.left;
//                     now_left=ui.position.left;
//                     if(now_left-previous_left<-50){
//                         //sub to task
//                         daction='sub_to_task';
//                     }
//                 }
//             }
            
//             var selectedData = new Array();
//             $('.kmneki').each(function() {
//                 selectedData.push($(this).attr("id"));
//             });
//             // console.info(selectedData);
//              updateOrder(selectedData,attr_id);
           
//         },
       
//     });

 
   
  





function exportData(){

var startDate = $('#date_from_value').val();

if (startDate == '') {
    startDate = null;
}

var endDate = $('#date_to_value').val();

if (endDate == '') {
    endDate = null;
}

var projectID = '';
if (!projectID) {
    projectID = 0;
}
var hideCompleted = '0';
if ($('#hide-completed-tasks').is(':checked')) {
     hideCompleted = '1';
} else {
     hideCompleted = '0';
}

var url = '{!!  route('admin.all-tasks_pro.export', [':startDate', ':endDate', ':projectId', ':hideCompleted']) !!}';

url = url.replace(':startDate', startDate);
url = url.replace(':endDate', endDate);
url = url.replace(':hideCompleted', hideCompleted);
url = url.replace(':projectId', projectID);

window.location.href = url;
}






   

    //    update task
    $('#store-task-pro').click(function () {
        $.easyAjax({
            url: '{{route('admin.pro_task_save')}}',
            container: '#storeTask',
            type: "POST",
            data: $('#storeTask').serialize(),
            success: function (data) {
               // console.log(data);
                $('#storeTask').trigger("reset");
                $('.summernote').summernote('code', '');
            }
        })
    });

    jQuery('#due_date2, #start_date2').datepicker({
        autoclose: true,
        todayHighlight: true
    });

    $(".select2").select2({
        formatNoMatches: function () {
            return "{{ __('messages.noRecordFound') }}";
        }
    });

    $('#project_id').change(function () {
        var id = $(this).val();
        var url = '{{route('admin.all-tasks.members', ':id')}}';
        url = url.replace(':id', id);

        $.easyAjax({
            url: url,
            type: "GET",
            redirect: true,
            success: function (data) {
                $('#user_id').html(data.html);
            }
        })
    });


     $('#createTaskCategory').click(function(){
        var url = '{{ route('admin.taskCategory.create-cat')}}';
        $('#modelHeading').html("@lang('modules.taskCategory.manageTaskCategory')");
        $.ajaxModal('#taskCategoryModal', url);
    })

</script>