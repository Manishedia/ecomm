<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  -->
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Product Details</title>
</head>
<body>


<div class="container">
		<div class="panel panel-info" style="width: 500px">
			<!-- product.getProductName() -->
			<div class="panel-heading">Product Details</div>
			
			<div class="panel-body">
			<c:url value="/cart/addtocart/${product.productId }" var="url"></c:url>
			<form action="${url }" >
				<table>
					<tr>
						<td><b>ProductName</b>: ${product.productName }<br> <b>Category
								Name</b>:${product.productCategory.categoryName }<br> <b>Product
								Description</b>: ${product.productDesc}<br> <b>Price
						</b>: ${product.price }<br> <b>Quantity </b>:${product.quantity }
						</td>
						<td></td>
						<td><img
							src='<c:url value="/resources/images/${product.productId }.png"></c:url>' height="250px" width="200px" alt="NA" align="right">
						</td>
					</tr>
				</table>
				
				<c:if test="${product.quantity==0 }">
				<button class="btn btn-warning" disabled>Out Of Stock</button>
				</c:if>
				
				<c:if test="${product.quantity!=0 }">
				<security:authorize access="hasRole('ROLE_USER')">
				<!-- if you submit, insert into cartitem values (?,quantity,totalprice,product,user) -->
				Enter quantity:<input type="number" value="1" name="requestedQuantity" min="1" max="${product.quantity }"><br>
			  <button type="submit" class="btn btn-info button btn-lg"><span class="glyphicon glyphicon-shopping-cart" ></span>Add to cart</button>
			  </security:authorize>
			  </c:if>
			  </form>
			</div>
			
		</div>
	</div>
	<br>
<a href="<c:url value='/productlist'></c:url>" class="btn btn-success pull-left">
View Product List  </a>

</body>

</html>