<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<%@ page isELIgnored="false" %>
<jsp:useBean id="now" class="java.util.Date" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>INVOICE</title>
  </head>
<body>
<div class="container-wrapper">
    <div class="container">
        <div class="container"> 
<form:form action="${url }" modelAttribute="order">
	<div class="row">
    <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
		<div >
		<h1 align="center"><u>monAmi</u></h1>
        <h5 align="center">(INVOICE)</h5>
    </div>
     ORDER ID: ${order.orderDetailsId }            
     <div class="row">
         <div class="col-xs-6 col-sm-6 col-md-6">
          <address>
          <strong><button disabled>Shipping Address</button></strong><br/>
          ${shipping.customername}
          <br/>
          ${shipping.apartmentnumber}
          <br/>
          ${shipping.streetname}
          <br/>
          ${shipping.city}, ${shipping.state}
          <br/>
          ${shipping.zipcode}
          </address>
          </div>
          <%-- <div class="col-xs-6 col-sm-6 col-md-6 text-right">
          <p>Order Date: ${order.orderDate }</p>
          </div> --%>
          </div>
          <hr>
			<div class="row">
            <table class="table table-hover" border="1">
            <thead>
            <tr>
            	<td>Image</td>
                <td>Product</td>
                <td>Units</td>
                <td class="text-center">Price</td>
                <td class="text-center">Total</td>
           </tr>
           </thead>
           <tbody>
           <c:forEach var="cartItem" items="${cartItem}">
           <tr>
           <c:url value="/resources/images/${cartItem.product.productId }.png" var="imgUrl"></c:url>
           			<td><img src="${imgUrl }" height="50px" width="50px">  </td>
                    <td class="col-md-9"><em>${cartItem.product.productName}</em></td>
                    <td class="col-md-1" style="text-align: center">${cartItem.qty}</td>
                    <td class="col-md-1" style="text-align: center">${cartItem.product.price}</td>
                    <td class="col-md-2" style="text-align: center">${cartItem.subTotal}</td>
                 	</tr>
           </c:forEach>
					<tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="text-left">
                    <h4><strong>Grand Total:</strong></h4>
                    </td>
                    <td class="text-center text-danger">
                    <h4>Rs. ${order.grandTotal}</h4>
                    </td>
                    </tr>
		  </tbody>
          </table>
          </div>                      
          </div>       
          </div>          
          </form:form>
        </div>
        </div>
        </div>
        <a href="<c:url value='/orderDetails/${shipping.id}'></c:url>" class="btn btn-success pull-right">Confirm Order </a>
        </body>