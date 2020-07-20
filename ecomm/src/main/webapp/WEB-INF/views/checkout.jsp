<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="header.jsp"></jsp:include>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Checkout</title>
</head>
<body>
<div class="container">
 <div class="row">
 <div class="col-sm-6 item-photo">
<img style="max-width:100%; margin-top:30 px;" src="resources/imageProject/cod.jpg">
</div>
 
 <div class="col-md-6" style="border:0px solid gray">
 
 
<button class="btn btn-success btn-lg btn-block"><th><h1>Order Details</h1></th></button><br>
<table width="70%"  align="center"   class="table table-hover table-condensed table-bordered">
<h3>Grand Total: &#8377; ${order.grandTotal}</h3>
<h3>Name  : ${shipping.customername}</h3>
<h3>Address: ${shipping.apartmentnumber},${shipping.streetname},${shipping.city},${shipping.state}</h3>
<h3>PIN: ${shipping.zipcode}</h3>
<%-- <h3>Date: ${orderDetails.orderDetails }</h3> --%>

<c:if test="${param.paymentMode == 'NetBanking'}">

<h3>Payment Mode: Online</h3>
</c:if>

<c:if test="${param.paymentMode != 'NetBanking'}">

<h3>Payment Mode: Cash On Delivery</h3>
</c:if>
</table>
<a class="btn btn-warning" href="ackment"><h2>Confirm</h2></a>
</div>
</div>
</div>


</body>
</html>