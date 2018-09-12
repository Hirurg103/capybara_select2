# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara_select2/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara-select-2"
  spec.version       = CapybaraSelect2::VERSION
  spec.authors       = ["Dzmitry Kavalionak"]
  spec.email         = ["dzm.kov@gmail.com"]

  spec.summary       = %q{Capybara helpers for https://select2.org select box (supports Select2 versions 2/3/4)}
  spec.homepage      = "https://github.com/Hirurg103/capybara_select2"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "capybara", "~> 3.5"
  spec.add_development_dependency "selenium-webdriver", "~> 3.5"
  spec.add_development_dependency "capybara-screenshot" , "~> 1.0"
  spec.add_development_dependency "capybara-webkit", "~> 1.15"
  spec.add_development_dependency "puma", "~> 3.12"
  spec.add_development_dependency "pry", "~> 0.11.0"
end
