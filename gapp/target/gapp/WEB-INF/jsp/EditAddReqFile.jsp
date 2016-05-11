<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="layout.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<h2>Graduate Program Applications</h2>
	</div>

	<div class="nav">
		<font color=#00b33c>
			<h4>Welcome ${sessionScope.Name}</h4> 
			<a href="WelcomeStudent.html">Home</a>
			<br><small><a href="Logout.html">Logout</a></small>
		</font>
	</div>

	<div class="section">
		<div class="panel-group" id="accordion" style="width: 80%">

			<form action="EditAddReqFile.html" method="POST" class="form-horizontal"
				enctype="multipart/form-data">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">Upload New File</h4>
					</div>
					<div class="panel-body">
						
						
						<div class="form-group">
							<label class="control-label col-sm-2" for="transcript">${afv.field.name}:</label>
							<div class="col-sm-10">
								<input type="file" class="form-control" name="file" required />
							</div>
						</div>

						
						<input type="hidden" name="id" value="${afv.fieldValue_id}"></input>
						<button type="submit" id="upload" class="btn btn-primary">Upload</button>
						 <a href="AddAdditionalReq.html?appId=${afv.application.application_id}"
						 class="btn btn-primary" role="button">Cancel</a>

					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>