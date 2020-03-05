<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup | Foodiee</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css" integrity="sha384-REHJTs1r2ErKBuJB0fCK99gCYsVjwxHrSU0N7I1zl9vZbggVJXRMsv/sLlOAGb4M" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
</head>
<body class="signup">
<div id="header">
    <%@ include file="/WEB-INF/views/header.jspf" %>
</div>
<div class="container animated fadeIn" style="display:flex; width:90vw; height: 100vh; margin: auto;">
  <div class = "card" style = "background-color: black; width: 77%; padding: 20px; margin: auto; color: white; opacity: 0.9;"><br/>
    <h2 class= "text-center" style="color: white; padding-top: 14px">Signup</h2><hr style="background: white; width: 70%; margin: auto;">
      <div class = "card-body">
      	<form:form action="${pageContext.request.contextPath}/save" method="post" role="form" modelAttribute="user">
      		<div class = "form-group">
      			<label>Name</label><br/>
      			<form:input cssClass="form-control" cssStyle="display: inline; width: 49%;" path="firstName" required="required" placeholder="Enter your firstname..."/>
      			<form:input cssClass="form-control" cssStyle="display: inline; width: 49%;" path="lastName" required="required" placeholder="Enter your lastname..."/>
      		</div>
      		<div class = "form-group">
      			<label>Email</label>
      			<form:input type="email" class="form-control" placeholder="Enter your email address" required="required" path="userName"/>
      		</div>
            <% if((session.getAttribute("role") != null) && (session.getAttribute("role").equals("ADMIN"))) { %>
            	<div class = "form-group">
	      			<label>Role</label>
					<form:select class="form-control" required="required" path="role">
						<form:option value="USER" label="User"/>
						<form:option value="EMPLOYEE" label="Employee"/>
						<form:option value="ADMIN" label="Admin"/>
					</form:select>
      			</div>
      		<% } else {%>
      			<div class = "form-group" style="display:none">
	      			<label>Role</label>
					<form:select class="form-control" required="required" path="role">
						<form:option value="USER" label="User"/>
						<form:option value="EMPLOYEE" label="Employee"/>
						<form:option value="ADMIN" label="Admin"/>
					</form:select>
      			</div>
      		<% } %>
      		<div class = "form-group">
      			<label>Password</label>
				<form:input type="password" class="form-control" placeholder="Enter your password" required="required" path="password"/>
      		</div>
      		<div class = "form-group">
      			<label>Password Confirmation</label>
				<input type="password" class="form-control" placeholder="Enter your password again.." required="required"/>
      		</div>
      		<br/>
      		<div class="text-center">
      			<input type="submit" value="Sign up" class="btn btn-primary"/>
      		</div>
      	</form:form><br/>
      	<a href="/login" class="anchor-tags a-1">Existing Customer ?</a>
      	<a href="/" class="anchor-tags a-2">Home</a>
      </div>
  </div>
</div>
<div id="footer">
    <%@ include file="/WEB-INF/views/footer.jspf" %>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>