<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.EmployeeDao,pojo.Employee,java.util.*" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>View Employee</title>
	
	
								<!-- stylsheet -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">



								<!-- script -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
  	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		    $('#show').DataTable({
		    	responsive: true
		    });
	 		$("li").removeClass( "active" )
	 		$('#view').addClass('active');
		} );
	</script>  
</head>
<body>
	<%@ include file="Header.jsp" %>
	<%-- <%@ include file="sessionmanage.jsp" %> --%>
  								

	<h2 align="center">Employee List</h2>


 	<div class="container-fluid">
		<table id="show" class="stripe" style="width:100%">
		<thead>
			<tr>
				<th>Emp_code</th>
				<th>Full Name</th>
				<th>Job Title</th>
				<th>Department</th>
				<th>Salary</th>
				<th>Email</th>
				<th>Mobile No</th>
				<th>Join Date</th>
				<!-- <th>Create Date</th>
				<th>Modification Date</th> -->
				<th>Time Period</th>
				<th>Role</th>
				<th>Office</th>
				<th>Status</th>
				<th>Edit</th>
				<th>Delete</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="emp">
				<tr>
					<td><c:out value="${emp.emp_code}"></c:out></td>
					<td><c:out value="${emp.full_name}"></c:out></td>
					<td><c:out value="${emp.job_title}"></c:out></td>
					<td><c:out value="${emp.department}"></c:out></td>
					<td><c:out value="${emp.salary}"></c:out></td>
					<td><c:out value="${emp.email}"></c:out></td>
					<td><c:out value="${emp.mobile_no}"></c:out></td>
					<td><c:out value="${emp.join_date}"></c:out></td>
					<%-- <td><c:out value="${emp.create_date}"></c:out></td>
					<td><c:out value="${emp.modification_date}"></c:out></td> --%>
					<td><c:out value="${emp.dates}"></c:out></td>
					<td><c:out value="${emp.role_name}"></c:out></td>
					 <td><c:out value="${emp.status}"></c:out></td>
					 <c:choose>
					 	<c:when test="${emp.check == true}">
					 		<td style="color: green;"><c:out value="Active"></c:out></td>
					 	</c:when>
					 	<c:otherwise>
					 		<td style="color: red;"><c:out value="Inactive"></c:out></td>
					 	</c:otherwise>
					 </c:choose>
					<td><a href="AddServlet?action=edit&&id=<c:out value="${emp.emp_id}"/>"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
					<%-- <td onclick="return confirm('Are you sure you want to delete?');" class="delete"><a href="ViewServlet?action=delete&&id=<c:out value="${emp.emp_id}" /> "><i class="fa fa-trash-o" aria-hidden="true"></i></a></td> --%>
				
				
					<td ><a class="delete" href="#" id=<c:out value="${emp.emp_id}" />><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
					<%-- <td><button type="button" class="delete" id=<c:out value="${emp.emp_id}"/> ><i class="fa fa-trash-o" aria-hidden="true"></i></button> --%>
				</tr>	
			</c:forEach>
		</tbody>
	</table>
</div> 	
<script type="text/javascript">
	$(document).ready(function() {
		$(".delete").click(function() {
		
		var msg=confirm('Are you sure you want to delete?');
		var id = +this.id; 
		if(msg){
			$.ajax({
				url: "ViewServlet?action=delete",
				type: "Get",
				data: {
				id : id,
				},
				success : function(){
				//alert(data); 
				location.reload(); 
				}
			});
		}
			else{
				
			}
	});
	});
	
</script>
</body>
</html>
