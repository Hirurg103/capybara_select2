module CapybaraSelect2
  module Utils

    def self.detect_select2_version(container)
      if container['class'] =~ /^select2\s/
        '4'
      elsif container['id'] =~ /^s2id_/
        '3'
      else
        '2'
      end
    end

    def self.validate_options!(options)
      unless options.is_a?(Hash) && [:css, :xpath, :from].any? { |k| options.key?(k) }
        fail ArgumentError.new("Please specify :css, :xpath or :from in options")
      end
    end

    def self.find_select2_container(options, page)
      container = if options[:xpath]
        page.find(:xpath, options[:xpath])
      elsif options[:css]
        page.find(:css, options[:css])
      else
        page.find("label:not(.select2-offscreen)", text: options[:from])
          .find(:xpath, '..')
          .find(:css, '.select2-container')
      end

      if container['class'] =~ /select2-container/
        container
      else
        container.find(:css, '.select2-container')
      end
    end

  end
end
