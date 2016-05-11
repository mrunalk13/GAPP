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
		<div class="panel-group" id="accordion" style="width: 60%">
      
			<div class="panel panel-default">
			<c:choose>
                   <c:when test="${!empty af}">
				<div class="panel-heading">
					<h4 class="panel-title">Additional Details</h4>
				</div>
				<div class="panel-body">
				
                   					
						<c:forEach items="${af}" var="af">

							<c:set var="afvValue" value=""></c:set>
							<c:set var="afvId" value=""></c:set>
							<c:forEach items="${afvList}" var="element">
								<c:if test="${af.field_id ==  element.field.field_id}">
									<c:set var="afvValue" value="${element.value}"></c:set>
									<c:set var="afvId" value="${element.fieldValue_id}"></c:set>
								</c:if>
							</c:forEach>


							<c:choose>
								<c:when test="${af.type == 'File'}">
									<form action="UploadAdditionalReqFile.html" method="POST"
										class="form-inline" enctype="multipart/form-data">
										<div class="form-group">
											<label class="control-label col-sm-2">${af.name}</label>
											
												<c:choose>
													<c:when test="${afvValue == ''}">
													  <div class="col-xs-6 col-centered" style="float: center">	
														<input type="file" class="label-control-file" name="file" required />
													</div>														
													</c:when>
													<c:otherwise>		
													   <div class="col-xs-6 col-centered" style="float: right">											  
														<a href="downloadAddReq/${afvId}.html" style="float: center">${afvValue}</a>
													   </div>										
													</c:otherwise>
												</c:choose>
											
										</div>
										<input type="hidden" name="appId"
											value="${application.application_id}" /> <input type="hidden"
											name="fieldId" value="${af.field_id}" />

                                       <c:choose>
										<c:when test="${afvValue == ''}">
											<button type="submit" id="upload"
												class="btn btn-success btn-sm" style="float: right">Save</button>
										</c:when>
										<c:otherwise>
										     <a href="EditAddReqFile.html?id=${afvId}" class="btn btn-primary" 
										          style="float: right" role="button">Edit</a>			
										</c:otherwise>
										</c:choose>
									</form>
								</c:when>


								<c:otherwise>
									<form:form modelAttribute="afv" action="AddAdditionalReq.html"
										method="POST" class="form-inline">
										<div class="form-group">

											<form:label class="control-label col-sm-2" path="file">${af.name}</form:label>
											
											<div class="col-sm-10">
											<input type="hidden" name="appId"
												value="${application.application_id}" /> <input
												type="hidden" name="fieldId" value="${af.field_id}" />
												
											</div>
										</div>
										
										<c:choose>
													<c:when test="${afvValue == ''}">
														<form:input class="label-control" path="value"
															value="${afvValue}" required="true" />
														<button type="submit" id="upload"
															class="btn btn-success btn-sm" style="float:right">Save</button>
													</c:when>
													<c:otherwise>
													   <form:input class="label-control" path="value"
															value="${afvValue}" readonly="true" />
														 <a href="EditAddReq.html?id=${afvId}" class="btn btn-primary" 
										                     style="float:right" role="button">Edit</a>		
													</c:otherwise>
												</c:choose>
									</form:form>
								</c:otherwise>
							</c:choose>

							<br>
						</c:forEach>
					</c:when>
					
					<c:otherwise>
					   <label>
					   <font color=#00b33c>
					      The Application is ready to be submitted. Good Luck! 
					   </font>
					   </label>   
					</c:otherwise>	
								
                  </c:choose>
				</div>
			</div>             
			<br>				
			  <a href="SaveApplication.html" class="btn btn-primary" role="button">Save</a>				
										  
			  <a href="SubmitApplication.html?appId=${application.application_id}"
						 class="btn btn-primary" role="button">Submit Application</a>
		</div>	
	</div>

</body>
</html>