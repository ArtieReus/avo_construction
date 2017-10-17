# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# activate :autoprefixer do |prefix|
#   prefix.browsers = "last 2 versions"
# end

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# General configuration
activate :i18n, :mount_at_root => :es, :langs => [:es,:en]
activate :sprockets

# Methods defined in the helpers block are available in templates
helpers do
  def local_path(path)
    if I18n.locale.to_s == "es"
      "/#{path}"
    else
      "/#{I18n.locale.to_s}/#{path}"
    end
  end
end

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

set :fonts_dir,  'fonts'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Since project pages deploy to a subdirectory, assets and page paths are relative to the organization or
  # user that owns the repo. If you're treating the project pages as a standalone site, you can tell
  # Middleman to generate relative paths for assets and links with these settings in the build configuration in config.rb
  # set :http_prefix, "/avo_construction      /"
end
