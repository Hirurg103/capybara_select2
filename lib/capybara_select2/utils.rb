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

  end
end
