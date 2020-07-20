<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ include file="header.jsp" %>    
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Edit Category</title>
</head>
<body>
<h1 align="center"><b>Category Edition</b></h1>
<br>
<br>
<form:form method="POST" action="/ecomm/editSaveCategory">
<table align="center">
<tr><td align="right"><b>Id   :</b></td><td><form:hidden path="categoryId" /></td></tr>
<tr><td><b>Name : </b></td><td><form:input path="categoryName" /></td>
<td><input type="submit" value="Edit Save"></td><td><input type="reset" value="Cancel"></td></tr>
</table>
</form:form>
</body> 
          
</html>