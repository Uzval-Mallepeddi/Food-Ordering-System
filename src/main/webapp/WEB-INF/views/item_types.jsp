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
<br/>
<h2 style="color: black; text-align: center">Item Types</h2>
<hr style="background-color: white">
<div class="container animated fadeInLeft text-center" style="margin-top: 50px">
	<a href="/itemtype/new" class="btn btn-dark">Create new Item-Type</a><br/><br/>
    <div class="row" style="margin-left: -50px">
		<table class="table text-center table-striped" style="color: white; background-color: #000000; opacity: 0.9">
			<thead class="text-center">
				<tr>
				<th class="text-center">Item Type</th>
				<th class="text-center">Actions</th>
				</tr>
				
			</thead>
			<tbody>
				<c:forEach var="tempItemTypes" items="${itemTypes}">
					<c:url var="updateLink" value="/itemtype/update">
						<c:param name="itemTypeId" value="${ tempItemTypes.id }" />
					</c:url><c:url var="viewLink" value="/itemtype/view">
						<c:param name="itemTypeId" value="${ tempItemTypes.id }" />
					</c:url>
					<tr>
						<td>
		  					${tempItemTypes.type}
		  		  		</td>
		  		  		<td>
		  		  			<a href="/itemtype/view/${ tempItemTypes.id }" class="btn btn-warning">View</a>
		  					<a href="/itemtype/update/${ tempItemTypes.id }" class="btn btn-info">Edit</a>
		  					<a href="/itemtype/delete/${tempItemTypes.id}" class="btn btn-danger" onclick="if(!(confirm('Are you sure that you want to delete this Item-Type?'))) return false;"
		  					>Delete</a>
		  		  		</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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