<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
   <head>
    <meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cart | Foodie</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/cart.css" rel="stylesheet">
  </head>
<body>
<div style="position: fixed; top:0; width: 100%; z-index: 1111;">
<%@ include file="/WEB-INF/views/header.jspf" %>
</div>
<main role="main">
  <h1 style="text-align: center; margin-top: 60px">Cart</h1>
  <div class="container-fluid" style="margin-bottom: 120px;">
  	<p style="float: right; margin-right: 80px; margin-bottom: 0px; font-size: 13px" class="text-muted">Price</p>
  	<div class="clearfix"></div>
	<hr style="background-color: #C0C0C0 !important; width: 90%; margin-top: 0px">
	<c:forEach var="cartItem" items="${showCartItems}">
	<div class="container" style="margin-bottom: 30px">
		<div class="row">
			<div class="col-md-4">
				<img src="${cartItem.imglink}" width="70%" height= "200px" style="border-radius: .3rem; margin-bottom: 10px"/>
			</div>
			<div class="col-md-8 paras">
				<p class="float-right" style="color: #B12704 !important; font-weight: bolder">$ ${cartItem.price}</p>
				<div class="clearfix"></div>
				<p style="font-size: 23px; font-weight: bold; color: #0066c0;">${cartItem.name}</p>
				<p style="font-size: 12px; color: #007600 !important">Available</p>
				<p>Quantity: ${cartItem.quantity}</p>
				<form method="POST" action="menu/RemoveFromCart/${cartItem.id}">
					<a href="#" onclick="this.parentNode.submit()" class="btn btn-danger">Delete</a><br/>
				</form>
			</div>
		</div>
	</div>
	<hr style="background-color: #C0C0C0 !important; width: 90%; margin-top: 0px">
	</c:forEach>
	<div>
		<p style="float: right; margin-right: 80px; margin-bottom: 0px; font-size: 16px">Subtotal (${quantity} items): <span style="color: #B12704 !important; font-weight: bolder">$ ${price}</span></p>
	</div>
	<div class="clearfix"></div>
	<div class="text-center" style="margin-top: 50px;">
  		<a href="/paymentgateway/secure" class="btn btn-primary">Checkout <i class="fas fa-cash-register"></i></a>
  		<a href="/menu" class="btn btn-warning">Menu <i class="fas fa-utensils"></i></a>
  	</div>
  </div>
</main>

<%@ include file="/WEB-INF/views/footer.jspf" %>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" type="text/javascript"></script>
</body>
</html>
