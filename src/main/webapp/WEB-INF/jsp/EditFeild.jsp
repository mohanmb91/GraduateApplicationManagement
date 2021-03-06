<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Applications</title>
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
  <div class="panel-heading">Edit the requirements</div>
  <div class="panel-body">
  <input type="hidden" name="deptId" value="${department.id}"/>
  <input type="hidden" name="requirementId" value="${additionalfeilds.id}"/>
  
  	<form class="form" method="post">
					<div class="form-group">
						<label for="requirementName">Requirement Name</label> <input type="text"
							class="form-control" name="requirementName"
							placeholder="requirement Name" value="${ additionalfeilds.requiredFeild}" required>
					</div>
					<div class="form-group">
					<label for="requirementType">Requirement Type</label>
					<select name="requirementType" class="form-control" >
					<c:choose>
					<c:when test="${additionalfeilds.feildType == 'Text' }">
					<option value="Number">Number</option>
			        <option value="Text" selected="selected">Text</option>
			        <option value="File">File</option>
					</c:when>
					<c:when test="${additionalfeilds.feildType == 'File' }">
					<option value="Number">Number</option>
			        <option value="Text">Text</option>
			        <option value="File" selected="selected">File</option>
					</c:when>
					<c:otherwise>
					<option value="Number" selected="selected">Number</option>
			        <option value="Text">Text</option>
			        <option value="File">File</option>
					</c:otherwise>
					</c:choose>
					
			        </select>
					</div>
					<div class="form-group">
					
					<label for="isRequirement">Required</label>
					<input name = "isRequirement" type="radio" <c:if test="${additionalfeilds.required }"><c:out value= "checked"></c:out></c:if> value="required">
					<label for="isRequirement"> --- Optional</label>
					<input name = "isRequirement" type="radio" value="optional"  <c:if test="${!additionalfeilds.required }"><c:out value= "checked"></c:out></c:if>>
					
					
					
					</div>
					<button class="btn-primary btn-block" type="submit">Update Requirement</button>
				</form>
  </div>
  </div>
  </div>

</body>
</html>