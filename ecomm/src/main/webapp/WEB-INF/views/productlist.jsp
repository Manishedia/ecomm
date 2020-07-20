<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>

    <link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://localhost:8080/testPack/resources/css/table.css">
<title>Product List</title>
</head>
<script>
	$(document).ready(function() {
		var searchCondition = '${searchCondition}';
		$('.table').DataTable({
			"lengthMenu" : [ [  5, 7, -1 ], [  5, 7, "All" ] ],
			"oSearch" : {
				"sSearch" : searchCondition
			}
		})
	});
</script>
<title>Insert title here</title>
</head>
<body>

	<!-- for iteration - similar to for() in Java -->
	<!-- productsAttr is a model attribute, to which we have assigned List<Product> -->
	<!-- 
productsAttr -> 
p = 1 1000.0 Product Description for toy car Toy Car 12
2 1300.0 Product Description Book 2
 -->
	<div class="container">
		<b>List of Products</b>
		<table class="table table-hover" border="2">
			<thead id="thead">
				<tr>
				    <th>Image</th>
					<th>ProductName</th>
					<th>Category</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${productsAttr }" var="p">
					<tr>
					  <td><a
							href='<c:url value="/all/productdetails/${p.productId}"></c:url>'><img src='<c:url value="resources/images/${p.productId }.png" ></c:url>' alt="Image NA" height="50px" width="50px"></a></td>
						<!-- p.getProductName() -->
						<!-- p.getPrice() -->
						<td>${p.productName }</td>
						<!-- p.getCategory().getCategoryname() -->
						<td>${p.productCategory.categoryName }</td>
						<td>${p.price }</td>
						<!-- http://...../all/getproduct/1 
					http://........../all/getproduct/2
					http://..../all/getproduct/3
					-->
						<!--  when glyphicon info sign is clicked, request
					 will be handled by the RequestMapping value 'all/getproduct/1 -->
						<td><a
							href='<c:url value="/all/productdetails/${p.productId}"></c:url>'> <span
								class="glyphicon glyphicon-info-sign"></span></a>
								
						<security:authorize access="hasRole('ROLE_ADMIN')">		

						 <a href='<c:url value="/admin/deleteproduct/${p.productId }"></c:url>'><span
								class="glyphicon glyphicon-trash"></span></a>
								
						<a href='<c:url value="/admin/updateproductform/${p.productId }"></c:url>'><span class="glyphicon glyphicon-pencil"></span></a>		
						</td>
						</security:authorize>
						
								
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>