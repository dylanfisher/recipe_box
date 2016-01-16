source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.6'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Puma as the app server
gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'devise'
gem 'pundit'

gem 'simple_form'

gem 'paperclip', '~> 4.3'

gem 'cocoon'

gem 'friendly_id', '~> 5.1.0'

# PDF generation
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

gem 'pry-rails'

group :development do
  # Mutes assets pipeline log messages https://github.com/evrone/quiet_assets
  gem 'quiet_assets'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Guard is a command line tool to easily handle events on file system modifications. http://guardgem.org
  gem 'guard'
  gem 'guard-livereload', '~> 2.4', require: false

  # Rails generator which allows to scaffold admin controllers, views with proper (non-namespaced) models, helpers, tests and routes
  # 1. Generate model: bin/rails g model Post title:string content:text
  # 2. Create admin scaffold: bin/rails g admin:scaffold_controller Post title content --parent_controller=admin
  gem 'rails-admin-scaffold'
end

group :production, :test do
  gem 'rails_12factor'
end
