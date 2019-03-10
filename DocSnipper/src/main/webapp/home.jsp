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
	<br>
	<c:if test="${not empty fn:trim(signId)}">
		
		<div id="success_text" >
			Signature Added Successfully. <br>
			Signature Id : ${signId}
		</div>
		
	</c:if>
	
	<form action="getCustomerDoc" method="post">
		
		<div class="entry_details">
			<span> Account Number </span>
			<span><input type="text" name="accNo"><span>
			
						
			<span> Sort Code </span>
			<span><input type="text" name="sortCode"></span>
			
		</div>	
		
  <div class="container">	
	<div class="row" id="actions">
		<div class="btn-group btn-group-crop btn-group-submit-div">
          <button type="submit" class="btn btn-success btn-group-submit">
            <span class="docs-tooltip">
               Fetch
            </span>
          </button>
         </div>
       </div>
      </div>
	
	</form>

</body>
</html>