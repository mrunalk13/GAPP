<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page
	import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
 .table {
    border-collapse: collapse;
  }
  
  .table, .th, .td{
       text-align: center;
  }
  
  .table th{
    text-align: center;
    margin: 5px;
  }
  
  .Caption {
    padding-left:20px;
    font-family: "DINWeb",Arial,Helvetica,sans-serif;
    font-size: 18px;
    line-height: 20px;
    font-weight: bold;
    color: blue;
    text-align: center;
}
	</style>
</head>
<body class="container" style="margin-bottom: 30px;">
<form:form modelAttribute="user">
	<fieldset>
		<legend style="font-size: x-large; font: bolder; color: blue">
			Graduate Program Applications </legend>
		<div>
		<a href="AddDepartment.html">Add Department &nbsp &nbsp</a>		
		<a href="AddProgram.html">&nbsp Add Program &nbsp &nbsp</a>
		<a href="AddAdditionalField.html">&nbsp Add Addtional Requirement</a>
		</div>
		<p>${message}</p>
		<div class="form-group"></div>		
		<table style="width: 90%; margin: auto; margin-bottom: 50px;"
        class="table-bordered table">
        <caption class="bg-success Caption">Departments</caption>
			<tr>
				<th>Name</th>
				<th>Number of Programs</th>
				<th>View</th>				
			</tr>			
<!--  		
    <c:forEach items="${department}" var="department">
			  <c:set var="count" value="0"></c:set>
				<c:if test="${!empty department}">
					<tr>						
						<td><c:out value="${department.name}"></c:out></td>	
					<td>
						<c:forEach items="${programs}" var="program">
						   <c:if test="${program.dept.dept_id == department.dept_id}">
						   <c:set var="count" value="${count+1}"></c:set>
						   </c:if>
						</c:forEach>
						<c:out value="${count}"></c:out>
						</td>	
						<td><a href="DepartmentDetail/${department.name}.html">View</a></td>								
					</tr>
				</c:if>
			</c:forEach>
   
-->

   <c:forEach items="${department}" var="department">
   <c:if test="${!empty department}">
			<tr>						
					<td><c:out value="${department.name}"></c:out></td>	
					<td><c:out value="${department.programs.size()}"></c:out></td>
					<td><a href="DepartmentDetail.html?name=${department.name}">View</a>	
					</td>
            </tr>
     </c:if>
     </c:forEach>
     
		</table>
	</fieldset>
</form:form>
</body>
</html>