<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Types | Foodiee</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css" integrity="sha384-REHJTs1r2ErKBuJB0fCK99gCYsVjwxHrSU0N7I1zl9vZbggVJXRMsv/sLlOAGb4M" crossorigin="anonymous" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
</head>
<body class="item-type">
<div id="header">
    <%@ include file="/WEB-INF/views/header.jspf" %>
</div>
<br/>
<br/>
<h2 style="color: black; text-align: center">Item Type</h2>
<hr style="background-color: white">

<div class="container animated bounceIn" style="display:flex; justify-content: center; align-items: center; height: 55vh; opacity: 0.9">
  <div class = "card" style = "background-color: black; width: 40%">
    <div class = "card-body">
        <blockquote class="blockquote text-center">
            <h2 style="color: white; font-family: Courier New, Lucida, Console">${type}</h2>
            <div class="blockquote-footer"><cite title="Source Title">${description}</cite></div>
        </blockquote>
		<br/>
      <div class="text-center">
        <a href="/itemtype/update/${ id }" class="btn btn-warning">Edit</a>
        <a href="/itemtypes" class="btn btn-primary">Back</a>
      </div>
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