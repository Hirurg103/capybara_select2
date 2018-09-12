module CapybaraSelect2
  module Utils

    def self.detect_version(container)
      if container['class'] =~ /^select2\s/
        '4'
      elsif container['id'] =~ /^s2id_/
        '3'
      else
        '2'
      end
    end

  end
end
