# PDFjs

PDFjs is a Rails engine gem that integrates Mozilla’s PDF.js library into Rails applications, enabling PDF viewing and basic annotation capabilities using Importmaps. This gem provides the PDF.js assets and configuration helpers, allowing you to easily render PDFs within your Rails application without relying on Node.js.

## Installation
Add pdfjs to your application’s Gemfile:

```ruby
gem "pdfjs"
```

And then execute:
```bash
$ bundle
```

After installing, you’ll need to include the PDF.js assets in your Rails asset pipeline.

### Importmap Setup

In config/importmap.rb, add the following to register the PDF.js modules provided by the gem:

```ruby
pin "pdfjs/pdf", to: "pdfjs/pdf.min.js"
pin "pdfjs/pdf.worker", to: "pdfjs/pdf.worker.min.js"
pin "pdfjs/viewer", to: "pdfjs/viewer.js"
```

This allows you to use PDF.js in your JavaScript files without requiring Node.js.

### Asset Precompilation

If you’re using the asset pipeline with Sprockets, ensure that pdfjs assets are included in your precompiled assets by adding this line to config/initializers/assets.rb:

```ruby
Rails.application.config.assets.precompile += %w( pdfjs/pdf.min.js pdfjs/pdf.worker.min.js pdfjs/viewer.js )
```

## Usage

To display a PDF in your application, use the helper method provided by the gem. You can embed the PDF viewer within a specific view as follows:

  1.  Add a PDF Canvas: In your view file (e.g., show.html.erb), include a canvas for rendering the PDF:

  ```html
  <div id="pdf-container">
    <canvas id="pdf-canvas"></canvas>
  </div>
  ```

  2.  Initialize the PDF Viewer: Add JavaScript to load and display the PDF file. Create a JavaScript file in app/javascript (e.g., pdf_viewer.js), and use the helper to initialize the viewer:

```javascript
import { getDocument } from "pdfjs/pdf";

document.addEventListener("DOMContentLoaded", () => {
  const url = "/path/to/your.pdf"; // Adjust the path to your PDF file
  const pdfContainer = document.getElementById("pdf-container");

  getDocument(url).promise.then((pdf) => {
    pdf.getPage(1).then((page) => {
      const scale = 1.5;
      const viewport = page.getViewport({ scale: scale });

      const canvas = document.getElementById("pdf-canvas");
      const context = canvas.getContext("2d");
      canvas.height = viewport.height;
      canvas.width = viewport.width;

      const renderContext = {
        canvasContext: context,
        viewport: viewport,
      };
      page.render(renderContext);
    });
  });
});
```

  3.  Customizing the Viewer: The gem provides a basic setup, but you can customize the viewer’s features and appearance by modifying the HTML and JavaScript as needed. For advanced usage, such as annotations or additional controls, you may want to add custom scripts or extend the functionality provided by the PDF.js library.

## License

This gem includes PDF.js, which is licensed under the Apache License, Version 2.0. The full license text for PDF.js is available in `app/assets/images/pdfjs/LICENSE`, `app/assets/javascripts/pdfjs/LICENSE`, and `app/assets/stylesheets/pdfjs/LICENSE`.

The rest of the pdfjs gem is available under the [MIT License](https://opensource.org/licenses/MIT).
