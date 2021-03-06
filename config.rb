require 'rexml/document'
require "base64"

helpers do
  def svg_size(file)
    svg = File.read(file)
    doc = REXML::Document.new(svg)
    [doc.root.attributes['width'].to_f, doc.root.attributes['height'].to_f]    
  end

  def svg_base64(file)
    'data:image/svg+xml;base64,' + Base64.strict_encode64(File.read(file))
  end
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  # activate :livereload
end

activate :asset_hash, :ignore => [/drupaljam2016-header\.jpg/] #, exts: %w(.jpg .jpeg .png .gif .webp .js .css .otf .woff .woff2 .eot .ttf .svg .svgz .pdf)

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
