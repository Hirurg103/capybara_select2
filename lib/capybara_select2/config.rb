module CapybaraSelect2

  def self.configure
    yield Config
  end

  class Config
    class << self
      attr_accessor :version
    end
  end

  Config.version ||= 4

end
