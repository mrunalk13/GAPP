<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

</head>         
  <body>
	<div class="header">
		<h2>Graduate Program Applications</h2>
	</div>

	<div class="nav">
		
			<h4> <font color=#00b33c>Welcome ${sessionScope.Name}</font></h4> 
			<a href="WelcomeStudent.html">Home</a>
			<br><small><a href="Logout.html">Logout</a></small>
		
	</div>
<!-- <ul class="nav nav-tabs" >
        <li class="active"><a href="EditApplication">Edit Application</a></li>
        <li><a href="EditDegree">Edit Academic Records</a></li>
        <li><a href="EditAdditionalReq">Edit Additional Requirement</a></li>
  
   </ul> -->
	<div class="section">
	
   
    <form:form modelAttribute="app" class="form-horizontal">   	     
	
	  <form:hidden path="application_id"/>
	  <form:input type="hidden" path="user.user_id"></form:input>
	  <form:input type="hidden" path="dept.dept_id"></form:input>
	  
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
						
							<div class="form-group">
								<form:label class="control-label col-sm-2" path="first_name">First
									Name:</form:label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" path="first_name" value="${app.first_name}" required="true"/>									  
							 	</div>
							</div>
							
							<div class="form-group">
								<form:label class="control-label col-sm-2" path="last_name">Last
									Name:</form:label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" path="last_name" value="${app.last_name}" required="true"/>
								</div>
							</div>
							
							<div class="form-group">
								<form:label class="control-label col-sm-2" path="email">Email:</form:label>
								<div class="col-sm-10">
								<form:input type="text" class="form-control" path="email" value="${app.email}" required="true"/>
								</div>
							</div>
							
							<div class="form-group">
								<form:label class="control-label col-sm-2" path="citizenship">Citizenship:</form:label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" path="citizenship" value="${app.citizenship}" required="true"/>
								</div>
							</div>
							
							<div class="form-group">
								<form:label class="control-label col-sm-2" path="dob">Date of Birth:    (mm/dd/yyyy)</form:label>
								<div class="col-sm-10">
								<fmt:formatDate value="${app.dob}" var="dateString" pattern="MM/dd/yyyy" />
								<form:input type="text" class="form-control" path="dob" value="${dateString}"
								  required="true"/>
								</div>
							</div>
							
							<div class="form-group">
								<form:label class="control-label col-sm-2" path="cin">CIN:</form:label>
								<div class="col-sm-10">
									<form:input type="number" class="form-control" path="cin" value="${app.cin}" required="true"/>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="radiobutton">
									<c:choose>
									 <c:when test="${app.gender eq 'Male'}">
										<form:radiobutton path="gender" value="Male" label="Male" checked="true"/> 
                                        <form:radiobutton path="gender" value="Female" label="Female" />
                                        </c:when>
                                        <c:otherwise>
                                        <form:radiobutton path="gender" value="Male" label="Male" /> 
                                        <form:radiobutton path="gender" value="Female" label="Female" checked="true"/>
                                        </c:otherwise>
                                    </c:choose>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<form:label class="control-label col-sm-2" path="toefl">Toefl:</form:label>
								<div class="col-sm-10">
									<form:input type="number" class="form-control" path="toefl" 
									value="${app.toefl}"  />									  
							 	</div>
							</div>
						
					</div>
				</div>
			</div>

		 	<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse2">	 Application Details </a>
					</h4>
				</div>
				  <div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
						
													
							<div class="form-group">
								<form:label class="control-label col-sm-2" path="dept">Department:</form:label>
								<div class="col-sm-10">									
						     	 <form:select path="dept.dept_id" id="department" class="form-control" readonly="true">
			                     <form:option value="" label="${app.dept.name}" ></form:option>	
			                    
		                         </form:select>		
		                      </div> 
		                   </div>
							
							<div class="form-group">
								<form:label class="control-label col-sm-2" path="program.name">Program:</form:label>
								<div class="col-sm-10">
								     <form:select path="program.name" id="program" class="form-control" required="true">
		                              
		                              <form:options items="${programs}" itemValue="name" itemLabel="name"></form:options>
		                              </form:select>	 
								</div>
							</div> 
							
							<div class="form-group">
								<form:label class="control-label col-sm-2" path="term">Term:</form:label>
								<div class="col-sm-10">
								 <form:select path="term.term_id" id="term" class="form-control" required="true">
			                     <form:option value="" label="${app.term.term}" ></form:option>	
			                     <form:options items="${terms}" itemValue="term_id" itemLabel="term"></form:options>
		                         </form:select>	
								</div>
							</div>							
					</div>
			</div>
		</div> 
		
		
		  <br>
		</div>  
	     <button type="submit" id="save1" class="btn btn-primary" >Save</button>
	     <a href="NewApplication1.html?appId=${app.application_id}" class="btn btn-primary" role="button" >Continue</a>
	    
		
</form:form> 
  
  
	</div>

</body>
</html>