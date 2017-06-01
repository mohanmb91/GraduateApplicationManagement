   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage Users</title>
<link rel="stylesheet" href="https://bootswatch.com/darkly/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body class="container-fluid">

<div class="container">
	<div class="jumbotron">
	<h1>GRADUATE ADMISSION</h1>      
	</div>
	<div class="panel panel-default">
	<!-- Default panel contents -->
		<div class="panel-heading">Manage users<span style = "float:right;	"><a href = "/springmvc/logout.html"> Log Out</a>
		</span></div>
		
		<div class="panel-body">
		<table class = "table">
			<tr>     
				<th>First Name</th>     
				<th>Last Name</th>
				<th>Email Id</th>
				<th>Department belong to</th>
			</tr>
			<c:forEach items="${staffs}" var="eachStaff">
			<tr>
			<td>${eachStaff.firstName }</td>
			<td>${eachStaff.last_name }</td>
			<td>${eachStaff.emailId }</td>
			<td>${eachStaff.department.name }</td>
			</tr>
			</c:forEach>
		</table>
		<a href = "/springmvc/admin/addstaff.html">
		<span class = "glyphicon glyphicon-plus-sign">
		</span>Add New Staff
		</a>
		</div>
	</div>
</div>
</body>
</html>