<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Item Type | Foodiee</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css" integrity="sha384-REHJTs1r2ErKBuJB0fCK99gCYsVjwxHrSU0N7I1zl9vZbggVJXRMsv/sLlOAGb4M" crossorigin="anonymous" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
</head>
<body class="item-type">
<div id="header">
    <%@ include file="/WEB-INF/views/header.jspf" %>
</div>

<div class="container animated fadeIn" style="display:flex; justify-content: center; align-items: center; height: 85vh; opacity: 0.8; color: white;">
  <div class = "card" style = "background-color: black; width: 70%; padding: 20px"><br/>
    <h2 class= "text-center" style="color: white; padding-top: 14px">Item Type</h2><hr style="background: white; width: 70%; margin: auto;">
      <div class = "card-body">
      	<form:form action="${pageContext.request.contextPath}/saveItemType" method="post" role="form" modelAttribute="itemtype">
      		<form:hidden path="id" />
      		<div class = "form-group">
      			<label>Item-Type</label><br/>
      			<form:input type="text" path="type" cssClass="form-control" required="required" placeholder="Enter the item-type"/>
      		</div>
      		<div class = "form-group">
      			<label>Description</label>
      			<form:textarea class="form-control" placeholder="Enter the item-type description" required="required" path="description" rows="5" cols="30"/>
      		</div>
      		<br/>
      		<div class="text-center">
      			<input type="submit" value="Save" class="btn btn-success"/>
      			<a href="/itemtypes" class="btn btn-primary">Back</a>
      		</div>
      	</form:form><br/>
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