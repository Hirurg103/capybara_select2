require 'spec_helper'

describe CapybaraSelect2 do

  it 'should be able to select several options at once' do
    visit '/select2-v3/index.html'

    select2 'Buy Milk', 'Go to gym', css: '#multiple'

    expect(page).to have_css '.select2-search-choice', text: 'Buy Milk'
    expect(page).to have_css '.select2-search-choice', text: 'Go to gym'
  end

  context 'when no options are specified' do
    it 'should raise error that user must specify :css, :xpath or :from options' do
      visit '/select2-v3/index.html'

      expect {
        select2 'Buy Milk'
      }.to raise_error "Please specify :css, :xpath or :from in options"
    end

  end

end
