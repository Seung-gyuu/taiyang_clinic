
function openPdfPopup(url) {
  // Show the popup container
  var popupContainer = document.getElementById('pdfPopup');
  popupContainer.style.display = 'block';

  // Load the PDF using pdf.js
  var pdfViewer = document.getElementById('pdfViewer');
  pdfjsLib.getDocument(url).promise.then(function (pdf) {
    var totalPages = pdf.numPages;
    var renderedPages = 0; // Counter for rendered pages
    var renderedCanvasArray = []; // Array to store rendered canvas elements

    // Helper function to render a page
    function renderPage(pageNumber) {
      pdf.getPage(pageNumber).then(function (page) {
        var viewport = page.getViewport({ scale: 1.0 });
        var canvas = document.createElement('canvas');
        var context = canvas.getContext('2d');
        canvas.height = viewport.height;
        canvas.width = viewport.width;

        var renderContext = {
          canvasContext: context,
          viewport: viewport
        };

        page.render(renderContext).promise.then(function () {
          // Push the rendered canvas into the array
          renderedCanvasArray.push({ pageNumber: pageNumber, canvas: canvas });

          renderedPages++; // Increment the counter

          // Check if all pages have been rendered
          if (renderedPages === totalPages) {
            // Sort the rendered canvas array by page number
            renderedCanvasArray.sort(function (a, b) {
              return a.pageNumber - b.pageNumber;
            });

            // Append the sorted canvas elements to the PDF viewer
            renderedCanvasArray.forEach(function (renderedPage) {
              pdfViewer.appendChild(renderedPage.canvas);
            });

            // Scroll to the first page
            pdfViewer.scrollTo(0, 0);
          }
        });
      });
    }

    // Render pages in ascending order starting from page 1
    for (var pageNumber = 1; pageNumber <= totalPages; pageNumber++) {
      renderPage(pageNumber);
    }
  });

    document.addEventListener('click', closePopupOnClickOutside);
}
function closePopupOnClickOutside(event) {
    var popupContainer = document.getElementById('popup-content');
    
    if (popupContainer.contains(event.target)) {
        var popupContainer = document.getElementById('pdfPopup');
        popupContainer.style.display = 'none';
        document.removeEventListener('click',closePopupOnClickOutside);
        var pdfViewer = document.getElementById('pdfViewer');
        while (pdfViewer.firstChild) {
            pdfViewer.removeChild(pdfViewer.firstChild);
        }
    }
}
function closePopup() {
    // Hide the popup container
    var popupContainer = document.getElementById('pdfPopup');
    popupContainer.style.display = 'none';
    var pdfViewer = document.getElementById('pdfViewer');
    while (pdfViewer.firstChild) {
        pdfViewer.removeChild(pdfViewer.firstChild);
    }
}
