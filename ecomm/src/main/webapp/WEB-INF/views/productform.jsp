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
<title>Add Product</title>
</head>
<body>
<div class="container">
	<h3 align="center">Add Product</h3>
	<c:url value="/admin/saveProduct" var="url"></c:url>
       <form:form method="post" action='${url }' enctype="multipart/form-data">    
    <form:hidden path="productId"/>
        <div class="form-group">
		<form:label path="productName">Enter Product Name</form:label>
		<form:input path="productName" class="form-control" style="width:750px"/>
		<form:errors path="productName" cssStyle="color:red"></form:errors>
        </div>
        
        <div class="form-group">
		<form:label path="productDesc">Enter Product Description</form:label>
		<form:textarea path="productDesc"  class="form-control" style="width:750px"/>
        </div>
        
        <div class="form-group">
		<form:label path="quantity">Enter Quantity</form:label>
		<form:textarea path="quantity"  class="form-control" style="width:750px"/>
		<form:errors path="quantity" cssStyle="color:red"></form:errors>
        </div>
        
        <div class="form-group">
		<form:label path="price">Enter Price</form:label>
		<form:input path="price" class="form-control" style="width:750px"/>
		<form:errors path="price" cssStyle="color:red"></form:errors>
        </div>
        
        <div class="form-group">
        <form:label path="productCategory.categoryId">Select Category</form:label>  
        <form:select path="productCategory.categoryId">
        <c:forEach items="${categories }" var="c">
        <form:option value="${c.categoryId }">${c.categoryName }  ${c.categoryId }</form:option>
        </c:forEach>
        </form:select>
        </div>
        
        <div class="form-group">
		<form:label path="image">Upload Image</form:label>
		<form:input type="file" path="image"></form:input>
		</div>
		
		<input type="submit" value="Add Product">
	</form:form>
	</div>
</body> 
          
</html>