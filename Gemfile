source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '>= 5.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.7.1'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '>= 4.1.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', :platforms => :ruby

# Use Modernizr for better browser compability
gem 'modernizr-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '>= 2.3.1'

# Host CommonJS JavaScript environments in Ruby
#gem 'commonjs', '0.2.7'

# Use Rails Html Sanitizer for HTML sanitization
gem 'rails-html-sanitizer', '~> 1.0'

# For user authentication and everything else
gem 'devise', '~> 3.5.1'
gem 'responders', '~> 2.1.0'

# PostgreSQL integration
gem "pg", "~> 0.18.2"

# Twitter Bootstrap for layout
#gem "less-rails"
gem "twitter-bootstrap-rails", :git => 'https://github.com/seyhunak/twitter-bootstrap-rails.git', :branch => 'master'

# JQueryUI
gem 'jquery-ui-rails', '~> 5.0.5'

# InPlace editing
gem 'rest_in_place'

# Memcached
gem "dalli", "~> 2.7.4"

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', require: false

group :test do
  # Easier test writing
  gem "shoulda-matchers", "~> 2.8.0"

  # Test coverage
  gem 'simplecov', require: false

  gem "codeclimate-test-reporter", require: nil
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0.0'

  # Test framework
  gem 'rspec-rails', '~> 3.3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Fixtures made easy
  gem 'factory_girl_rails', '~> 4.5.0'

  # Clean test database
  gem 'database_cleaner'

  # JavaScript unit tests
  gem "konacha", "~> 3.5.1"
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
  gem 'sprockets', '~>2.12.3' # spckets 3.0.3 breaks konacha

  # Mock framework
  gem 'mocha', '~> 1.1.0'

  #deployment
  gem 'capistrano', "~>3.4.0", require: false
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm', "~>0.1.2"

  # Test coverage history
  gem 'coveralls', require: false

  # Better error interface
  gem 'better_errors'
  gem 'binding_of_caller'
end

# Acceptance tests
group :cucumber do
  gem 'cucumber', '~> 2.0.1'
  gem 'cucumber-rails'
  gem 'poltergeist', '~> 1.6.0'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
