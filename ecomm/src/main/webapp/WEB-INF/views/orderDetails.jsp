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
<title>Order Details</title>
</head>
<body>
<div class="container" align="center">
 <div class="row" align="center">
<img style="max-width:50%; margin-top:20 px;" src="resources/imageProject/showCart3.gif">
</div>
<form>
<h2>Your Order Details</h2>
	<table>
		<tr><td align="left"><b>Grand Total : </b></td><td>${grandTotal}</td></tr>
		<tr><td align="left"><b>Customer Name : </b></td><td>${shipping.customername}</td></tr>
		<tr><td align="left"><b>Address : </b></td>
		<td>${shipping.apartmentnumber},${shipping.streetname},${shipping.city},${shipping.state}</td></tr>
		<tr><td align="left"><b>PIN : </b></td><td>${shipping.zipcode}</td></tr>
	<%-- <tr><td align="left"><b>Date: </b></td><td>${order.orderDate}</td></tr>--%>
	</table>
	</form>
		<div class="container" align="center">                                     
  		<div class="dropdown" align="center">
    	<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Pay Now 
    	<span class="caret"></span></button>
    	<ul class="dropdown-menu">
      	<li><a href="${pageContext.request.contextPath}/checkout">Cash On Delivery</a></li>
      	<li><a href="${pageContext.request.contextPath}/payment">Online Payment</a></li>
    	</ul>
  		</div>
		</div>
		</div>
	
</body>
</html>