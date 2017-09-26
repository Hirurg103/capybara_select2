$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'capybara_select2'

require 'capybara/dsl'
include Capybara::DSL

require 'pry'
Capybara.app = Rack::File.new File.expand_path('../fixtures', __FILE__)

require 'selenium-webdriver'
require 'capybara-webkit'
Capybara.default_driver = :selenium

require 'capybara-screenshot/rspec'
Capybara.save_path = File.expand_path('../../tmp/capybara', __FILE__)

Capybara.ignore_hidden_elements = true

include CapybaraSelect2

RSpec.configure do |config|
  config.around(:each) do |example|
    if driver = example.metadata[:driver]
      Capybara.current_driver = driver
    end

    example.run

    Capybara.use_default_driver
  end
end
