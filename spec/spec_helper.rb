$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'capybara_select2'

require 'capybara/dsl'
require 'pry'
Capybara.app = Rack::File.new File.expand_path('../fixtures', __FILE__)

def travis?
  ENV['travis']
end

require 'chromedriver/helper'
require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path=Gem.bin_path("chromedriver-helper","chromedriver-helper")

Capybara.register_driver :chrome_headless do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1400,1400')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :chrome_headless
Capybara.default_driver = :chrome_headless

Capybara.save_path = File.expand_path('../../tmp/capybara', __FILE__)

Capybara.ignore_hidden_elements = true

RSpec.configure do |config|
  config.include Capybara::DSL
end

require 'capybara-screenshot/rspec'
Capybara::Screenshot.autosave_on_failure = true

if ENV['COVERAGE'] == '1'
  require 'simplecov'
  SimpleCov.start
end
