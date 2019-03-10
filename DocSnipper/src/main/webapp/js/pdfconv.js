var loadingTask = pdfjsLib.getDocument("/pdf/pdf1.pdf");
loadingTask.promise.then(
  function(pdf) {
    // Load information from the first page.
    pdf.getPage(1).then(function(page) {
      var scale = 5;
      var viewport = page.getViewport(scale);

      // Apply page dimensions to the <canvas> element.
      var canvas = document.getElementById("pdf_canvas");
      var context = canvas.getContext("2d");
      //canvas.height = viewport.height;
      //canvas.width = viewport.width;
      //canvas.width = viewport.width * window.devicePixelRatio;


      canvas.width = viewport.width;
      canvas.height = viewport.height;
      canvas.style.width = "100%";
      canvas.style.height = "100%";
      //wrapper.style.width = Math.floor(viewport.width/scale) + 'pt';
      //wrapper.style.height = Math.floor(viewport.height/scale) + 'pt';


      //canvas.styles.width = viewport.width + 'px'; // Note: The px unit is required here
      // Render the page into the <canvas> element.
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
