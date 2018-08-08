module CapybaraSelect2
  module Helpers
    def select2(value, options = {})
      open_select = "" +
        ".select2-choice, .select2-choices, " +                    # v2 & v3
        ".select2-selection"                                       # v4

      search_input = "" +
        ".select2-dropdown-open input.select2-focused,"  +         # v2
        ".select2-drop-active input.select2-input,"      +         # v3
        ".select2-container--focus input.select2-search__field," + # v4 single
        ".select2-container--open input.select2-search__field"     # v4 multi

      option = "" +
        ".select2-container-active .select2-highlighted," +        # v2
        ".select2-drop-active .select2-highlighted,"      +        # v3
        ".select2-results .select2-results__option--highlighted"   # v4


      container = if options[:xpath]
        find(:xpath, options[:xpath])
      elsif options[:css]
        find(:css, options[:css])
      else
        select_name = options[:from]
        select_id = find("label:not(.select2-offscreen)", text: select_name)[:for]

        find(:css, "#s2id_#{select_id}")
      end

      container.find(open_select).click

      find(search_input).set value

      find(option, text: value).click
    end

  end
end
