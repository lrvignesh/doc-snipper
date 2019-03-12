<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/docSnipp.css">
</head>
<body>

	<div class="heading">
		<span>Document Snipper</span>
	</div>
	
	<br>
	
	<div class="function_heading">
		<span>Document Search</span>
	</div>
	
	<c:if test="${not empty fn:trim(isError) && isError == 'true' && searchType=='Doc'}">
		<div id="error_text" >
			${errorMessage}
		</div>
	</c:if>
	
	<c:if test="${not empty fn:trim(signId)}">
		<div id="success_text" >
			Signature Added Successfully <br>
			Signature Id : ${signId}
		</div>
	</c:if>
	
			
	<form action="getCustomerDoc" method="post">
		<div class="entry_details">
			<span> Account Number </span>
			<span><input type="text" name="accNo" required="required"></span>
			
			<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
						
			<span> Sort Code </span>
			<span><input type="text" name="sortCode" required="required"></span>
			
		</div>	
		<br>
  	 	<div class="actions-container">	
			<div class="btn-group btn-group-crop btn-group-submit-div">
	          <button type="submit" class="btn btn-success btn-group-submit">
	            <span class="docs-tooltip">
	               Fetch
	            </span>
	          </button>
	         </div>
      	</div>
	</form>
	
	<br>
	<br>
	
	<hr>
	
	<br>
	<br>
	
	<div class="function_heading">
		<span>Signature Search</span>
	</div>
	
	<c:if test="${not empty fn:trim(isError) && isError == 'true' && searchType=='Sign'}">
		<div id="error_text" >
			${errorMessage}
		</div>
	</c:if>
	
	<form action="getSignature" method="post">
		<div class="entry_details">
			<span> Signature Id </span>
			<span><input type="text" name="signId" required="required"></span>
		</div>	
		<br>
  	 	<div class="actions-container">	
			<div class="btn-group btn-group-crop btn-group-submit-div">
	          <button type="submit" class="btn btn-success btn-group-submit">
	            <span class="docs-tooltip">
	               Fetch
	            </span>
	          </button>
	         </div>
      	</div>
	</form>
	
	<br>
	<br>

</body>
</html>