<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | Foodiee</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css" integrity="sha384-REHJTs1r2ErKBuJB0fCK99gCYsVjwxHrSU0N7I1zl9vZbggVJXRMsv/sLlOAGb4M" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
</head>
<body>
<div class="container animated fadeIn" style="display:flex; justify-content: center; align-items: center; height: 85vh; opacity: 0.8; color: white;">
  <div class = "card" style = "background-color: black; width: 37%; padding: 20px"><br/>
    <h2 class= "text-center" style="color: white; padding-top: 14px">Login</h2><hr style="background: white; width: 70%; margin: auto;">
      <div class = "card-body">
      	<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="post" role="form">
      	<c:if test="${ param.error!= null }">
      		<i style="font-size: 12px; color: red;">Sorry..You've entered an invalid username/password...</i>
      	</c:if>
      	<c:if test="${ param.logout != null }">
      		<div class="text-center">
      			<i style="font-size: 12px; color: green;">You've been logged out.</i>
      		</div>
      	</c:if>
      		<div class = "form-group">
      			<label>Email</label>
      			<input type="text" class="form-control" placeholder="Enter your email address" name="username" required />
      		</div>
      		<div class = "form-group">
      			<label>Password</label>
				<input type="password" class="form-control" placeholder="Enter your password" name="password" required/>
      		</div><br/>
      		<div class="text-center">
      			<input type="submit" value="Login" class="btn btn-primary"/>
      		</div>
      	</form:form><br/>
      	<a href="${pageContext.request.contextPath}/signup" class="anchor-tags a-1">New Customer ?</a>
      	<a href="${pageContext.request.contextPath}/" class="anchor-tags a-2">Home</a>
      </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>