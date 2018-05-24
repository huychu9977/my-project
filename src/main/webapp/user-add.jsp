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
   <style>
.error{
	color: red;
}
</style>
   <body>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
      <div class="container">
         <div class="" >
	         <div class="modal-dialog">
	         	<form:form id="addFrm" action="add" method="post" modelAttribute="user">
	         	
		            <div class="modal-content">
		               <div class="modal-header">
		                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		                  <h4 class="modal-title custom_align" id="Heading"><spring:message code="title"></spring:message></h4>
		               </div>
		               <div class="modal-body">
		                  <div class="form-group">
		                  	<label for="sel1"><spring:message code="fullName"></spring:message></label>
		                     <form:input class="form-control " value="" required="" path="name" type="text" placeholder="Name..."/>
		                     <form:errors path="name" cssClass="error"></form:errors>
		                  </div>
		                  <div class="form-group">
		                  		<label for="sel1"><spring:message code="address"></spring:message></label>
		                     <form:input class="form-control " value="" required="" path="address" type="text" placeholder="Address..."/>
		                     <form:errors path="address" cssClass="error"></form:errors>
		                  </div>
		                  <div class="form-group">
		                   	 <label for="sel1"><spring:message code="birthday"></spring:message></label>
		                     <form:input class="form-control" value="" id="datepicker" required="" path="birthday" type="text" placeholder="Birthday..."/>
		                  	 <form:errors path="birthday" cssClass="error"></form:errors>
		                  </div>
		                  <div class="form-group">
							  <label for="sel1"><spring:message code="gender"></spring:message></label>
							  
								  <form:radiobutton required=""  path="gender" value="0"/>Nữ 
								  <form:radiobutton required=""  path="gender" value="1"/>Nam 
							  		<form:errors path="gender" cssClass="error"></form:errors>
							</div>
		               </div>
		               <div class="modal-footer ">
		                  <form:button type="submit" id="btnAdd" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Add</form:button>
		               </div>
		            </div>
	            </form:form>
	            <a href="?language=en">English</a>|
  				<a href="?language=vi">Việt Nam</a>|
	            <!-- /.modal-content --> 
	         </div>
	         <!-- /.modal-dialog --> 
	      </div>
      </div>
      <!-- Them moi -->
	      
	      
   </body>
   <script type="text/javascript">
  $(document).ready(function(){
	  var date = new Date();
	   date.setDate(date.getDate());
	   $("#datepicker").datepicker({
	   	 dateFormat: 'dd/mm/yy' ,
	   	 maxDate : date
	   });
	  
	   
  })
  
   </script>
   </html>