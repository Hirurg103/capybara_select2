$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'capybara_select2'

require 'capybara/dsl'
require 'pry'

Dir[File.join(__dir__, "support/**/*.rb")].sort.each { |f| require f }

server = Select2Examples::App.boot
Capybara.app_host = "http://#{server.host}:#{server.port}"

require 'selenium-webdriver'
require 'webdrivers/chromedriver'

Capybara.register_driver :selenium_chrome_headless do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1400,1400')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :selenium_chrome_headless
Capybara.default_driver = :selenium_chrome_headless

Capybara.ignore_hidden_elements = true

RSpec.configure do |config|
  config.include Capybara::DSL
  config.exclude_pattern = "shared/**/*_spec.rb"
end

require 'capybara-screenshot/rspec'
Capybara.save_path = 'tmp/capybara'
Capybara::Screenshot.instance_variable_set(
  :@capybara_root,
  File.expand_path(File.join(__dir__, '..', Capybara.save_path))
)

if ENV['COVERAGE'] == '1'
  require 'simplecov'
  SimpleCov.start
end

SupportedVersions = [
  '2.1.0',
  '3.5.4',
  '4.0.5',
  '4.0.12'
].freeze
