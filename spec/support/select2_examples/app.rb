require 'sinatra/base'

module Select2Examples
  class App < Sinatra::Base

    def self.boot
      instance = new
      Capybara::Server.new(instance).tap { |server| server.boot }
    end

    get '/select2/v:version/examples' do
      select2_version = params['version']
      ERB.new(File.read(File.join(__dir__, 'index.html.erb'))).result(binding)
    end

  end
end
