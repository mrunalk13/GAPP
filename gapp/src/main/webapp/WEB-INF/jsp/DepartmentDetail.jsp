<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page
	import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
  
  .MyCaption {
    padding-left:20px;
    font-family: "DINWeb",Arial,Helvetica,sans-serif;
    font-size: 18px;
    line-height: 20px;
    font-weight: bold;
    color: #333333;
}
	</style>
</head>
<body class="container" style="margin-bottom: 30px;">
	<fieldset>
		<legend style="font-size: x-large; font: bolder; color: blue">
			Graduate Program Applications </legend>
			
	    <div>		
		<a href="ManageDepartment.html">Back</a>
		</div>
		<c:set var="deptid" value="0"></c:set>
		<div class="form-group"></div>
		<table style="width: 90%; margin: auto; margin-bottom: 50px;"
        class="table-bordered table">
        <caption class="bg-success MyCaption">Departments</caption>		
			 <tr> <td><c:out value="${department.name}"></c:out>
			 <a href="EditDepartment.html?id=${department.dept_id}">Edit</a>
			
			 </td></tr>			
		</table>
		
		<table style="width: 90%; margin: auto; margin-bottom: 50px;"
        class="table-bordered table">
        <caption class="bg-success MyCaption">Program</caption>		
			<c:forEach items="${programs}" var="program">
	            <tr>	           
					<td><c:out value="${program.name}"></c:out></td>	
					<td><a href="DeleteProgram.html?programid=${program.program_id}&dptname=${department.name}">Remove</a>
				 </tr>
			</c:forEach>
		</table>
		
		<table style="width: 90%; margin: auto; margin-bottom: 50px;"
        class="table-bordered table">
        <caption class="bg-success MyCaption">Additional Requirement</caption>		
       		<tr>
       			<th>Name</th>
       			<th>Type</th>
       			<th>Required</th>  
       			<th>Remove</th>     			
       			
       		</tr>
			<c:forEach items="${addtionalField}" var="addtionalField">
	            <tr>
	            
					<td><c:out value="${addtionalField.name}"></c:out></td>	
					<td><c:out value="${addtionalField.type}"></c:out></td>	
					<td><c:out value="${addtionalField.required}"></c:out></td>				   
				    <td><a href="DeleteField.html?fieldid=${addtionalField.field_id}&dptname=${department.name}">Remove</a>
		 </tr>
		 </c:forEach>
		</table>
	</fieldset>
</body>
</html>