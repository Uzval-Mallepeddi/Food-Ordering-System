<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html lang="en">
   <head>
    <meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Menu | Foodie</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
  </head>
<body>
<div style="position: fixed; top:0; width: 100%; z-index: 1111;">
<%@ include file="/WEB-INF/views/header.jspf" %>
</div>

<main role="main">
  <section class="jumbotron text-center menu-banner">
    <div class="container">
      <h1 style="color: black" class="font-weight-bold">Menu</h1>
      <p class="lead font-weight-normal">Foodie isn't just about authentic food, it specializes in high standard, fresh, varieties from all across the globe and healthy food with affordable prices. Our food is cooked fresh to the customer's order and taste. You are guaranteed the freshness of your order!</p>
      <p>
        <a href="/cart" class="btn btn-primary my-2">Cart <i class="fas fa-shopping-cart"></i></a>
        <a href="#" class="btn btn-success my-2">Checkout <i class="fas fa-cash-register"></i></a>
      </p>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row">
      	<c:forEach var="tempFoodItem" items="${foodItems}">
	      	<div class="col-md-4">
	          <div class="card mb-4 shadow-sm">
	          <% HashMap<Integer, Integer> cItem = (HashMap<Integer, Integer>) session.getAttribute("cartItems"); %>
	          	<c:choose>
	          		<c:when test="${tempFoodItem.imglink == null}">
	              		<div class="img-notfound" style="width: 100%; height: 300px; background-color: #55595c; text-align: center">
	                		<p style="color: white; line-height: 300px"> ${tempFoodItem.name} </p>
	              		</div>
	            	</c:when>
	            	<c:otherwise>
	            		<div class="img-notfound" style="width: auto; height: 300px; background-color: #55595c; text-align: center">
	                		<img src="${tempFoodItem.imglink}" width="100%" height= "300px" style="border-radius: .3rem"/>
	                		<c:choose>
		                		<c:when test="${tempFoodItem.availability != null}">
		                			<span class="badge badge-pill badge-success" style="position: absolute; top: -10px; right: -5px"><i class="far fa-smile-beam"></i> Available</span>
		                		</c:when>
		                		<c:otherwise>
		                			<span class="badge badge-pill badge-danger" style="position: absolute; top: -10px; right: -5px"><i class="far fa-frown-open"></i> Not Available</span>
		                		</c:otherwise>
		                	</c:choose>
	              		</div>
	            	</c:otherwise>
	            </c:choose>
	            <c:set var="foodItemId" value="${tempFoodItem.id}"/>
	            <div class="card-body">
	            	<blockquote class="blockquote text-center">
	            		<p class="text-center" style="padding: 0px; font-size: 19px; margin-bottom: 8px">
	            			<span class="badge badge-pill badge-dark">
	            				${tempFoodItem.name}
	            			</span>
	            			<span style="font-size: 13px;">x</span>
	            			<% if (cItem.get(pageContext.getAttribute("foodItemId")) != null) {%>
	            				<% System.out.println(pageContext.getAttribute("foodItemId")); %>
		            			<select id="quantity-${tempFoodItem.id}" style="font-size: 13px" title="Quantity" autocomplete="off">
									<option value="1" <% if (cItem.get(pageContext.getAttribute("foodItemId")) == 1) { %> selected <% } %> >1</option>
									<option value="2" <% if (cItem.get(pageContext.getAttribute("foodItemId")) == 2) { %> selected <% } %>>2</option>
									<option value="3" <% if (cItem.get(pageContext.getAttribute("foodItemId")) == 3) { %> selected <% } %>>3</option>
									<option value="4" <% if (cItem.get(pageContext.getAttribute("foodItemId")) == 4) { %> selected <% } %>>4</option>
									<option value="5" <% if (cItem.get(pageContext.getAttribute("foodItemId")) == 5) { %> selected <% } %>>5</option>
									<option value="6" <% if (cItem.get(pageContext.getAttribute("foodItemId")) == 6) { %> selected <% } %>>6</option>
									<option value="7" <% if (cItem.get(pageContext.getAttribute("foodItemId")) == 7) { %> selected <% } %>>7</option>
									<option value="8" <% if (cItem.get(pageContext.getAttribute("foodItemId")) == 8) { %> selected <% } %>>8</option>
									<option value="9" <% if (cItem.get(pageContext.getAttribute("foodItemId")) == 9) { %> selected <% } %>>9</option>
									<option value="10"<% if (cItem.get(pageContext.getAttribute("foodItemId")) == 10) { %> selected <% } %>>10</option>
								</select>
							<% } else {%>
								<select id="quantity-${tempFoodItem.id}" style="font-size: 13px" title="Quantity" name="quantity" autocomplete="off">
									<option value="1" selected>1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
							<% } %>
	            		</p>
	              		<footer class="blockquote-footer" style="padding: 0px; font-size: 12px;">${tempFoodItem.desc}</footer>
	            	</blockquote>
	              <div class="d-flex justify-content-between align-items-center" style="margin-top: 28px;">
	                <div class="btn-group">
					  <a href="/fooditem/view/${tempFoodItem.id}" class="btn btn-sm btn-outline-success" title="View Food Item"><i class="fas fa-eye"></i></a>
	                  <a href="/fooditem/update/${tempFoodItem.id}" class="btn btn-sm btn-outline-info" title="Edit Food Item"><i class="fas fa-edit"></i></a>
	                  <a href="/fooditem/delete/${tempFoodItem.id}" class="btn btn-sm btn-outline-danger" title="Delete Food Item" onclick="if(!(confirm('Are you sure that you want to delete this Food Item?'))) return false;"><i class="fas fa-trash"></i></a>
	                </div>
	                
	                <% if (cItem.get(pageContext.getAttribute("foodItemId")) == null) {%>
	                <div class="btn btn-primary add" style="border-radius: 50%;" title="Add to Cart" id="${tempFoodItem.id}" >
	                	<small>
	                		<i class="fas fa-plus"></i>
	                	</small>
	                </div>
	                <div class="btn btn-danger remove" style="border-radius: 50%; display: none;" title="Remove from Cart" id="remove-${tempFoodItem.id}" >
	                	<small>
	                		<i class="fas fa-minus"></i>
	                	</small>
	                </div>
	                <% } else { %>
	                <div class="btn btn-primary add" style="border-radius: 50%; display: none;" title="Add to Cart" id="${tempFoodItem.id}" >
	                	<small>
	                		<i class="fas fa-plus"></i>
	                	</small>
	                </div>
	                <div class="btn btn-danger remove" style="border-radius: 50%;" title="Remove from Cart" id="remove-${tempFoodItem.id}" >
	                	<small>
	                		<i class="fas fa-minus"></i>
	                	</small>
	                </div>
	                <% } %>
	              </div>
	            </div>
	          </div>
	        </div>
		</c:forEach>
      </div>
    </div>
  </div>
