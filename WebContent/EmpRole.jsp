<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

									<!-- stylsheet -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    
    
								<!-- script -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
  	
	
     <style type="text/css">
	     .control-label{
				text-align: right;
	    		margin-top: 6px;
			}
			.form-control{
	    		margin-bottom: 15px;
			}
		<%@include file="css/header.css" %>
	</style>
	
</head>
<body>
	<%-- <%@ include file="sessionmanage.jsp" %> --%>
	<%@ include file="Header.jsp" %>
	
	<div class="container jumbotron">
		<!-- <form autocomplete="off" name="myform" id="form" class="form-horizontal"> -->
		<div>
			<h4>Add Employee Role</h4>
		
			<div class="form-group">
      			<label class="control-label col-sm-4" for="name">Role :</label>
	      		<div class="col-sm-4">
	      			<input type="text" name="role_name" id="role_name" class="form-control"  placeholder="Enter Your Role..">
	      		</div>
	      		<div style="color: Red;display: none;" id="name_error">Please Enter Correct Role...  !</div>
      		</div>
      		<div class="form-group">        
		      	<div class="col-sm-offset-4 col-sm-4">
		        <button type="submit" class="btn btn-primary btn-block"  id="search">Submit</button>
		      	</div>
		    </div>
		</div>
		<!-- </form> -->
		</div>
		
		
		<%-- <div class="container-fluid">
		<table id="show" class="stripe" style="width:100%">
		<thead>
			<tr>
				<th>Emp_Role</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${role}" var="r">
				<tr>
					<td><c:out value="${r.role_name}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		</div> --%>
	
	<script type="text/javascript">
		
	/* function validate() {
			
			var reg=/^[A-Za-z _]+$/;
			var name=document.myform.role_name.value;
			if(name == ""){
				$("#name_error").html("Please Enter Role...  !");
				return false;
			}else if(reg.test(name) == false)
			{
				$("#name_error").html("Please Enter Role name in alphabatics... !");
				return false;
			}
	} */
	
	$(document).ready(function() {
		$("li").removeClass( "active" )
	 	$('#addRole').addClass('active');
					
	 		
	 				 		
	 					 
	
			    /* $('#show').DataTable({
			    	responsive: true
			    });
	 			 */
	 			
	 			  /*  $('#search').click(function() {  
	 				  var role_name=$('#role_name').val();
	 				        $.Post('EmployeeRole',{role_name:role_name},function(data) {
	 							alert(data);
	 							location.reload();
	 				        });
	 				   }); */
 				
	 						
	 				
		 });
	$(document).ready(function() {
	$("#search").click(function() {
				var role_name = $("#role_name").val();
				var reg=/^[A-Za-z _]+$/;
				if(role_name=="" || reg.test(role_name) == false){
			    	$("#name_error").show();
			   }else{
			    	$("#name_error").hide();
			$.ajax({
				url: "EmployeeRole",
			type: "Post",
			data: {
					role_name,
				},
			success : function(){
				alert("Role Added Sucessfully........");
				$("#role_name").val("");
				location.reload();
			},
			error : function(e){
				alert("Error");
			}
			});
			    }
	});
	});
	</script>
</body>
</html>