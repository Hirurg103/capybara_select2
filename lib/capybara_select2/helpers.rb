module CapybaraSelect2
  module Helpers
    def select2(value, options = {})
      open_select = "" +
        ".select2-choice, .select2-choices, " +                    # v2 & v3
        ".select2-selection"                                       # v4

      search_input = "" +
        ".select2-dropdown-open input.select2-focused," +          # v2
        ".select2-drop-active input.select2-input," +              # v3
        ".select2-container--focus input.select2-search__field," + # v4 single
        ".select2-container--open input.select2-search__field"     # v4 multi

      option = "" +
        ".select2-container-active .select2-result," +             # v2
        ".select2-drop-active .select2-result," +                  # v3
        ".select2-results .select2-results__option"                # v4


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

      if options[:search]
        find(search_input).set value
      end

      find(option, text: value).click
    end

  end
end
