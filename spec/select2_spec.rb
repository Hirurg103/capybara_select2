require 'spec_helper'

describe CapybaraSelect2 do

  it 'should be able to select several options at once', driver: :firefox do
    visit '/select2-v3/index.html'

    select2 'Buy Milk', 'Go to gym', css: '#multiple'

    expect(page).to have_css '.select2-search-choice', text: 'Buy Milk'
    expect(page).to have_css '.select2-search-choice', text: 'Go to gym'
  end

end
