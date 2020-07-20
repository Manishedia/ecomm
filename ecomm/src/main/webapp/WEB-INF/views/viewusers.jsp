<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
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
<title>Users List</title>
</head>
<body>
<h1>User List</h1>
<table border="2" width="70%" cellpadding="2">
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Contact</th>
		<td>User Image</td>
		<td>Edit</td>
		<td>Delete</td>
	</tr>
<c:forEach var="user" items="${ulist}">
	<tr>
		<td>${user.userId}</td>
		<td>${user.userName}</td>
		<td>${user.contact}</td>
		<td><imgsrc="${pageContext.request.contextPath}/${user.userImage}"height="50" width="50"></td>
		<td><a href="editusers/${user.userId}">Edit</a></td>
		<td><a href="deleteusers/${user.userId}">Delete</a></td>
	</tr>
</c:forEach>
</table>
<br />
<a href="usersform">Add New User</a>
</body>
</html>
