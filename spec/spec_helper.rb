$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'capybara_select2'

require 'capybara/dsl'
include Capybara::DSL

require 'pry'
Capybara.app = Rack::File.new File.expand_path('../fixtures', __FILE__)

require 'selenium-webdriver'
require 'capybara-webkit'

require 'selenium/webdriver/firefox/options'
Capybara.register_driver :firefox_headless do |app|
  options = ::Selenium::WebDriver::Firefox::Options.new
  options.args << '--headless'

  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

Capybara.javascript_driver = :firefox_headless

Capybara.save_path = File.expand_path('../../tmp/capybara', __FILE__)

Capybara.ignore_hidden_elements = true

RSpec.configure do |config|
  config.around(:each) do |example|
    if driver = example.metadata[:driver]
      Capybara.current_driver = driver
    end

    example.run

    Capybara.use_default_driver
  end
end

Capybara::Webkit.configure do |config|
  config.allow_url("rawgit.com")
  config.allow_url("raw.githubusercontent.com")
end

require 'capybara-screenshot/rspec'
Capybara::Screenshot.autosave_on_failure = true
