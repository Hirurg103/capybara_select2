require 'rspec/expectations'
require 'capybara_select2/selectors'

RSpec::Matchers.define :have_select2_option do |expected|
  def option_matcher(element)
    select2_container = element.find('.select2-container', match: :first)

    select2_version = CapybaraSelect2::Utils.detect_select2_version(select2_container)

    CapybaraSelect2::Selectors.option_selector(select2_version)
  end

  match do |element|
    expect(element).to have_css option_matcher(element), text: expected
  end

  match_when_negated do |element|
    expect(element).not_to have_css option_matcher(element), text: expected
  end
end
