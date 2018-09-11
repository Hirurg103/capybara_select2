module CapybaraSelect2

  def self.configure
    yield Config
  end

  class Config
    class << self
      attr_accessor :select2_version
    end
  end

  Config.select2_version ||= 4

end
