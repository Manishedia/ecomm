<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
<title>Sign Up</title>
<link href='<c:url value="/resources/css/registration.css"></c:url>' rel="stylesheet">
<link href='<c:url value="/resources/css/login.css"></c:url>' rel="stylesheet">


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
			firstName:{required:"First Name is Required"},
			firstName:{required:"Last Name is Required"},
			contact:{required:"Phone Number is Required"},
			userId:{required:"User Name is Mandatory"},
			password:{required:"Password is Mandatory"}
			
		}
	})
})

</script>

</head>
<body>

<c:if test="${errorMessage!=null }">
<div align="center">
<span style="color:red">${errorMessage }</span>
</div>
</c:if>
	<div class="container">
<c:url var="url" value="/all/registerUser"></c:url>
<form:form action="${url }" id="form">
<h2 align="center"><u>Customer Details</u></h2>


			<div class="form-group">
				<form:label path="firstName">Enter First Name<form:input path="firstName" class="form-control"/>
				</form:label>
			</div>
			<div class="form-group">
				<form:label path="firstName">Enter Middle Name<form:input path="middleName" class="form-control"/>
				</form:label>
			</div>
			<div class="form-group" >
				<form:label path="lastName">Enter Last Name
				<form:input path="lastName" class="form-control"/>
				</form:label>
			</div>
			<div class="form-group" >
				<form:label path="contact">Enter Contact Number
				<form:input path="contact" class="form-control"/>
				</form:label>
			</div>
			
			<%-- <div class="form-group">
				<form:label path="shippingAddress">Enter User Address</form:label>
				<form:textarea path="shippingAddress" class="form-control"
					/>
			</div> --%>
			
			<hr>
			<h2 align="center"><u>Login credentials</u></h2>
			
			<div class="form-group">
				<form:label path="userId">Enter Username
				<form:input path="userId" class="form-control"/>
				</form:label>
			</div>
			<div class="form-group">
				<form:label path="password">Enter Password
				<form:input type="password" path="password" class="form-control"/>
				 </form:label>
			</div>

			<br>
			<button type="submit">Register</button>
		</form:form>
	</div>
</body>
</html>
