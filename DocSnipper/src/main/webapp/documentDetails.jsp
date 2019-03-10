<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Document Details</title>
<script src="/js/pdf.js"></script>
<script src="/js/cropper.js"></script>
<link href="/css/cropper.css" rel="stylesheet" >
<link href="/css/main.css" rel="stylesheet" >
<script src="/js/jquery.min.js" ></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/docSnipp.css">


</head>
<body>
	
	<div class="heading">
		<span>Document Snipper</span>
	</div>
	
	<br>
	
	<div class="entry_details">
			<span> Account Number </span>
			<span><input type="text" name="accNo" value="${customerDocDetails.accNo}" disabled="disabled"><span>
			
						
			<span> Sort Code </span>
			<span><input type="text" name="sortCode" value="${customerDocDetails.accNo}" disabled="disabled"></span>
	</div>
	
	<br>
	
	<div class="entry_details">
			<span> Document Id </span>
			<span><input type="text" name="documentId" value="${customerDocDetails.documentId}" disabled="disabled"></span>
	</div>
	
	<p>Document</p>
	
	  <div id="canvas_div">
        <canvas id="pdf_canvas" style="border:2px solid black">
        </canvas>
      </div>
      
      <div class="crop_preview">
      
      </div>
      
      <br>
	
	
   <div class="container">	
	<div class="row" id="actions">
      <div class="col-md-9 docs-buttons">
		 
		  <div class="btn-group">
	          <button type="button" class="btn btn-primary" data-method="zoom" data-option="0.1" title="Zoom In" id="zoomin">
	            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.zoom(0.1)">
	              <span class="fa fa-search-plus"></span>
	            </span>
	          </button>
	          <button type="button" class="btn btn-primary" data-method="zoom" data-option="-0.1" title="Zoom Out" id="zoomout">
	            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.zoom(-0.1)">
	              <span class="fa fa-search-minus"></span>
	            </span>
	          </button>
	        </div>
	        
	      <div class="btn-group">
	          <button type="button" class="btn btn-primary" data-method="move" data-option="-10" data-second-option="0" title="Move Left" id="movel">
	            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.move(-10, 0)">
	              <span class="fa fa-arrow-left"></span>
	            </span>
	          </button>
	          <button type="button" class="btn btn-primary" data-method="move" data-option="10" data-second-option="0" title="Move Right" id="mover">
	            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.move(10, 0)">
	              <span class="fa fa-arrow-right"></span>
	            </span>
	          </button>
	          <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="-10" title="Move Up" id="moveu">
	            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.move(0, -10)">
	              <span class="fa fa-arrow-up"></span>
	            </span>
	          </button>
	          <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="10" title="Move Down" id="moved">
	            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.move(0, 10)">
	              <span class="fa fa-arrow-down"></span>
	            </span>
	          </button>
        </div>
        
        <div class="btn-group">
          <button type="button" class="btn btn-primary" data-method="rotate" data-option="-45" title="Rotate Left" id="rotatel">
            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.rotate(-45)">
              <span class="fa fa-rotate-left"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="rotate" data-option="45" title="Rotate Right" id="rotater">
            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.rotate(45)">
              <span class="fa fa-rotate-right"></span>
            </span>
          </button>
        </div>

        <div class="btn-group">
          <button type="button" class="btn btn-primary" data-method="scaleX" data-option="-1" title="Flip Horizontal" id="fliph">
            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.scaleX(-1)">
              <span class="fa fa-arrows-h"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="scaleY" data-option="-1" title="Flip Vertical" id="flipv">
            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.scaleY(-1)">
              <span class="fa fa-arrows-v"></span>
            </span>
          </button>
        </div>
        
        <div class="btn-group">
          <button type="button" class="btn btn-primary" data-method="crop" title="Crop" id="crop">
            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.crop()">
              <span class="fa fa-check"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="clear" title="Clear" id="clear">
            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.clear()">
              <span class="fa fa-remove"></span>
            </span>
          </button>
        </div>

        <div class="btn-group">
          <button type="button" class="btn btn-primary" data-method="disable" title="Disable" id="disable">
            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.disable()">
              <span class="fa fa-lock"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="enable" title="Enable" id="enable">
            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.enable()">
              <span class="fa fa-unlock"></span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" data-method="reset" title="Reset" id="reset">
            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.reset()">
              <span class="fa fa-refresh"></span>
            </span>
          </button>
        </div>
	        
       </div>
    </div>
   </div>
   
   <div class="container">	
	<div class="row" id="actions">
		<div class="btn-group btn-group-crop">
          <button type="button" class="btn btn-success" data-method="getCroppedCanvas" data-option="" id="cropdownload">
            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.getCroppedCanvas()">
               Crop & Download
            </span>
          </button>
         </div>
        
     	<div class="btn-group btn-group-crop">
          <button type="button" class="btn btn-success" data-method="getCroppedCanvas" data-option="" id="cropsend">
            <span class="docs-tooltip" data-toggle="tooltip" title="cropper.getCroppedCanvas()">
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
		customerDocDetails.documentId = ${customerDocDetails.documentId};
	</script>
	
	<script src="/js/docSnipp.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
  	<script src="https://fengyuanchen.github.io/js/common.js"></script>
	
</body>
</html>