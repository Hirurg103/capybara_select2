require 'capybara_select2/utils'
require 'capybara_select2/selectors'

module CapybaraSelect2
  module Helpers
    module_function

    def select2_open(options)
      options = Utils.set_option_aliases(options)
      Utils.validate_options!(options)

      _, container, version = Utils.get_page_container_and_version(options, self)
      opener_selector = Selectors.opener_selector(version)

      container.find(:css, opener_selector).click
    end

    def select2_close(options = {})
      page.find(:css, 'body').click
    end

    def select2_search(text, options)
      options = Utils.set_option_aliases(options)
      Utils.validate_options!(options)

      page, _, version = Utils.get_page_container_and_version(options, self)
      search_input_selector = Selectors.search_input_selector(version)

      page.find(:xpath, '//body').find(:css, search_input_selector).set text
    end

    def select2_select(value, options)
      Utils.validate_options!(options)

      page, _, version = Utils.get_page_container_and_version(options, self)
      option_selector = Selectors.option_selector(version)

      find_options = options.select { |k, _| [:match, :exact_text].include?(k) }
      find_options = find_options.merge(text: value)

      page.find(:xpath, '//body').find(:css, option_selector, find_options).click
    end

    def select2_clear(options)
      options = Utils.set_option_aliases(options)
      Utils.validate_options!(options)

      _, container, version = Utils.get_page_container_and_version(options, self)
      remove_option_selector = Selectors.remove_option_selector(version)

      container.all(remove_option_selector).map(&:click)
    end

  end
end
