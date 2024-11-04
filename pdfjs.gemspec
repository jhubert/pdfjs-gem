require_relative "lib/pdfjs/version"

Gem::Specification.new do |spec|
  spec.name        = "pdfjs"
  spec.version     = Pdfjs::VERSION
  spec.authors     = ["Jeremy Baker"]
  spec.email       = ["jhubert@gmail.com"]
  spec.homepage    = "https://github.com/jhubert/pdfjs-gem"
  spec.summary     = "Integrates Mozilla’s PDF.js library into Rails applications"
  spec.description = "PDFjs is a Rails engine gem that integrates Mozilla’s PDF.js library into Rails applications, enabling PDF viewing and basic annotation capabilities using Importmaps. This gem provides the PDF.js assets and configuration helpers, allowing you to easily render PDFs within your Rails application without relying on Node.js."
  spec.license     = "MIT and Apache License, Version 2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jhubert/pdfjs-gem"
  spec.metadata["changelog_uri"] = "https://github.com/jhubert/pdfjs-gem/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7"
end
