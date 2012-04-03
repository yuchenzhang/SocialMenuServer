
require 'rubygems'
require 'spork'

ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However, 
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  require 'simplecov'
  SimpleCov.command_name "RSpec"
  SimpleCov.coverage_dir 'coverage/'
  SimpleCov.start 'rails'

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  require File.expand_path("../../config/environment", __FILE__)
  #Spork.trap_method(Rails::Application::RoutesReloader, :reload!)

  require 'rspec/rails'

  require 'database_cleaner'
  require File.dirname(__FILE__) + '/../lib/patches/database_cleaner_activerecord_base'

  DatabaseCleaner[:active_record, :model => '::ActiveRecord::Base']
  DatabaseCleaner.strategy = :transaction


  RSpec.configure do |config|              
    config.include Factory::Syntax::Methods
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
  end

end

Spork.each_run do
  # This code will be run each time you run your specs.
  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  # load factories
  Dir["#{Rails.root}/spec/factories/*.rb"].each {|f| require f}

end

