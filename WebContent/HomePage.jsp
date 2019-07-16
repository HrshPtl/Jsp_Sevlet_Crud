<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
								
								<!-- stylsheet -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<style type="text/css">
		.img-responsive{
			width: 100%;
			height: auto;
		}
	</style>
	
									<!-- script -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
			$("li").removeClass( "active" )
		  $('#home').addClass('active');
	});
	</script>
</head>
<body>
		<%@ include file="Header.jsp"%>
	
	 <img alt="img not found" src="image/emp.jpg" width="100%" height="100%" class="img-responsive"> 
</body>
</html>