<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
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
	
<title>Edit Details</title>
<link href='<c:url value="/resources/css/registration.css"></c:url>' rel="stylesheet">

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('#form').validate({
		rules:{
			firstName:{required:true},
			middleName:{required:false},
			lastName:{required:true},
			contact:{required:true,number:true,minlength:10,maxlength:10},
			userId:{required:true},
			password:{required:true,minlength:5,maxlength:20},
		},
		messages:{
			firstName:{required:"Firstname is mandatory"},
			contact:{required:"Phonenumber is required"},
			
		}
	})
})

</script>

</head>
<body>
<div class="container">
<c:url var="url" value="/all/editsave"></c:url>
<form:form action="${url }" id="form" modelAttribute="user" role="form">
<h2 align="center"><u>Edit Your Details</u></h2>

			<form:hidden path="role" />
			<form:hidden path="enabled" />
			<form:hidden path="cart.cartId" />
			<form:hidden path="userId" />
			
			<div class="form-group">
				<form:label path="firstName">Edit First Name</form:label>
				<form:input path="firstName" class="form-control"
					 />
			</div>
			
			<div class="form-group">
				<form:label path="middleName">Edit Middle Name</form:label>
				<form:input path="middleName" class="form-control"
					 />
			</div>
			
			
			<div class="form-group">
				<form:label path="lastName">Edit Last Name</form:label>
				<form:input path="lastName" class="form-control"
					 />
			</div>
			<div class="form-group">
				<form:label path="contact">Edit Contact Number</form:label>
				<form:input path="contact" class="form-control"/>
			</div>
			
			<%-- <div class="form-group">
				<form:label path="userAddress">Edit User Address</form:label>
				<form:textarea path="userAddress" class="form-control"/>
			</div>
			<hr> --%>
			
			<h2 align="center"><u>Login credentials</u></h2>
			<%-- <div class="form-group">
				<form:label path="userId">Edit Username</form:label>
				<form:input path="userId" class="form-control"  />
			</div> --%>
			<div class="form-group">
				<form:label path="password">Edit Password</form:label>
				<form:input Type="password" path="password" class="form-control"/>
			</div>

			<br>
			<button type="submit" >Update</button>
		</form:form>
	</div>
</body>
</html>
