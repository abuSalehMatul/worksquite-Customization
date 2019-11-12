  var id_list = new Array();
  var is_mass = false;
  var saved_action;
  var saved_id;
  
  $('.dropdown-submenu a.test').on("click", function(e){
        $(this).next('ul').toggle();
        e.stopPropagation();
        e.preventDefault();
    });
    function tasksearcher_two(){
        var value=$('#tasksearcher_two').val();
        $.ajax({
            type:'get',
            url:url('admin/task/all-task/pro/ajx/tasksearcher_two'),
            data:{'value':value},
            success:function(){
                 $('#tbod').fadeOut();
                    $('#tbod').load(url('admin/task/all-task/pro/ajx/showFullView'), function() {
                    $('#tbod').fadeIn();
                });
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
                 url:url('admin/task/all-task/pro/ajx/datesearcher'),
                 data:{'from':from, 'to':to},
                 success:function(response){
                    $('#tbod').fadeOut();
                    $('#tbod').load(url('admin/task/all-task/pro/ajx/showFullView'), function() {
                    $('#tbod').fadeIn();
                });
                 }
            });
        }
    }
  
    function searcher(id,type){
        var value=$('#'+id).val();
        console.log(value);
     
             $.ajax({
            type:'get',
            url:url('admin/task/all-task/pro/ajx/search'),
            data:{'id':id,'type':type,'value':value},
            success:function(data){
                console.log(data);
                var i;
                var arr=data.orginal;
                var res=data.result;
                // if(res.length==0){
                //     for(i=0;i<arr.length;i++){
                //         $('#'+arr[i]).show();
                //     }
                // }else{
                    for(i=0;i<arr.length;i++){
                    if(res.includes(arr[i])){
                        $('#'+arr[i]).show();
                    }else{
                        $('#'+arr[i]).hide();
                    }
                    }
              //  }
                
    
            }
        });
      
       
    }
    function hidecomplete(){
        $.ajax({
            type:'get',
            url:url('admin/task/all-task/pro/ajx/hidecomplete'),
            success:function(){
                 $('#tbod').fadeOut();
                       $('#tbod').load(url('admin/task/all-task/pro/ajx'), function() {
                                             $('#tbod').fadeIn();
                                        });
            }
        });
    }
    function change_to_group_by(group_name){
        $.ajax({
            type:'get',
            url:url('admin/task/all-task/pro/ajx/change_group_by'),
            data:{'group':group_name},
            success:function(){
                 $('#tbod').load(url('admin/task/all-task/pro/ajx'), function() {
                                             $('#tbod').fadeIn();
                                        });
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
   
      console.log(start_date);
     
      if(sub_name=='' ){
           
          alert('Not sufficient info. Please fill all the feild');
      }else{
          $.ajax({
              type:'get',
              url:url('admin/task/all-task/pro/ajx/submitSubTaskForm'),
              data:{'name':sub_name,'taskID':taskid,'start_date':start_date,'priority':priority,
                    'tag':tag,'est_hour':est_hour,'team':team,'assignee':assignee,'due_date':due_date},
              success:function(data){
                  console.log(data);
                  if(data=='success'){
                       $('#tbod').fadeOut();
                       $('#tbod').load(url('admin/task/all-task/pro/ajx'), function() {
                                             $('#tbod').fadeIn();
                                        });
                     
                    
                  }else{
                      alert('Some thing Went Wrong');
                  }
              }

          });
      }
    }
    function ajax_reload_without_update(){
         $('#tbod').fadeOut();
                       $('#tbod').load(url('admin/task/all-task/pro/ajx/only_view'), function() {
                                             $('#tbod').fadeIn();
                                        });
    }
    function recurrence(task_id){
        $.ajax({
            type:'get',
            url:url('admin/task/all-task/pro/ajx/recurrence'),
            data:{'id':task_id},
            success:function(res){
                if(res.recur=='no'){
                     $('#recurrence_box').show();
                     $('#recurrence_box').html(res.data);
                }
                else{
                     $('#recurrence_box').show();
                     $('#'+task_id).html(res.data);
                }
                
               
            }
        })
    }
    function delete_recurrence(id){
         $.ajax({
            type:'get',
            url:url('admin/task/all-task/pro/ajx/delete_recurrence'),
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
            url:url('admin/task/all-task/pro/ajx/edit_recurrence'),
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
            url:url('admin/task/all-task/pro/ajx/future_recurrence'),
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
        console.log(sub[i]);
        $('#task'+task+'subTask'+sub[i]).toggle(100);
        
    }
}
function actionOnproject( action, id){
    saved_action=action;
    saved_id=id;
     $.ajax({
        type:'get',
        url:url('admin/task/all-task/pro/ajx/showProjectForm'),
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
        url:url('admin/task/all-task/pro/ajx/showProjectForm'),
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
    console.log(due_date);
     action(saved_action,saved_id,pro_id,due_date,name);
}
$('#caret_pointer').click(function(e){
    $('.ul-nav-item').toggle();
})
function showTaskform(data){
    $('#taskformdata'+data).show();
    $('#hidethen'+data).hide();
}
function onTaskSubmit(random){
    var id='storeTask'+random;
    $.easyAjax({
            url: route('admin.all-tasks.store'),
            container: '#'+id,
            type: "POST",
            data: $('#'+id).serialize(),
            success: function (data) {
                console.log(data);
                $('#'+id).trigger("reset");
                $('.summernote').summernote('code', '');
            }
    })
}
function ajax_reloader_slide(){
   // $('#tbod').fadeOut();
    // $('#tbod').on('load',function(){
    //     $.ajax({
    //         type:'get',
    //         url:url('admin/task/all-task/pro/ajx'),
    //         success:function(res){
    //            // $('#tbod').html(res);
    //         }
    //     });
    // })
    $('#tbod').load(url('admin/task/all-task/pro/ajx'), function() {
                                           //  $('#tbod').fadeIn();
                                        });
}
function  contain_id_in_list(data){
    if(id_list.includes(data)==true){
        return true;
    }else{
        return false;
    }
}
function checked_id(id){
    if(id=='mass' && is_mass==false){
        is_mass=true;
        for( var j = 0; j < id_list.length; j++){ 
               
            id_list.splice(j, 1); 
              
        }
        if(id_list.includes('mass')==false){
             id_list.push('mass');
        }
       
    }else{
        for(var k=0;k<id_list.length;k++){
            if(id_list[k]=='mass'){
                id_list.splice(k,1);
            }
        }
        is_mass=false;
        var res= contain_id_in_list(id);
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
  
    console.info(id_list);
}
function action(action,id,pro_id='',due_date='2020-04-11',name){
    $.ajax({
        type:'get',
        url:url('admin/task/all-task/pro/ajx/take_action'),
        data:{'action':action,'id':id,'pro_id':pro_id,'due_date':due_date,'name':name},
        success:function(response){
            console.log(response);
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
        url:url('admin/task/all-task/pro/ajx/take_action'),
        data:{'action':action,'id':id_list,'pro_id':pro_id,'due_date':due_date},
        success:function(response){
            console.log(response);
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
$("#checkedAllcheck").click(function(){
    console.log('kir');
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

  $(".checkSingle").click(function () {
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
// $('.taskform').click(function(){
//     var data=$('#projectID').val();
//       $.ajax({
//             type:'get',
//             url:url('admin/task/all-task/pro/ajx/showTaskForm'),
//             data:{value:data},
//             success:function(data){
//                 console.log(data);
//                  $('#task_input').html(data.html);
//                  $('.taskform').html('<h4>Create A New Task</h4>');
//             }
//         })
// });
//   var $sortable = $( "#tablelist > tbody" );
//   $sortable.sortable({
//       stop: function ( event, ui ) {
//           var parameters = $sortable.sortable( "toArray" );
//         //   $.post("studentPosition.php",{value:parameters},function(result){
//         //       alert(result);
//         //   });
//            $.ajax({
//             type:'get',
//             url:url('admin/task/all-task/pro/ajx/change_position'),
//             data:{value:parameters},
//             success:function(data){
//                 console.log(data);
               
//             }
//         })
//       }
//   });

  function showSubTaskForm(data){
      var id=data;
       $.ajax({
            type:'get',
            url:url('admin/task/all-task/pro/ajx/showSubTaskForm'),
            data:{value:data},
            success:function(data){
                console.log(data);
                 $('#sub_task_input'+id).html(data.html);
            }
        })
  }

   $( ".row_position" ).sortable({
       cursor: 'move',
        delay: 150,
        stop: function() {
            var selectedData = new Array();
            $('.kmneki').each(function() {
                selectedData.push($(this).attr("id"));
            });
            console.info(selectedData);
             updateOrder(selectedData);
           
        }
    });

   function updateOrder(select_ids){
            $.ajax({
                type:'get',
                url:url('admin/task/all-task/pro/ajx/change_position'),
                data:{ids:select_ids},
                success:function(dta){
                    console.log(dta);
                    if(dta=='success'){
                        console.log(dta);
                        ajax_reloader_slide();
                    }
                }
            });
   }