</main>

<%@ include file="/WEB-INF/views/menu-footer.jspf" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.js"></script>
<script>
jQuery(document).ready(function($) {
	 
	$(".add").click(function(){
		console.log($(this).attr('class'));
		var itemid = $(this).attr('id');
		var select_id = "#quantity-"+itemid;
		var quantity = $(select_id).val();
		var itemToAdd = '{"fooditemid":'+itemid+', "quantity":'+quantity+'}';
		obj = JSON.parse(itemToAdd);
		//data = JSON.stringify(obj);
		$.ajax({
			type : "POST",
			contentType : "application/json",
			mimeType: 'application/json',
			url : "/menu/addToCart",
			data : obj,
			dataType : 'html',			
			success : function(data) {
				console.log(data);
				alert("Food Item added to cart !");
			},
			error : function(data) {
				console.log(data);
				alert("Failed to add food-item from cart !");
			}
		});
		var plusdiv = "#"+itemid;
		$(plusdiv).hide();
		var removediv = "#remove-"+itemid;
		$(removediv).show();
	});
});

jQuery(document).ready(function($) {
	 
	$(".remove").click(function(){
		var itemid = $(this).attr('id');
		itemid = itemid.split("-")[1];
		var removeitemid = $(this).attr('id');
		var select_id = "#quantity-"+itemid;
		var quantity = $(select_id).val();
		var itemToRemove = '{"fooditemid":'+itemid+', "quantity":'+quantity+'}';
		obj = JSON.parse(itemToRemove);
		//data = JSON.stringify(obj);
		$.ajax({
			type : "POST",
			contentType : "application/json",
			mimeType: 'application/json',
			url : "/menu/addToCart",
			data : obj,
			dataType : 'html',	
			success : function(data) {
				console.log(data);
				alert("Food Item removed from cart !");
			},
			error : function(data) {
				console.log(data);
				alert("Failed to remove food-item from cart !");
			}
		});
		var plusdiv = "#"+itemid;
		$(plusdiv).show();
		var removediv = "#"+removeitemid;
		$(removediv).hide();
	});
});
</script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" type="text/javascript"></script>
</body>
</html>
