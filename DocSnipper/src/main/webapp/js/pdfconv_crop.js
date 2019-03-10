var cropper;
function loadCropperScript() {
  const image = document.getElementById('pdf_canvas');
  cropper = new Cropper(image,{
    background: false,
    autoCropArea: 0.40,
    aspectRatio: 16 / 9
  });

}

function crop() {
  var cr_canvas_data = cropper.getCroppedCanvas();
  var image_dn = cr_canvas_data.toDataURL("image/tiff").replace("image/tiff", "image/octet-stream");
  var link = document.getElementById('link_download');
  link.setAttribute('download', 'Cropped.tiff');
  link.setAttribute('href',image_dn);
  link.click();
}
