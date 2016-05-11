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
			<c:if test="${!empty degreesList}">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse1">Academic Details </a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse in">
						<div class="panel-body">
							<table style="margin: auto; margin-bottom: 50px; width: 90%;"
								class="table">


								<tr>
									<th>Degree</th>
									<th>Major</th>
									<th>GPA</th>
									<th>College</th>
									<th>Duration</th>
									<th>Transcript</th>
									<th></th>
									<th></th>
								</tr>

								<c:forEach items="${degreesList}" var="dg">

									<tr>
										<td><c:out value="${dg.degree}"></c:out></td>
										<td><c:out value="${dg.major}"></c:out></td>
										<td><c:out value="${dg.GPA}"></c:out></td>
										<td><c:out value="${dg.college}"></c:out></td>
										<td><c:out value="${dg.time_period}"></c:out></td>
										<td><c:out value="${dg.transcript_name}"></c:out></td>
										<td><small><a
											href="NewTranscript.html?id=${dg.degree_id}&app_Id=${application.application_id}">Update Transcript</a><small></td>
										
										<td><a
											href="DeleteDegree.html?degree_id=${dg.degree_id}&app_Id=${application.application_id}">Delete</a></td>
										
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</c:if>

			<form:form modelAttribute="degree" class="form-horizontal"
				enctype="multipart/form-data">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">Add Academic Details</h4>
					</div>
					<div class="panel-body">

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="degree">Degree:</form:label>
							<div class="col-sm-10">
								<form:input type="text" class="form-control" path="degree" />
							</div>
						</div>

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="major">Major:</form:label>
							<div class="col-sm-10">
								<form:input type="text" class="form-control" path="major"
									required="true" />
							</div>
						</div>

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="GPA">GPA:</form:label>
							<div class="col-sm-10">
								<form:input type="number" step="0.1" class="form-control" path="GPA"
									required="true" />
							</div>
						</div>

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="college">University:</form:label>
							<div class="col-sm-10">
								<form:input type="text" class="form-control" path="college"
									required="true" />
							</div>
						</div>

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="time_period">Duration:</form:label>
							<div class="col-sm-10">
								<form:input type="text" class="form-control" path="time_period"
									required="true" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2" for="transcript">Transcripts:</label>
							<div class="col-sm-10">
								<input type="file" class="form-control" name="file" />
							</div>
						</div>

						<form:input type="hidden" path="application.application_id"
							value="${application.application_id}"></form:input>
						<button type="submit" id="upload" class="btn btn-primary">Upload</button>
						<a href="AddAdditionalReq.html?appId=${application.application_id}"
						 class="btn btn-primary" role="button">Continue</a>

					</div>
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>