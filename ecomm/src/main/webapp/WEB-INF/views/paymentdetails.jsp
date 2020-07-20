<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ include file="header.jsp" %>    
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert Shipment details</title>
</head>
<body>
<div class="container">
	<h3 align="center">Enter Shipment Address</h3>
	<c:url value="/confirmOrder" var="url"></c:url>
	
	<b>Name</b>: ${name}<br>
<b>Total Bill</b>: ${totalBill}<br>
       <form:form method="post" action='${url }' modelAttribute="orderD" role="form">    
    
        <div class="form-group">
		<form:label path="orderDetailsAddress">Enter Address</form:label>
		<form:input path="orderDetailsAddress" class="form-control" style="width:750px"/>
        </div>
      
		<input type="submit" value="Confirm Order">
	</form:form>
	</div>
</body> 
          
</html>
        