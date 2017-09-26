module CapybaraSelect2
  module Helpers
    def select2(value, options = {})
      container = if options[:xpath]
        find(:xpath, options[:xpath])
      elsif options[:css]
        find(:css, options[:css])
      else
        select_name = options[:from]

        find("label.select2-offscreen", text: select_name).find(:xpath, '..')
      end

      container.click

      find('.select2-drop-active .select2-input').set value
      find('.select2-drop-active .select2-result-label', text: value).click
    end
  end
end
