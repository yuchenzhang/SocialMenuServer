source 'http://rubygems.org'

gem "rails", "3.2.0"
gem "passenger"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'mysql2'
gem 'pg', :group => [:production, :development,:test]
gem 'sass'
gem 'devise'
gem "oa-oauth", :require => "omniauth/oauth"
gem 'haml'
gem 'haml-rails'
gem 'fb_graph'
gem 'settingslogic'
gem 'uuid'
gem 'google-qr'
gem "barista"
gem "rspec"
gem "rspec-rails"
gem "paperclip", "~> 3.0"
gem "rmagick"
gem "rabl"
gem "yajl-ruby"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', ">= 1.0.3"
end 

gem 'jquery-rails'

group :development, :test do
  gem 'factory_girl',       '2.0.2'      # 2.0.3 breaks loading factories with a Duplication Error  
end

group :test do
  gem "spork", "~> 0.9.0.rc"
  gem "simplecov" 
  gem "database_cleaner"
  gem "shoulda-matchers"
end


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

# gem "paperclip", "~> 2.3" 
