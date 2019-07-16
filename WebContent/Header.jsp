<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- <script type="text/javascript">
$(document).ready(function() {
	  $('li.active').removeClass('active');
	  $('a[href$="' + location.pathname.match(/[^\\/]+$/)[0] + '"]').closest('li').addClass('active'); 
	});
</script>
 -->
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="navbar-header">  
	         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myidname">  
	                 <span class="icon-bar"></span>  
	                 <span class="icon-bar"></span>  
	                 <span class="icon-bar"></span> 
	                 <span class="icon-bar"></span> 
	         </button>  
	       </div>
	     
	    <%
                String username= (String) session.getAttribute("name");                     
                if (username == null) {
            %>
           		<div class="navbar-header"> 
           			<a href="#"> <span class="navbar-brand" >Employee Management</span>  </a>
	    		</div>  
	    		<div class="navbar-collapse collapse" id="myidname"> 
            	<ul class="nav navbar-nav navbar-right">
            		<li><a href="Login.jsp">Login</a></li>
            	</ul>
             </div>

        <% } else {
         %>
         <div class="navbar-header"> 
           	<a href="AddServlet?action=insert"> <span class="navbar-brand" >Employee Management</span>  </a>
	    </div> 
         <div class="navbar-collapse collapse" id="myidname">  
		    <ul class="nav navbar-nav">
		    	<!-- <li id="home" class="abc"><a  href="HomePage.jsp">Home Page</a></li> -->
		    	<li id="view" class="abc active"><a  href="ViewServlet?action=view">View Employee</a></li>
		      	<li id="add" class="abc"><a  href="AddServlet?action=insert">Add New Employee</a></li>
		       	<li id="addRole" class="abc"><a  href="EmpRole.jsp">Add Employee Role</a></li>
		    </ul>
		    <ul class="nav navbar-nav navbar-right">
            	<li><a href="LogoutServlet">Logout</a></li>
            </ul>
         </div>
        <% }%>
	</nav>
	
	
  
</body>
</html>