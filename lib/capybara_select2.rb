require "capybara_select2/version"
require 'capybara_select2/helpers'
require 'capybara_select2/config'

module CapybaraSelect2
  include Helpers
end

if defined?(RSpec)
  RSpec.configure do |config|
    config.include CapybaraSelect2
  end
end

if respond_to?(:World)
  World(CapybaraSelect2)
end
