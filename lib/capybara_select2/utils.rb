module CapybaraSelect2
  module Utils

    def self.set_option_aliases(options)
      options.dup.tap { |o| o[:from] ||= o[:label] }
    end

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
        page.find(:css, "label:not(.select2-offscreen)", text: options[:from])
          .find(:xpath, '..')
          .find(:css, '.select2-container')
      end

      if container['class'] =~ /select2-container/
        container
      else
        container.find(:css, '.select2-container')
      end
    end

    def self.get_page_container_and_version(options, context)
      page = options[:page] || context.page
      container = options[:container] || find_select2_container(options, page)
      version = options[:version] || detect_select2_version(container)

      [page, container, version]
    end

  end
end
