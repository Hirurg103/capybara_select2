require 'spec_helper'

describe "Select2 withing modal", driver: :firefox do
  before { CapybaraSelect2::Config.select2_version = 3 }

  it 'should select an option within a modal dialog' do
    visit '/select2-v3/select_within_modal.html'

    click_on 'Open todo'

    Capybara.within('#select2Modal') do
      select2 'Go to gym', css: '#multiple', search: true
    end

    expect(page).to have_css '.select2-search-choice', text: 'Go to gym'
  end

end
