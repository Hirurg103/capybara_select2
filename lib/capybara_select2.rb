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
    options_with_select2_details =
      options.merge({ container: container, version: version, page: page })

    values.each do |value|
      Helpers.select2_open(options_with_select2_details)

      if options[:search] || options[:tag]
        term = options[:search].is_a?(String) ? options[:search] : value
        Helpers.select2_search(term, options_with_select2_details)
      end

      Helpers.select2_select(value, options_with_select2_details)
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
