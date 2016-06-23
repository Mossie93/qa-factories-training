ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'site_prism'
require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

Capybara.configure do |config|
  config.default_driver = :selenium
  config.javascript_driver = :selenium
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers

  config.before :suite do
    Warden.test_mode!
  end

  config.before(:each, type: :feature) do
    Capybara.page.driver.browser.manage.window.maximize
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
