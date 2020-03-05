<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ fn:toUpperCase(fooditemname) }| Foodiee</title>
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
<h2 style="color: black; text-align: center; margin-top: 60px !important;">Food Item</h2>
<hr style="background-color: white">

<div class="container animated bounceIn" style="display:flex; width:90vw; height: 60vh; margin: auto;">
  <div class = "card" style = "background-color: black; width: 67%; padding: 20px; margin: auto; color: white; opacity: 0.9;"><br/>
    <div class = "card-body">
        <blockquote class="blockquote text-center">
            <h2 style="color: white; font-family: Courier New, Lucida, Console">${fooditemname}</h2>
            <div class="blockquote-footer"><cite title="Source Title">${fooditemdesc}</cite></div>
        </blockquote>
		<br/>
		<hr style="color: white; background-color: white">
		<dl>
			<dt class="inline-block">Image Link:</dt>
			<dd>
				<ul>
					<ul><a href="${fooditemimg}" target="_blank">${fooditemimg}</a></ul>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt class="inline-block">Price: <span style="color: white; font-weight: normal">${fooditemprice}</span></dt>
		</dl>
		<dl>
			<dt class="inline-block">Food Item Availability: <span style="color: white; font-weight: normal">${fooditemavailable}</span></dt>
		</dl>
		<dl>
			<dt class="inline-block">Added by: <span style="color: white; font-weight: normal">${fooditemaddedby}</span></dt>
		</dl>
		<dl>
			<dt class="inline-block">Added at: <span style="color: white; font-weight: normal">${fooditemaddedat}</span></dt>
		</dl>
      <div class="text-center">
        <a href="/fooditem/update/${ fooditemid }/${ fooditemavailable }" class="btn btn-warning">Edit</a>
        <a href="/fooditems" class="btn btn-primary">Back</a>
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