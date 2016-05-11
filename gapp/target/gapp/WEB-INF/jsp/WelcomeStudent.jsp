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
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="header">
		<h2>Graduate Program Applications</h2>
	</div>

	<div class="nav">
		<font color=#00b33c>
			<h4>Welcome ${sessionScope.Name} </h4>
			<h5><br><a href="NewApplication.html?id=${sessionScope.userId}">New Application</a></h5>
			<small><a href="Logout.html">Logout</a></small>
		</font>
	</div>

	<div class="section">
		<table style="margin: auto; margin-bottom: 50px; width: 100%;"
			class="table-bordered table">

			<caption class="bg-success Caption">Applications</caption>
			<tr>
				<th>Application No.</th>
				<th>Department</th>
				<th>Program</th>
				<th>Term</th>
				<th>Submitted On</th>
				<th>Status</th>
				<th></th>
			</tr>

			<c:forEach items="${applications}" var="application">
				<c:if test="${!empty application}">
					<tr>
						<td><c:out value="${application.application_id}"></c:out></td>
						<td><c:out value="${application.dept.name}"></c:out></td>
						<td><c:out value="${application.program.name}"></c:out></td>
						<td><c:out value="${application.term.term}"></c:out></td>
						
						<fmt:formatDate value="${application.submitted_date}" var="dateString" pattern="MM/dd/yyyy" />
						<td><c:out value="${dateString}"></c:out></td>
						
						<td><c:out value="${application.status.status}"></c:out></td>
						<td><c:choose>
								<c:when test="${application.status.status eq 'Not Submitted'}">
									<a href="EditApplication.html?id=${application.application_id}&userId=${user.user_id}">Edit</a>
								</c:when>
								<c:otherwise>
									<a href="ViewApplication.html?id=${application.application_id}">View</a>
								</c:otherwise>

							</c:choose></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>



</body>
</html>