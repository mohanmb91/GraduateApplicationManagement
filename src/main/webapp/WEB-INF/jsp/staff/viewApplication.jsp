<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Applications</title>
<link rel="stylesheet" href="https://bootswatch.com/darkly/bootstrap.min.css">

  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  
<script type="text/javascript" src="../javascript/jquery-2.1.1.min.js"></script>
</head>
<body class="container-fluid">

<div class="container">
<div class="jumbotron">
<h1>GRADUATE ADMISSION</h1>      
</div>
<div class="panel panel-default">
	<!-- application academics -->
<div class="panel-heading">Welcome ${staff.userName }!!<span style="float:right;"><a href = "/springmvc/logout.html"> Log Out</a>
</span></div>
<div class="panel-body">
<form class="form" action="viewApplication.html?applicationId=${application.id }" method="post">
	<div class="form-group">
		  <label for="department">Department Name: </label>${application.program.department.name }
	</div>
	<div class="form-group">
		  <label for="program">Program Name: </label>${application.program.name }
		  
	</div>
	<div class="form-group">
		  <label for="program">Term:</label>${application.term }
	</div>
	<div class="panel panel-default">

	<!-- Default panel contents -->
	<div class="panel-heading">Additional Requirements</div>
	<div class="panel-body" id="additionalRequirements">
							<div class="form-group">
							<table class = "table">
							<tr><th>Required Feild Name</th><th>Required Feild Value</th><th>Links</th></tr>
							<c:forEach items="${ application.additionalDepartmentFeildValues}" var="eachFeildValue">
						
							<tr>
							<td><label>${eachFeildValue.feildDetails.requiredFeild }:</label></td>
							<td>${eachFeildValue.feildValues}</td>
							<td>
							<c:if test="${eachFeildValue.feildDetails.feildType eq 'File'}">
							<c:if test="${ eachFeildValue.feildValues ne null and eachFeildValue.feildValues != ''}"><a href="downloadFile.html?fileName=${application.id }_${eachFeildValue.feildValues}">View File</a></c:if>
							</c:if>
							</td>
							<tr>
							</c:forEach>
							</table>
							</div>
						</div>	
	
	</div>
	

<!-- application basic info -->
<div class="panel panel-default">
	<div class="panel panel-default">
			<div class = "panel-heading">Student Basic Info</div>
			<div class = "panel-body">
				<table class="table">
				<tr>
				<th>User Name</th>
				<th>Last Name</th>
				<th>Email Id</th>
				<th>Cin</th>
				<th>Phone Number</th>
				<th>Gender</th>
				<th>DOB</th>
				<th>Citizenship</th>
				</tr>
				<tr>
				<td><c:choose><c:when test="${not empty application.userName}">${application.userName}</c:when><c:otherwise>N/A</c:otherwise></c:choose> </td>
				<td><c:choose><c:when test="${not empty application.last_name}">${application.last_name}</c:when><c:otherwise>N/A</c:otherwise></c:choose> </td>
				<td><c:choose><c:when test="${not empty application.emailId}">${application.emailId}</c:when><c:otherwise>N/A</c:otherwise></c:choose> </td>
				<td><c:choose><c:when test="${not empty application.cin}">${application.cin}</c:when><c:otherwise>N/A</c:otherwise></c:choose> </td>
				<td><c:choose><c:when test="${not empty application.phoneNumber}">${application.phoneNumber}</c:when><c:otherwise>N/A</c:otherwise></c:choose> </td>
				<td><c:choose><c:when test="${not empty application.gender}">${application.gender}</c:when><c:otherwise>N/A</c:otherwise></c:choose> </td>
				<td><c:choose><c:when test="${not empty application.dateOfBirth}">${application.dateOfBirth}</c:when><c:otherwise>N/A</c:otherwise></c:choose> </td>
				<td><c:choose><c:when test="${not empty application.citizenship}">${application.citizenship}</c:when><c:otherwise>N/A</c:otherwise></c:choose> </td>
				</tr>
				</table>
			</div>
		</div>		
</div>
<!-- Educational background -->
<div class="panel panel-default">
<div class = "panel-heading">Student Educational Background</div>
			<div class = "panel-body">
			<table class = "table">
			<tr>     
				<th>Degree</th>     
				<th>College</th>
				<th>FromDate</th>
				<th>ToDate</th>
				<th>DegreeEarned</th>
				<th>Major</th>
			</tr>
			<c:choose>
			<c:when test="${ empty application.educationBackgrounds }">
			<tr>
			<td colspan="6">educational background not found. kindly add</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach items="${application.educationBackgrounds }" var="eachEducationalBackground">
			<tr>
			<td>${eachEducationalBackground.degree }</td>
			<td>${eachEducationalBackground.college }</td>
			<td>${eachEducationalBackground.fromDate }</td>
			<td>${eachEducationalBackground.toDate }</td>
			<td>${eachEducationalBackground.degreeEarned }</td>
			<td>${eachEducationalBackground.major }</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</table>
</div>
</div>
<!-- application academics -->
<div class="panel panel-default">
		<div class = "panel-heading">Student Academics</div>
			<div class = "panel-body">
			<table class = "table">
			<tr>     
				<th>GRE</th>     
				<th>GPA</th>
				<th>TOFEL</th>
				<th>Download Uploaded File</th>
				<th>Operation</th>
			</tr>
			<c:choose>
			<c:when test="${ empty application.academics }">
			<tr>
			<td colspan="5">Student has not yet filled Academics details. kindly update</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:set scope="session" var="applicationId" value="${application.id }"></c:set>
			<tr>
			<td>${application.academics.greScore }</td>
			<td>${application.academics.gpa }</td>
			<td>${application.academics.tofelScore }</td>
			<td>${application.academics.fileLocationTranscript }</td>
			<td><a href="downloadFile.html?fileName=${application.id }_${application.academics.fileLocationTranscript}">View File</a></td>
			</tr>
			</c:otherwise>
			</c:choose>
			</table>
			</div>
		</div>
</form>
<center>
<a href="staffhome.html?staffId=${staff.id}" class="btn-primary btn-block">Home Page</a>
</center>
</div>
</div>
</div>
</body>
</html>