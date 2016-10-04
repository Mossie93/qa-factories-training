ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'ffaker'
require 'spec_helper'
require 'rspec/rails'
require 'site_prism'
require 'capybara'
require 'capybara/rspec'
require 'capybara-webkit'
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

  case ENV['BROWSER']
  when 'chrome'
    Capybara.register_driver :chrome do |app|
      Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        desired_capabilities: { "chromeOptions" => { "args" => %w{ window-size=1024,768 } } }
      )
    end
    Capybara::Screenshot.register_driver(:chrome) do |driver, path|
      driver.browser.save_screenshot(path)
    end
    Capybara.javascript_driver = :chrome
  when 'firefox'
    Capybara.register_driver :selenium do |app, path|
      profile = Selenium::WebDriver::Firefox::Profile.new
      Capybara::Selenium::Driver.new(app, browser: :firefox, profile: profile)
    end
    Capybara::Screenshot.register_driver(:firefox) do |driver, path|
      driver.browser.save_screenshot(path)
    end
  else
    Capybara.javascript_driver = :webkit
    Capybara::Webkit.configure do |config|
      config.block_unknown_urls
    end
  end
end
