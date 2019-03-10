function base64ToArrayBuffer(base64) {
    var binaryString = window.atob(base64);
    var binaryLen = binaryString.length;
    var bytes = new Uint8Array(binaryLen);
    for (var i = 0; i < binaryLen; i++) {
       var ascii = binaryString.charCodeAt(i);
       bytes[i] = ascii;
    }
    return bytes;
 }

function saveByteArray(reportName, byte) {
    var blob = new Blob([byte], {type: "application/pdf"});
    var link = document.createElement('a');
    link.href = window.URL.createObjectURL(blob);
    var fileName = reportName;
    link.download = fileName;
    link.click();
    return blob;
}

var enc = encodedString;
var sampleArr = base64ToArrayBuffer(enc);

var loadingTask = pdfjsLib.getDocument(sampleArr);
loadingTask.promise.then(
  function(pdf) {
    pdf.getPage(1).then(function(page) {
      var scale = 5;
      var viewport = page.getViewport(scale);

      var canvas = $('#pdf_canvas')[0];
      var context = canvas.getContext("2d");

      canvas.width = viewport.width;
      canvas.height = viewport.height;
      canvas.style.width = "100%";
      canvas.style.height = "100%";

      var renderContext = {
        canvasContext: context,
        viewport: viewport
      };
      page.render(renderContext).then(function() {
        console.log("Page rendered!");
        loadCropperScript();
      });
    });

  },
  function(reason) {
    console.error(reason);
  }
);

var cropper;
function loadCropperScript() {
  const image = $('#pdf_canvas')[0];
  cropper = new Cropper(image,{
    background: false,
    preview: '.crop_preview',
    autoCropArea: 0.40,
    aspectRatio: 16 / 9
  });

}

function cropDownload() {
  var cr_canvas_data = cropper.getCroppedCanvas();
  var docName='Cropped-'+customerDocDetails.documentId+'.tiff';
  var image_dn = cr_canvas_data.toDataURL("image/tiff").replace("image/tiff", "image/octet-stream");
  $('body').append('<a id="link" href="'+image_dn+'" download="'+docName+'"></a>');
  $('#link')[0].click();
  $('#link').remove();
}

function cropSend() {

	cropper.getCroppedCanvas().toBlob((blob) => {
		  const formData = new FormData();

		  formData.append('sign', blob);
		  formData.append('accNo', customerDocDetails.accNo);
		  formData.append('sortCode', customerDocDetails.sortCode);
		  formData.append('documentId', customerDocDetails.documentId);
		  

		  $.ajax('saveSign', {
			
		    method: "POST",
		    data: formData,
		    processData: false,
		    contentType: false,
		    success: function(response) {
		      console.log('Upload success');
		      //window.open();
		      document.write(response);
		      //$("html").html(response);	
		      //$("html").html($("html", response).html());
		      //$("body").html(response);
		    },
		    error() {
		      console.log('Upload error');
		    },
		  });
		});

}

$('#zoomin').click(function(){
	cropper.zoom(0.1);
}) ;

$('#zoomout').click(function(){
	cropper.zoom(-0.1);
}) ;

$('#movel').click(function(){
	cropper.move(-10,0);
}) ;

$('#mover').click(function(){
	cropper.move(10,0);
}) ;

$('#moveu').click(function(){
	cropper.move(0,10);
}) ;


$('#moved').click(function(){
	cropper.move(0,-10);
}) ;

$('#rotatel').click(function(){
	cropper.rotate(-45);
}) ;

$('#rotater').click(function(){
	cropper.rotate(45);
}) ;

var scx = true;
var scy = true;

$('#fliph').click(function(){
	if(scx) {
		cropper.scaleX(-1);
		scx=false;
		return;
	}
	if(!scx) {
		cropper.scaleX(1);
		scx=true;
		return;
	}
}) ;

$('#flipv').click(function(){
	if(scy) {
		cropper.scaleY(-1);
		scy=false;
		return;
	}
	if(!scy) {
		cropper.scaleY(1);
		scy=true;
		return;
	}
}) ;

$('#crop').click(function(){
	cropper.crop();
}) ;

$('#clear').click(function(){
	cropper.clear();
}) ;

$('#disable').click(function(){
	cropper.disable();
}) ;

$('#enable').click(function(){
	cropper.enable();
}) ;

$('#reset').click(function(){
	cropper.reset();
}) ;

$('#cropdownload').click(cropDownload);
$('#cropsend').click(cropSend);

