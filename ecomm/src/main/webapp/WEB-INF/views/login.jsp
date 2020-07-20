<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="header.jsp"%>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Login Page</title>
<link href='<c:url value="/resources/css/login.css"></c:url>' rel="stylesheet">
</head>
<body>
	<h1 align="center"><u>Enter Login Details</u></h1>
	<div id="login-box">
	<c:if test="${error!=null }">
<div  class="loginerror" > <!--  invalid credentials -->
<span >${error }</span>
</div>
</c:if>
<c:if test="${msg!=null }">
<div class="msg" ><!--  loggedout successfully -->
<span>${msg }</span>
</div>
</c:if>

	<form action="<c:url value='/j_spring_security_check'></c:url>" method="post">
		<table align="center">
			<tr>
				<td>Enter Username &nbsp;</td>
				<td style="padding-right:10px"><input type="text" name="username"></td>
			</tr>
			</table>
			<br>
			<table align="center">
			<tr>
				<td>Enter Password &nbsp;</td>
				<td style="padding-right:10px"><input type="password" name="password"></td>
			</tr>
			<tr>
			<td><input type="submit" value="Submit" align="center"></td>
			</tr>
		</table>
	</form>
	
	</div>
</body>
</html>