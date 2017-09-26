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

      if multiple?(container)
        container.find('.select2-input').set value
      else
        find(".select2-drop-active .select2-input").set value
      end

      find('.select2-drop-active .select2-result', text: value).click
    end

    private

    def multiple?(container)
      container[:class].include? 'select2-container-multi'
    end
  end
end
