module CapybaraSelect2
  module Helpers
    def select2(value, options = {})
      container = if options[:xpath]
        find(:xpath, options[:xpath])
      elsif options[:css]
        find(:css, options[:css])
      else
        select_name = options[:from]
        select_id = find("label:not(.select2-offscreen)", text: select_name)[:for]

        find(:css, "#s2id_#{select_id}")
      end

      container.click

      find(
        ".select2-dropdown-open input.select2-focused," +      # v2
        ".select2-drop-active input.select2-input"             # v3
      ).set value

      find(
        ".select2-container-active .select2-highlighted," +      # v2
        ".select2-drop-active .select2-highlighted",             # v3
        text: value
      ).click
    end

  end
end
