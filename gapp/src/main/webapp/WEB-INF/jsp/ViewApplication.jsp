<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="layout.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title></title>
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

		<div class="panel-group" id="accordion" style="width:80%">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse1">Personal Details</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse in">
					<div class="panel-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label class="control-label col-sm-2" for="fs">First
									Name:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="fs"
										value="${application.first_name}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="ls">Last
									Name:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="ls"
										value="${application.last_name}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="email">Email:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="email"
										value="${application.email}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="ctnz">Citizenship:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="email"
										value="${application.citizenship}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="dob">Date of Birth:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="dob"
										value="<fmt:formatDate value="${application.dob}" pattern="MM-dd-yyyy"/>" readonly/> 
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="cin">CIN:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="cin"
										value="${application.cin}" readonly>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label><input type="checkbox" checked>
											${application.gender}</label>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse2"> Application Details</a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label class="control-label col-sm-2" for="appId">Application
									ID:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="appId"
										value="${application.application_id}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="dept">Department:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="dept"
										value="${application.dept.name}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="pgm">Program:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="pgm"
										value="${application.program.name}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="term">Term:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="term"
										value="${application.term.term}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="submitted_date">Submitted On:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="submitted_date"
										value="<fmt:formatDate value="${application.submitted_date}" pattern="MM-dd-yyyy"/>" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="status">Status:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="status"
										value="${application.status.status}" readonly>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse3"> Additional Requirements</a>
					</h4>
				</div>
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label class="control-label col-sm-2" for="toefl">Toefl:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="toefl"
										value="${application.toefl}" readonly>
								</div>
							</div>

							<c:forEach items="${afv}" var="afv">
								<c:if test="${!empty afv}">
									<div class="form-group">
										<label class="control-label col-sm-2" for="${afv.field.name}"> <c:out value="${afv.field.name}:" /> </label>
										<div class="col-sm-10">
											<input type="text" class="form-control"
												id="${afv.field.name}" value="${afv.value}" readonly>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</form>

					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse4"> Academic Details</a>
					</h4>
				</div>
				<div id="collapse4" class="panel-collapse collapse">
					<div class="panel-body">
						<table style="margin: auto; margin-bottom: 50px; width: 90%;"
			class="table">			
			<tr>
				<th>Degree</th>
				<th>College</th>
				<th>Duration</th>
				<th>Major</th>
				<th>GPA</th>
				<th>Transcript</th>				
			</tr>

			<c:forEach items="${degrees}" var="degree">
				
					<tr>
						<td><c:out value="${degree.degree}"></c:out></td>
						<td><c:out value="${degree.college}"></c:out></td>
						<td><c:out value="${degree.time_period}"></c:out></td>
						<td><c:out value="${degree.major}"></c:out></td>
						<td><c:out value="${degree.GPA}"></c:out></td>
						<td>
						<c:if test="${degree.transcript != null}">
						<a href="download/${degree.degree_id}.html">download</a>
						</c:if>
						</td>	
											
					</tr>
				
			</c:forEach>
		</table>
					</div>
				</div>
			</div>
		</div>


	</div>
</body>
</html>