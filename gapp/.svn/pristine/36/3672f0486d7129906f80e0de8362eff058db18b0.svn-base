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
<body>
 <body class="container" style="margin-bottom: 30px;">
	<form:form modelAttribute="user">

		<div id="header">		
			<h2>Graduate Program Applications </h2>			
	   </div>		   
			
		<div id="nav">	
		</div>		
		
		<div class="section">
		 <h4><font color = "blue"> Add Department </font></h4>
		    <p color = "red"> ${message}</p>		
			<br>
						 
             <div class="control-group">
				<form:label path="name" class="control-label col-md-2">Name</form:label>
				<form:input class="label-control" path="name" required="required"/>
			</div>
              <br>
	     <button type="submit" class="btn btn-primary">Add</button>
	   </div>
	  
	</form:form>
</body>
</html>