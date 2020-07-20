<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ include file="header.jsp" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Category List</title>
</head>
<body>
<h1 align="center"><b>Category List</b></h1>
<table border="2" width="40%" cellpadding="2" align="center">
<tr><th>CategoryId</th><th>CategoryName</th><!-- <th>EditCategory</th><th>DeleteCategory</th> --><tr>
<c:forEach var="category" items="${list}">
<tr>
<td>${category.categoryId}</td>
<td>${category.categoryName}</td>

<%-- <td><a href="editCategory/${category.categoryId}"> Edit</a></td>
<td><a href="deleteCategory/${category.categoryId}">Delete</a></td> --%>
</tr>
</c:forEach>

</table>
<br/>
<table align="center">
<tr><th>Click <a href="addCategory">HERE</a> To Go To Add Category</th></tr>
</table>

</body> 
          
</html>