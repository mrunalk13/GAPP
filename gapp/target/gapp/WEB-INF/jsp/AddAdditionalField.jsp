<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	#header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;
}
#nav{
    line-height:30px;
    background-color:#eeeeee;
    height:700px;
    width:200px;
    float:left;
    padding:5px; 
}
#section {
    width:350px;
    float:left;
    padding:50px; 
}
	</style>
</head>
<body class="container" style="margin-bottom: 30px;">
	<form:form modelAttribute="user" class="form-horizontal">

		<div id="header">		
			<h2>Graduate Program Applications </h2>			
	        </div>	
	        
	        <div id="nav">	
	         <h4>Welcome ${sessionScope.Name} </h4>			
			<br><small><a href="Logout.html">Logout</a></small>
	    	</div>
	    	
	    	<div class="section">
		     <h4><font color = "blue"> Add Program </font></h4>
			<p text-align:center><font color = "red" > ${message}</font></p>
			
			<br>
						 
             <div class="control-group">
				<label class="col-sm-2 control-label">Department</label>		
						
				   <select class="control-label" name="department">
				      <c:forEach items="${department}" var="department">
                         <c:if test="${!empty department}">
				            <option value="${department.name}">${department.name}</option>
				         </c:if>
			          </c:forEach>
			      </select>			    
			</div>
			<br>
			
			 <div class="control-group">
				<form:label path="name" class="control-label col-sm-2">Requirement</form:label>
				
				<form:input class="control-label" path="name" required="required"/>
				</div>
			
			<br>
			 <div class="control-group">
				<form:label class="col-sm-2 control-label" path="type">Type</form:label>		
				 		
				   <form:select class="control-label" path="type">
				        <option value="String">String</option>
				        <option value="Float">Number</option>
				        <option value="byte">File</option>
			      </form:select>
			     
			
			<br>
			<br>
			
            <form:checkbox class="col-sm-1" path="required" label="Required"/>
           
            
	    
	    <br>
	     <button type="submit" class="btn btn-primary">Add</button>
	     </div>
	</form:form>
</body>
</html>