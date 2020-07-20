<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>

    <link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">
</head>
<body>
	
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#collapse-example"
			aria-expanded="false">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<div class="navbar-header">
			<a class="navbar-brand" href='<c:url value="/home"></c:url>'><img src="<c:url value="/resources/imageProject/logo.jpg"/>"
				alt="monAmi" height="35px" width="120px"></a>
				
		</div>
		<div class="collapse navbar-collapse" id="collapse-example">
			<ul class="nav navbar-nav">
			
				<li class="active"><a href='<c:url value="/home"></c:url>'>Home</a></li>
				<li><a href='<c:url value="/productlist"></c:url>'>Browse All Products</a></li>

			
			<li class="dropdown"><a href="" class="dropdown-toggle"
				data-toggle="dropdown">Select by Categories<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<c:forEach items="${list}" var="c">
						<li><a href='<c:url value="/showProductsByCategory/${c.categoryId}"></c:url>'>
						<span style="font-weight:bold">${c.categoryName}</span> </a></li>
					</c:forEach>

				</ul></li>
				<security:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href='<c:url value="/admin/productform"></c:url>'>Add Products</a></li>
				<li><a href='<c:url value="/admin/addCategory"></c:url>'>Add Category</a></li>
				<li><a href='<c:url value="/admin/viewCategory"></c:url>'>View Categories</a></li>
				<li><a href='<c:url value="/admin/viewusers"></c:url>'>View Users</a></li>
				</security:authorize>
				<c:if test="${pageContext.request.userPrincipal.name==null }">
				<li><a href='<c:url value="/usersform"></c:url>'>Sign Up</a></li>
				<ul class="nav navbar-nav navbar-right">
				<li><a href='<c:url value="/loginPage"></c:url>'>Login</a></li>
			</ul>
				</c:if>
				
				<c:if test="${pageContext.request.userPrincipal.name!=null }">
				<security:authorize access="hasRole('ROLE_USER')">
			<li><a href="<c:url value='/cart/showCart'></c:url>"><span class="glyphicon glyphicon-shopping-cart"></span>(${sessionScope.cartSize  })</a></li>
			</security:authorize>
			<li><a href='<c:url value="/all/editusers"></c:url>'>My Profile</a></li>
			</c:if>
			
				<c:if test="${pageContext.request.userPrincipal.name!=null }">
				<li><a href='<c:url value="/j_spring_security_logout"></c:url>'>Logout</a></li>
				</c:if>
			<!--
			<li><a href="">sign in</a></li>
				  -->


</ul>
			<!-- <c:if test="${pageContext.request.userPrincipal.name!=null }">
			<li><a href="j_spring_security_logout">Logout</a></li>
			
			</c:if>
			 -->
			

		</div>
	</div>
	</nav>
</body>
</html>