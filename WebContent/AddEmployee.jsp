<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>
								
								
								<!-- stylsheet -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
	<style type="text/css">
		.placeholder{color: grey;}
			select option:first-child{color: grey; display: none;}
			select option{color: #555;}
			
			<%@include file="css/header.css" %>
	</style>
	
    								<!-- script -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
   <script src="https://code.jquery.com/jquery-3.3.1.js"></script> 
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
  	<script>
  	$( function() {
		$( "#dp" ).datepicker({dateFormat : 'yy-mm-dd'});
	} )
	 	
  	$(document).ready(function() {
  			$("li").removeClass( "active" )
  		  $('#add').addClass('active');
  	});
  	
  	$('select').change(function() {
  	     if ($(this).children('option:first-child').is(':selected')) {
  	       $(this).addClass('placeholder');
  	     } else {
  	      $(this).removeClass('placeholder');
  	     }
  	    });
  	</script>
	
	<script type="text/javascript">
		function validate()
		{
			var reg=/^[A-Za-z _]+$/;
			var name=document.myform.name.value;
			if(name == "")
			{
				$("#name_error").html("Please Enter your name...  !");
				return false;
			}
			else if(reg.test(name) == false)
			{
				$("#name_error").html("Please Enter name in alphabatics... !");
				return false;
			}
			 else
			{
				$("#name_error").html("");
			}
	
			
			var jobtitle=document.myform.jobtitle.value;
			if(jobtitle == "")
			{
				$('#title_error').html("Please Enter your Jobtitle...  !");
				return false;
			}
			else if(reg.test(jobtitle) == false )
			{
				$("#title_error").html("Please Enter jobtitle in alphabatics... !");
				return false;
			}
			 else
			{
				$("#title_error").html("");
			} 
			
			var departreg=/^[A-Za-z /_-]+$/;
			var Department=document.myform.Department.value;
			if(Department == "")
			{
				$("#dept_error").html("Please Enter your Department...  !");
				return false;
			}
			else if(departreg.test(Department) == false )
			{
				$("#dept_error").html("Please Enter department in alphabatics... !");
				return false;
			}
			 else
			{
				$("#dept_error").html("");
			} 
			
			var salaryreg=/^[0-9]+(\.\d{1,2})?$/;
			var salary=document.myform.salary.value;
			if(salary == "")
			{
				$("#salary_error").html("Please Enter your salary...  !");
				return false;
			}
			else if(salaryreg.test(salary) == false)
			{
				$("#salary_error").html("Please,Enter correct salary..");
				return false;
			}
			 else
			{
				$("#salary_error").html("");
			} 
			
			
			var emailreg=/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
			var Email=document.myform.Email.value;
			if(Email == "")
			{
				$("#email_error").html("Please Enter your Email...  !");
				return false;
			}
			else if(emailreg.test(Email) == false)
			{
				$("#email_error").html("Incorrect Email Address !");
				return false;
			}
			else
			{
				$("#email_error").html("");
			} 
			
			
			var monoreg=/^[0]?[0-9]\d{9}$/;
			var mobileno=document.myform.mobileno.value;
			if(mobileno == "")
			{
				$("#mono_error").html("Please Enter your mobileno...  !");
				return false;
			}
			else if(monoreg.test(mobileno) == false)
			{
				$("#mono_error").html("Please, Enter mobile number in degits!");
				return false;
			}
			else
			{
				$("#mono_error").html("");
			} 
			
			var role=document.myform.role_id.value;
			if(role == "")
			{
				$("#role_error").html("Please Enter any one...  !");
				return false;
			}
			else
			{
				$("#role_error").html("");
			} 
			
			var joindate=document.myform.joindate.value;
			if(joindate == "")
			{
				$("#join_error").html("Please Enter your joindate...  !");
				return false;
			}
			else
			{
				$("#join_error").html("");
			} 
			
			var check=document.myform.check.value;
			if(check == "")
			{
				$("#office_error").html("Please choose any one office...  !");
				return false;
			}
			else
			{
				$("#office_error").html("");
			} 
			return true;
		}
	</script>
</head>



<body>
	<%@ include file="Header.jsp" %>
	<div class="container jumbotron">
		<form autocomplete="off" action="AddServlet" method="post" name="myform" class="form-horizontal" onsubmit="return validate();">
			<input type="button" value="back" class="btn btn-primary" onclick="history.back()">
			<c:choose>
				<c:when test="${employee.emp_id>0}">
					<h4>Edit Employee Detail</h4>
						<input type="hidden" name="id" value="<c:out value="${employee.emp_id}"></c:out>"/>
				</c:when>
				<c:otherwise>
					<h4>Add Employee Detail</h4>
						<input type="hidden" name="id" value=0>
				</c:otherwise>
			</c:choose><br>
			
			<div class="form-group" >
      			<label class="control-label col-sm-4" for="name">Name :</label>
	      		<div class="col-sm-4">
	      			<input type="text" name="name" class="form-control" placeholder="Enter Your Name.." value="<c:out value="${employee.full_name }"></c:out>">
	      		</div>
	      		<div style="color: Red" id="name_error"></div>
      		</div>
			
			<div class="form-group">
      			<label class="control-label col-sm-4" for="jobtitle">Jobtitle :</label>
	      		<div class="col-sm-4">
	      			<input type="text" name="jobtitle" class="form-control" placeholder="Enter Your Jobtitle.." value="<c:out value="${employee.job_title}"></c:out>">
	      		</div>
	      		<div style="color: Red" id="title_error"></div>
      		</div>
			
			<div class="form-group">
      			<label class="control-label col-sm-4" for="Department">Department :</label>
	      		<div class="col-sm-4">
	      			<input type="text" name="Department" class="form-control" placeholder="Enter Your Department.." value="<c:out value="${employee.department}"></c:out>">
	      		</div>
	      		<div style="color: Red" id="dept_error"></div>
      		</div>
      		
      		<c:choose>
      		<c:when test="${employee.emp_id>0}">
      		<div class="form-group">
      			<label class="control-label col-sm-4" for="role">Role :</label>
	      		<div class="dropdown col-sm-4">
    				<select class="form-control" name="role_id">
    				<option value="${employee.role_name}" >${employee.role_name}</option>
				    	<c:forEach var="role" items="${role}">  
      						<option value="${role.role_id}" >${role.role_name}</option>
						</c:forEach>
       				 </select> 
				  </div>
				  <div style="color: Red" id="role_error"></div>
      			</div>
      		</c:when>
      		<c:otherwise>
      			<div class="form-group">
      			<label class="control-label col-sm-4" for="role">Role :</label>
	      		<div class="dropdown col-sm-4">
    				<select class="form-control placeholder" name="role_id">
    				<option value="">Select Any One</option>
				    	<c:forEach var="role" items="${role}">  
      						<option value="${role.role_id}" >${role.role_name}</option>
						</c:forEach>
       				 </select> 
				  </div>
				  <div style="color: Red" id="role_error"></div>
      			</div>
      		</c:otherwise>
      		</c:choose>
      		
      		<div class="form-group">
      			<label class="control-label col-sm-4" for="Salary">Salary :</label>
	      		<div class="col-sm-4">
	      			<input type="text" name="Salary" class="form-control" id="salary" placeholder="Enter Your Salary.." value="<c:out value="${employee.salary}"></c:out>">
	      		</div>
	      		<div style="color: Red" id="salary_error"></div>
      		</div>
      		
      		<div class="form-group">
      			<label class="control-label col-sm-4" for="Email">Email :</label>
	      		<div class="col-sm-4">
	      			<input type="text" name="Email" id="email" class="form-control" placeholder="Enter Your Email.." value="<c:out value="${employee.email}"></c:out>">
	      		</div>
	      		<div style="color: Red" id="email_error"></div>
      		</div>
      		
      		<div class="form-group">
      			<label class="control-label col-sm-4" for="mobileno">Mobile number :</label>
	      		<div class="col-sm-4">
	      			<input type="text" maxlength="10" name="mobileno" id="mono" class="form-control" placeholder="Enter Your Mobileno.." value="<c:out value="${employee.mobile_no}"></c:out>">
	      		</div>
	      		<div style="color: Red" id="mono_error"></div>
      		</div>
			
			<div class="form-group">
      			<label class="control-label col-sm-4" for="joindate">Join Date :</label>
	      		<div class="col-sm-4">
	      			<input type="text" name="joindate" id="dp" class="form-control" placeholder="yyyyy-mm-dd" value="<c:out value="${employee.join_date}"></c:out>">
	      		</div>
	      		<div style="color: Red" id="join_error"></div>
      		</div>
						
			<c:choose>
				<c:when test="${employee.emp_id>0}">
					<div class="form-group">
		      			<label class="control-label col-sm-4" style="margin-top: 6px;" for="office">Office :</label>
			      		<div class="radio col-sm-4">
			      			<c:choose>
			      			<c:when test="${employee.check == 'OfficeA' }">
				      			<label class="radio-inline"><input type="radio" value="OfficeA"  name="check" checked>Office A</label>
				      			<label class="radio-inline"><input type="radio" value="OfficeB" name="check">Office B</label>
				      		</c:when>
				      		<c:otherwise>
				      			<label class="radio-inline"><input type="radio" value="OfficeA"  name="check" >Office A</label>
				      			<label class="radio-inline"><input type="radio" value="OfficeB" name="check" checked>Office B</label>
			      			</c:otherwise>
			      			</c:choose>
			      		</div>
		      		</div>
				
			 		<c:choose>
				 		<c:when test="${employee.check == true}">
				 			<div class="form-group">
				      			<label class="control-label col-sm-4" style="margin-top: 6px;" for="checkbox" >Status :</label>
					      		<div class="checkbox col-sm-4">
					      			<label class="checkbox-inline"><input type="checkbox" name="checkbox" checked/>check</label>
					      		</div>
				      		</div>
						</c:when>
						<c:otherwise>
							<div class="form-group">
				      			<label class="control-label col-sm-4" style="margin-top: 6px;" for="checkbox">Status :</label>
				      			<div class="checkbox col-sm-4">
					   				<label class="checkbox-inline"><input type="checkbox" name="checkbox" />check</label>
					     		</div>
				      		</div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<div class="form-group">
		      			<label class="control-label col-sm-4" style="margin-top: 6px;" for="office">Office :</label>
			      		<div class="radio col-sm-4">
			      			<label class="radio-inline"><input type="radio" value="OfficeA"  name="check">Office A</label>
			      			<label class="radio-inline"><input type="radio" value="OfficeB" name="check">Office B</label>
			      		</div>
			      		<div style="color: Red" id="office_error"></div>
		      		</div>
		      		<input type="hidden" name="checkbox" checked />
				</c:otherwise>
			</c:choose>
			
			<div class="form-group">        
		      	<div class="col-sm-offset-4 col-sm-4">
		        <button type="submit" class="btn btn-primary btn-block">Submit</button>
		      	</div>
		    </div>
		</div>
	</form>
</body>
</html>