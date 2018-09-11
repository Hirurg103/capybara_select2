module CapybaraSelect2
  module Helpers
    def select2(value, options = {})
      version = Config.select2_version.to_s

      open_select = {
        '2' => ".select2-choice, .select2-search-field",
        '3' => ".select2-choice, .select2-search-field",
        '4' => ".select2-selection"
      }[version]

      search_input = {
        '2' => ".select2-dropdown-open input.select2-focused",
        '3' => ".select2-dropdown-open input.select2-input",
        '4' => (
          ".select2-container--focus input.select2-search__field," + # single
          ".select2-container--open input.select2-search__field")    # multi
      }[version]

      option = {
        '2' => ".select2-container-active .select2-result",
        '3' => ".select2-drop-active .select2-result",
        '4' => ".select2-results .select2-results__option"
      }[version]

      container = if options[:xpath]
        find(:xpath, options[:xpath])
      elsif options[:css]
        find(:css, options[:css])
      else
        find("label:not(.select2-offscreen)", text: options[:from])
          .find(:xpath, '..')
          .find('.select2-container')
      end

      container.find(open_select).click

      if options[:search] || options[:tag]
        find(search_input).set value
      end

      find(option, text: value).click
    end

  end
end
