<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<style>
	.form-horizontal .control-label{text-align : left !important;}
	</style>
</head>
<body class="container" style="margin-bottom: 30px;">
	<form:form modelAttribute="user" class="form-horizontal">

		<fieldset>
			<legend style="font-size: x-large; color: Blue; font: bolder;">Graduate Program Applications</legend>
			 <div class="col-sm-offset-2 col-sm-10">
			<h3> Register </h3>
			<p color = "red"> ${message}</p>
			 </div>
			
			<div class="form-group">
				<form:label path="first_name" class="control-label col-md-2">First Name:</form:label>
				<form:input class="control-label" path="first_name" required="required"/>
			</div>
			
			<div class="form-group">
				<form:label path="last_name" class="control-label col-md-2">Last Name:</form:label>
				<form:input class="control-label" path="last_name" required="required"/>
			</div>
			
			<div class="form-group">
				<form:label path="email" class="control-label col-md-2">Email:</form:label>
				<form:input class="control-label" path="email" required="required"/>
			</div>


			<div class="form-group">
				<form:label path="password" class="control-label col-md-2">Password:</form:label>
				<form:password class="control-label" path="password" required="required"/>
			</div>
			
			<div class="form-group">
				<label class="control-label col-md-2">Confirm Password:</label>
				<input type ="password" class="control-label" name="cpassword" required="required"/>
			</div>
		</fieldset>

		<div class="col-sm-offset-2 col-sm-10">
			<input type="submit" value="Register" name="register" class="btn btn-primary">
			 <input type="reset" value="Clear" name="clear" class="btn btn-primary"> <br>
			  
		</div>
	</form:form>
</body>
</html>