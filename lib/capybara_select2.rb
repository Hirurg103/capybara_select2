require "capybara_select2/version"
require 'capybara_select2/utils'
require 'capybara_select2/helpers'

module CapybaraSelect2

  def select2(*args)
    options = args.pop
    values = args

    Utils.validate_options!(options)

    container = Utils.find_select2_container(options, page)
    version = Utils.detect_select2_version(container)
    extended_options = options.merge({ container: container, version: version, page: page })

    values.each do |value|
      Helpers.select2_open(extended_options)

      if options[:search] || options[:tag]
        term = options[:search].is_a?(String) ? options[:search] : value
        Helpers.select2_search(term, extended_options)
      end

      Helpers.select2_select(value, extended_options)
    end
  end

end

if defined?(RSpec)
  require 'rspec/core'
  require 'capybara_select2/rspec/matchers'

  RSpec.configure do |config|
    config.include CapybaraSelect2
  end
end

if respond_to?(:World)
  World(CapybaraSelect2)
end
