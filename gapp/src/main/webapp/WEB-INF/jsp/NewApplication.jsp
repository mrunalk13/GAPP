<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<script>
	$(document).ready(function() {

		$('#department').change(function(event) {
			var department = $("select#department").val();
			$.get('/gapp/selectProgram.html', {
				deptname : department
			}, function(jsonResponse) {

				var select = $('#program');
				select.find('option').remove();
				$.each(jsonResponse, function(index, value) {
					$('<option>').val(value).text(value).appendTo(select);
				});
			});
		});
	});
</script>

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
		<form:form modelAttribute="application" class="form-horizontal">


			<div class="panel-group" id="accordion" style="width: 80%">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">Personal Details</h4>
					</div>
					<!--  <div id="collapse1" class="panel-collapse collapse in"> -->
					<div class="panel-body">

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="first_name">First
									Name:</form:label>
							<div class="col-sm-10">
								<form:input type="text" class="form-control" path="first_name"
									required="true" />
							</div>
						</div>

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="last_name">Last
									Name:</form:label>
							<div class="col-sm-10">
								<form:input type="text" class="form-control" path="last_name"
									required="true" />
							</div>
						</div>

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="email">Email:</form:label>
							<div class="col-sm-10">
								<form:input type="text" class="form-control" path="email"
									required="true" />
							</div>
						</div>

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="citizenship">Citizenship:</form:label>
							<div class="col-sm-10">
								<form:input type="text" class="form-control" path="citizenship"
									required="true" />
							</div>
						</div>

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="dob">Date of Birth:    (mm/dd/yyyy)</form:label>
							<div class="col-sm-10">
								<form:input type="text" class="form-control" path="dob"
									required="true" />
							</div>
						</div>

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="cin">CIN:</form:label>
							<div class="col-sm-10">
								<form:input type="number" class="form-control" path="cin"
									 />
							</div>
						</div>

						<div class="form-group">
						<form:label class="control-label col-sm-2" path="gender">Gender:</form:label>
							<div class="col-sm-offset-2 col-sm-10">
								<div class="radiobutton">
									<form:radiobutton path="gender" value="Male" label="Male" />
									<form:radiobutton path="gender" value="Female" label="Female" />
								</div>
							</div>
						</div>

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="toefl">Toefl:</form:label>
							<div class="col-sm-10">
								<form:input type="number" class="form-control" path="toefl" />
							</div>
						</div>

					</div>

				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">Application Details</h4>
					</div>
					<!--  <div id="collapse2" class="panel-collapse collapse">-->
					<div class="panel-body">


						<div class="form-group">
							<form:label class="control-label col-sm-2" path="dept">Department:</form:label>
							<div class="col-sm-10">
								<form:select path="dept.dept_id" id="department"
									class="form-control" required="true">
									<form:option value="" label="Select Department"></form:option>
									<form:options items="${departments}" itemValue="dept_id"
										itemLabel="name"></form:options>
								</form:select>
							</div>
						</div>

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="program.name">Program:</form:label>
							<div class="col-sm-10">
								<form:select path="program.name" id="program"
									class="form-control" required="true">
									<form:option value="" label="Select Program"></form:option>
								</form:select>
							</div>
						</div>

						<div class="form-group">
							<form:label class="control-label col-sm-2" path="term">Term:</form:label>
							<div class="col-sm-10">
								<form:select path="term.term_id" id="term" class="form-control"
									required="true">
									<form:option value="" label="Select Term"></form:option>
									<form:options items="${terms}" itemValue="term_id"
										itemLabel="term"></form:options>
								</form:select>
							</div>
						</div>
					</div>

				</div>


			</div>
			<br>
			<form:input type="hidden" path="user.user_id" value="${user.user_id}"></form:input>
			<button type="submit" id="save" class="btn btn-primary">Save
				and Continue</button>
			

		</form:form>


	</div>

</body>
</html>