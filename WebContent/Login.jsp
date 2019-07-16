<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login Form</title>
	
						<!-- stylsheet -->
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 	<style type="text/css">	
 		<%@include file="css/header.css" %>
	</style>
 						<!-- script -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			
</head>

<body>
<%@ include file="Header.jsp" %>
	<div class="container">
		<div class="Absolute-Center is-Responsive">
			<h3 align="center">Login Form</h3>
			<form autocomplete="off" action="LoginServlet" method="post" name="myform1" class="form-horizontal"  onsubmit="return valid();">
				
					<div style="color: Red" id="error" align="center"></div>
					<div class="form-group">
		      			<label class="control-label col-sm-4" for="username">Username :</label>
			      		<div class="col-sm-4">
			      			<input type="text" name="username" class="form-control" placeholder="Enter name ...">
			      		</div>
		      		</div>
		      		
		      		<div class="form-group">
		      			<label class="control-label col-sm-4" for="password">Password :</label>
			      		<div class="col-sm-4">
			      			<input type="password" name="password" class="form-control" placeholder="Enter password..">
			      		</div>
		      		</div>
					
					<div class="form-group">        
				      	<div class="col-sm-offset-4 col-sm-4">
				        <button type="submit" class="btn btn-default">Login</button>
				      </div>
				    </div>
				</form>
			</div>
	</div>

	<script type="text/javascript">
		function valid()
		{
			var name=document.myform1.username.value;
			var password= document.myform1.password.value;
			if(name == "" || password == "")
			{
				$('#error').html("Please insert username and password...  !");
				return false;
			}
			else if(name != "Admin")
			{
				$('#error').html("Invalid Username...  !");
				return false;
			}
			 else if(password != "123")
			{
				$('#error').html("Invalid Password...  !");
				return false;
			} 
		}
	</script>
</body>
</html>