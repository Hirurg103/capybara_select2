require 'capybara_select2/utils'
require 'capybara_select2/selectors'

module CapybaraSelect2
  module Helpers

    def select2(*args)
      options = args.pop
      values = args

      Utils.validate_options!(options)

      select2_container = Utils.find_select2_container(options, page)
      select2_version = Utils.detect_select2_version(select2_container)

      opener_selector = Selectors.opener_selector(select2_version)
      option_selector = Selectors.option_selector(select2_version)

      values.each do |value|
        select2_container.find(:css, opener_selector).click

        if options[:search] || options[:tag]
          search_input_selector = Selectors.search_input_selector(select2_version)
          find(:xpath, '//body').find(:css, search_input_selector).set value
        end

        find_options = { text: value }
        find_options[:match] = options[:match] if options[:match]
        find(:xpath, '//body').find(:css, option_selector, find_options).click
      end
    end

  end
end
