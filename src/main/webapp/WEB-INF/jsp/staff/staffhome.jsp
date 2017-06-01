<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Staff Home</title>
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
	<div class="panel-heading">Welcome ${staff.userName} !! 
		<span style="float:right;">
			<a href = "/springmvc/logout.html"> Log Out
			</a>
		</span>
	</div>
	<div class = "panel-body">
						<table class="table">
						<tr>
						<th>First Name of the applicant</th>
						<th>last Name of the applicant</th>
						<th>Department/program applied to</th>
						<th>Term</th>
						<th>Operations</th>
						<th>Accept/Reject</th>
						</tr>
						<c:forEach items="${applications}" var="eachApplication">
						<tr>
						<td>
						${eachApplication.firstName }
						</td>
						<td>
						${eachApplication.last_name }
						</td>
						<td>
						${eachApplication.program.department.name }/${eachApplication.program.name }
						</td>
						<td>
						${eachApplication.term }
						</td>
						<td>
						<a href="viewApplication.html?applicationId=${eachApplication.id}&staffId=${staff.id}">View</a>
						</td>
						<td>
						<c:if test="${eachApplication.status.id == 1}">
						<div>
						<a href="acceptApplication.html?applicationId=${eachApplication.id}&staffId=${staff.id}">Accept  </a>
						</div>
						<div>
						<a href="rejectApplication.html?applicationId=${eachApplication.id}&staffId=${staff.id}">Reject  </a>
						</div>
						</c:if>
						<c:if test="${eachApplication.status.id != 1}">
						${eachApplication.status.status}
						</c:if>
						</td>
						</tr>
						</c:forEach>
						</table>
						<c:if test="${empty applications }">
						<center>
						<h5>You don't have any applicants to review</h5>
						</center>
						</c:if>
			</div>
</div>
</div>
</body>
</html>