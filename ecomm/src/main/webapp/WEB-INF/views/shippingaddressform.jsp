<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  -->
<%@ include file="header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
<title>Shipping Address</title>
<link href='<c:url value="/resources/css/registration.css"></c:url>' rel="stylesheet">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('#form').validate({
		rules:{
			apartmentnumber:{required:true},
			city:{required:true},
			state:{required:true},
			country:{required:true},
			zipcode:{required:true,number:true},
		},
		messages:{
			zipcode:{required:"Zipcode must be a number"},
		}
	})
})

</script>
</head>
<body>
	<div class="container">
		<h3 align="center">Enter Shipping Address</h3>
		<c:url value="/cart/createorder" var="url"></c:url>
		<form:form method="post" action='${url }' id="form">
			
			<div class="form-group">
				<form:label path="customername">Enter Name</form:label>
				<form:input path="customername" class="form-control"  />
			</div>
			
			<div class="form-group">
				<form:label path="apartmentnumber">Apartment Name/Number</form:label>
				<form:input path="apartmentnumber" class="form-control"  />
			</div>

			<div class="form-group">
				<form:label path="streetname">Street Name</form:label>
				<form:input path="streetname" class="form-control"
					 />
			</div>
			<div class="form-group">
				<form:label path="city">Enter City</form:label>
				<form:input type="city" path="city" class="form-control"
					 />
			</div>

			<div class="form-group">
				<form:label path="state">Enter State</form:label>
				<form:input path="state" class="form-control"
					 />
			</div>
			
			<div class="form-group">
				<form:label path="country">Enter Country</form:label>
				<form:input path="country" class="form-control"
					 />
			</div>
			
			<div class="form-group">
				<form:label path="zipcode">Enter ZipCode</form:label>
				<form:input path="zipcode" class="form-control"
					 />
			</div>

			<br>
			<!--  <input type="submit" value="Confirm"></button>-->
			<button type="submit" >Confirm</button>
		</form:form>
	</div>
</body>
</html>
