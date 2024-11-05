module Pdfjs
  class Engine < ::Rails::Engine
    isolate_namespace Pdfjs

    initializer "pdfjs.assets.precompile" do |app|
      app.config.assets.paths << root.join("app", "assets", "images", "pdfjs")
      app.config.assets.paths << root.join("app", "assets", "stylesheets", "pdfjs")
    end

    initializer "pdfjs.importmap", before: "importmap" do |app|
      app.config.importmap.paths << Engine.root.join("config/importmap.rb")
    end
  end
end
