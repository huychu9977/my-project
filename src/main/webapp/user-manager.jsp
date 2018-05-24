<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Thông Tin Người Dùng</title>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.js"></script>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
      <link href="<%=request.getContextPath()%>/css/main.css">
      <link rel="stylesheet" type="text/css"  href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
      <script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css">
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
      <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
   </head>
   <body>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <h4>Xin chào ${username }</h4>
               <br>
               <br>
               <p data-placement="top" data-toggle="tooltip" title=""><a href="detail" class="btn btn-primary btn-lg" data-title="Add" ><span class="glyphicon glyphicon-plus"></span> Thêm mới</a></p>
               <br>
               <div class="table-responsive col-md-12">
               
                  <table id="mytable" class="table table-bordred table-striped">
                     <thead>
                        <th>Full Name</th>
                        <th>Address</th>
                        <th>Birthday</th>
                        <th>Gender</th>
                        <th>Edit</th>
                        <th>Delete</th>
                     </thead>
                   
                  </table>
                  <div class="clearfix"></div>

               </div>
            </div>
         </div>
      </div>
      <!-- Xóa -->
      <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
		   <div class="modal-dialog">
		      <div class="modal-content">
		         <div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		            <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
		         </div>
		         <div class="modal-body">
		            <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
		         </div>
		         <div class="modal-footer ">
		            <button type="button" userid="" id="btnDelete" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
		            <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
		         </div>
		      </div>
		      <!-- /.modal-content --> 
		   </div>
		   <!-- /.modal-dialog --> 
		</div>
      <!-- Them moi -->
	      <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
	         <div class="modal-dialog">
	         	<form:form id="editFrm" action="edit" method="post" modelAttribute="user">
	         	
		            <div class="modal-content">
		               <div class="modal-header">
		                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		                  <h4 class="modal-title custom_align" id="Heading">Sửa thông tin người dùng</h4>
		               </div>
		               <div class="modal-body">
		               	  <div class="form-group hidden">
		                  	<label for="sel1">ID</label>
		                     <form:input class="form-control " required="required" path="id" type="text" placeholder="ID..."/>
		                  </div>
		                  <div class="form-group">
		                  	<label for="sel1">Full name</label>
		                     <form:input class="form-control " required="required" path="name" type="text" placeholder="Name..."/>
		                  </div>
		                  <div class="form-group">
		                  		<label for="sel1">Address</label>
		                     <form:input class="form-control " required="required" path="address" type="text" placeholder="Address..."/>
		                  </div>
		                  <div class="form-group">
		                   	 <label for="sel1">Birthday</label>
		                     <form:input class="form-control" id="datepicker" required="required" path="birthday" type="text" placeholder="Birthday..."/>
		                  </div>
		                  <div class="form-group gender">
							  <label for="sel1">Gender</label>
							  <form:radiobutton name="gender" required="required" path="gender" value="0"/>Nữ 
							  <form:radiobutton name="gender" required="required" path="gender" value="1"/>Nam 
							</div>
		               </div>
		               <div class="modal-footer ">
		                  <form:button type="submit" id="btnAdd" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> SAVE</form:button>
		               </div>
		            </div>
		            
	            </form:form>
	            <!-- /.modal-content --> 
	         </div>
	         <!-- /.modal-dialog --> 
	      </div>
	      
   </body>
   <script type="text/javascript">
   $(document).ready( function () {
	   $('#mytable').on( 'draw.dt', function () {
		  $('.dete').click(function(){
			   $('#btnDelete').attr('userid',$(this).attr('iduser'));
		  });
		  
		  $('.btnEdit').click(function(){
			  console.log($(this).attr('idedit'));
			  $('#id').val($(this).attr('idedit'));
			  $('#name').val($(this).parents('tr').children().eq(0).text());
			  $('#address').val($(this).parents('tr').children().eq(1).text());
			  $('#datepicker').val($(this).parents('tr').children().eq(2).text());
			  
			    switch($(this).parents('tr').children().eq(3).text()){
		  		case 'Nam' : {
		  			console.log('nam')
		  			$('#gender2').prop('checked', true);
		  			break;
		  		}
		  		case 'Nữ' : {
		  			console.log('nữ')
		  			$('#gender1').prop('checked', true);
		  			break;
		  		}
		  }
		  })
		  
	   })
	   $('#btnDelete').click(function(){
		   $.ajax({
			   url: 'delete',
			   type: 'post',
			   data: {
				   'id' : $(this).attr('userid')
			   },
			   success: function(data){
				   if(data == 'true'){
					   $('#delete').modal('toggle');
					   table.draw(false);
				   }
			   }
		   })
	   })
	 	$('#editFrm').submit(function(e){
	 		e.preventDefault();
	 		$.ajax({
	 			url: 'edit',
	 			type: 'post',
	 			
	 			data: $(this).serialize(),
	 			
	 			success: function(data){
	 				if(data == 'true'){
	 					table.draw(false);
	 					$('#edit').modal('toggle');
	 				}
	 			}
	 		})
	 	})
	 	var table = $('#mytable').DataTable({
	 	    	
	 	    	"bProcessing": true,
	 	        "bServerSide": true,
	 	        "sort": "position",
	 	        //bStateSave variable you can use to save state on client cookies: set value "true" 
	 	        "bStateSave": true,
	 	        //Default: Page display length
	 	        "iDisplayLength": 10,
	 	        //We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
	 	        "iDisplayStart": 0,
	 	        "fnDrawCallback": function () {
	 	            //Get page numer on client. Please note: number start from 0 So
	 	            //for the first page you will see 0 second page 1 third page 2...
	 	            //Un-comment below alert to see page number
	 	        	//alert("Current page number: "+this.fnPagingInfo().iPage);    
	 	        },         
	 	        "sAjaxSource": "users",
	 	        "aoColumns": [
	 	                      
	 	            { "mData": "name" },
	 	            { "mData": "address" },
	 	            { "mData": "birthday" },
	 	            { "mData": "gender", render: function(data, type){
	 	            		//console.log(data);
	 	                    switch (data) {
	 	                      case 1: return 'Nam';
	 	                      case 0: return 'Nữ';
	 	                      default: return 'Unknown';
	 	                    }
	 	             }
	 	            },
	 	            { "mData": "id", render: function(data, type){
	 	            		//console.log(data);
	 	            		return '<button idedit="'+data+'" class="btn btn-primary btn-sm btnEdit" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="fa fa-pencil"></span></button>';
	 	                    
	 	            } },
	 	            { "mData": "id", render: function(data, type){
	 	            		//console.log(data);
	 	            		return '<button iduser="'+data+'" data-title="Delete" data-toggle="modal" data-target="#delete" class="btn btn-danger btn-sm dete"><span class="fa fa-trash"></span></button>';
	 	                    
	 	            } }
	 	            
	 	        ]
	 	    });
	 	
	    
	    
	    var date = new Date();
	    date.setDate(date.getDate());
	    $("#datepicker").datepicker({
	    	 dateFormat: 'dd/mm/yy' ,
	    	 maxDate : date
	    });
	    for(var i=0; i<$('.datepicker').length; i++){
	    	var id = $('.datepicker').eq(i).attr('id');
	    	$("#"+id).datepicker({
	    		dateFormat: 'dd/mm/yy' ,
	    		maxDate : date
		    });
	    }
	    	
 		
	    
	} );
      
   </script>
</html>