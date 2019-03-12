<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Document Details</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/docSnipp.css">
<link rel="stylesheet" href="/css/cropper.css" >
<link rel="stylesheet" href="/css/main.css" > 

<script src="/js/pdf.js"></script> 
<script src="/js/cropper.js"></script>
<script src="/js/jquery.min.js" ></script>
<script src=/js/ToProgress.min.js></script>


</head>
<body>
	
	<div class="heading">
		<span>Document Snipper</span>
	</div>
	<br>
	<div id="progress"></div>
	<br>
	<div class="entry_details">
			<span> Account Number </span>
			<span><input type="text" name="accNo" value="${customerDocDetails.accNo}" disabled="disabled"></span>

			<span> Sort Code </span>
			<span><input type="text" name="sortCode" value="${customerDocDetails.sortCode}" disabled="disabled"></span>
	</div>
	<br>
	<div class="entry_details">
			<span> Document Id </span>
			<span><input type="text" name="documentId" value="${customerDocDetails.documentId}" disabled="disabled"></span>
	</div>
	<br>
	
	
	  <div id="canvas_div">
        <canvas id="pdf_canvas">
        </canvas>
      </div>
      
      <div class="crop_preview"></div>
      
      <br>
	
   <div class="actions-container">	
	<div class="row" id="actions">
      <div class="col-md-9 docs-buttons">
		 
		  <div class="btn-group">
	          <button type="button" class="btn btn-primary" id="zoomin">
	            <span class="docs-tooltip">
	              <span class="fa fa-search-plus"></span>
	            </span>
	          </button>
	          <button type="button" class="btn btn-primary" id="zoomout">
	            <span class="docs-tooltip">
	              <span class="fa fa-search-minus"></span>
	            </span>
	          </button>
	        </div>
	        
	      <div class="btn-group">
	          <button type="button" class="btn btn-primary" id="movel">
	            <span class="docs-tooltip">
	              <span class="fa fa-arrow-left"></span>
	            </span>
	          </button>
	          <button type="button" class="btn btn-primary" id="mover">
	            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.move(10, 0)">
	              <span class="fa fa-arrow-right"></span>
	            </span>
	          </button>
	          <button type="button" class="btn btn-primary" id="moveu">
	            <span class="docs-tooltip">
	              <span class="fa fa-arrow-up"></span>
	            </span>
	          </button>
	          <button type="button" class="btn btn-primary" id="moved">
	            <span class="docs-tooltip">
	              <span class="fa fa-arrow-down"></span>
	            </span>
	          </button>
        </div>
        
        <div class="btn-group">
          <button type="button" class="btn btn-primary" id="rotatel">
           <span class="docs-tooltip">
              <span class="fa fa-rotate-left"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" id="rotater">
            <span class="docs-tooltip">
              <span class="fa fa-rotate-right"></span>
            </span>
          </button>
        </div>

        <div class="btn-group">
          <button type="button" class="btn btn-primary" id="fliph">
            <span class="docs-tooltip">
              <span class="fa fa-arrows-h"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" id="flipv">
            <span class="docs-tooltip">
              <span class="fa fa-arrows-v"></span>
            </span>
          </button>
        </div>
        
        <div class="btn-group">
          <button type="button" class="btn btn-primary" id="crop">
           <span class="docs-tooltip">
              <span class="fa fa-check"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" id="clear">
            <span class="docs-tooltip">
              <span class="fa fa-remove"></span>
            </span>
          </button>
        </div>

        <div class="btn-group">
          <button type="button" class="btn btn-primary" id="disable">
            <span class="docs-tooltip">
              <span class="fa fa-lock"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" id="enable">
            <span class="docs-tooltip">
              <span class="fa fa-unlock"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" id="reset">
            <span class="docs-tooltip">
              <span class="fa fa-refresh"></span>
            </span>
          </button>
        </div>
	        
       </div>
    </div>
   </div>
   
   <div class="actions-container">	
	<div class="row" id="actions">
		<div class="btn-group btn-group-crop">
          <button type="button" class="btn btn-success btn-crop-action" id="cropdownload">
            <span class="docs-tooltip">
               Crop & Download
            </span>
          </button>
         </div>
        
     	<div class="btn-group btn-group-crop">
          <button type="button" class="btn btn-success btn-crop-action" id="cropsend">
            <span class="docs-tooltip">
               Crop & Send
            </span>
          </button>
         </div>
     </div>  
    </div>
	
	<script>
		var encodedString = "${encodedString}";
		var customerDocDetails = [];
		customerDocDetails.accNo = ${customerDocDetails.accNo};
		customerDocDetails.sortCode = ${customerDocDetails.sortCode};
		customerDocDetails.documentId = "${customerDocDetails.documentId}";
	</script>
	
	<script src="/js/docSnipp.js"></script>
	
</body>
</html>