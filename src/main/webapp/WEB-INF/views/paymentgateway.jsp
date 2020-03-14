<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
   <head>
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
      <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css" />
      <title>Payment Gateway | Foodiee</title>
   </head>
   <body onload="hideLoader()">
      <div class="container" style="margin-top: 5%;">
         <div class="row">
            <div class="paymentCont">
               <div class="headingWrap">
                  <h3 class="headingTop text-center">Select Your Payment Method</h3>
                  <p class="text-center">Your payment will be automatically processed after checking out..</p>
               </div>
               <div class="paymentWrap">
                  <div class="btn-group paymentBtnGroup btn-group-justified" data-toggle="buttons">
                     <label class="btn paymentMethod active">
                        <div class="method visa"></div>
                        <input type="radio" name="options" checked>
                     </label>
                     <label class="btn paymentMethod">
                        <div class="method master-card"></div>
                        <input type="radio" name="options">
                     </label>
                     <label class="btn paymentMethod">
                        <div class="method amex"></div>
                        <input type="radio" name="options">
                     </label>
                     <label class="btn paymentMethod">
                        <div class="method discover"></div>
                        <input type="radio" name="options"> 
                     </label>
                     <label class="btn paymentMethod">
                        <div class="method ez-cash"></div>
                        <input type="radio" name="options"> 
                     </label>
                  </div>
               </div>
               <div class="footerNavWrap clearfix">
                  <a class="btn btn-success pull-left btn-fyi" href="/cart"><span class="glyphicon glyphicon-chevron-left"></span> CONTINUE SHOPPING</a>
                  <form:form method="POST" action="${pageContext.request.contextPath}/placeorder">
                  	<a class="btn btn-success pull-right btn-fyi" onclick="myFunction(); this.parentNode.submit()">CHECKOUT <span class="glyphicon glyphicon-chevron-right"></span></a>
                  </form:form>
               </div>
            </div>
         </div>
      </div>
      <div id="loader"></div>
   	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
   	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
   	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   	<script src="https://code.jquery.com/jquery-2.2.4.min.js" type="text/javascript"></script>
   	<script>
   	var myVar;

   	function myFunction() {
      document.getElementById("loader").style.display = "block";
   	  myVar = setTimeout(hideLoader, 12000);
   	}
	
   	function hideLoader() {
   	  document.getElementById("loader").style.display = "none";
   	}
   	</script>
   </body>
</html>

