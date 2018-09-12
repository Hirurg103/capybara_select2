require 'capybara_select2/utils'

module CapybaraSelect2
  module Helpers

    def select2(*args)
      options = args.pop
      values = args

      Utils.validate_options!(options)

      container = if options[:xpath]
        find(:xpath, options[:xpath])
      elsif options[:css]
        find(:css, options[:css])
      else
        find("label:not(.select2-offscreen)", text: options[:from])
          .find(:xpath, '..')
          .find('.select2-container')
      end

      container = if container['class'] =~ /select2-container/
        container
      else
        container.find('.select2-container')
      end

      version = Utils.detect_version(container)

      open_select = {
        '2' => ".select2-choice, .select2-search-field",
        '3' => ".select2-choice, .select2-search-field",
        '4' => ".select2-selection"
      }.fetch(version)

      search_input = {
        '2' => ".select2-dropdown-open input.select2-focused",
        '3' => ".select2-dropdown-open input.select2-input",
        '4' => ".select2-container--open input.select2-search__field"
      }.fetch(version)

      option = {
        '2' => ".select2-container-active .select2-result",
        '3' => ".select2-drop-active .select2-result",
        '4' => ".select2-results .select2-results__option"
      }.fetch(version)

      values.each do |value|
        container.find(open_select).click

        if options[:search] || options[:tag]
          find(search_input).set value
        end

        find(:xpath, '//body').find(option, text: value).click
      end
    end

  end
end
