require 'spec_helper'
require 'capybara_select2/helpers'

select2_version ||= ENV['SELECT2_VERSION'] || SupportedVersions.first

def get_values(selector)
  page.evaluate_script "$('#{selector}').select2('val')"
end
alias :get_value :get_values

describe CapybaraSelect2 do

  include CapybaraSelect2::Helpers

  context "with select2 version #{select2_version}", type: :feature do

    before { visit "/select2/v#{select2_version}/examples" }

    context 'with a single select box' do

      it 'should open select2 control' do
        select2_open label: 'game console'
        expect(page).to have_css '.select2-results', text: 'XBox'
      end

      it 'should close select2 control' do
        select2_open label: 'game console'

        select2_close
        expect(page).not_to have_css '.select2-results', text: 'XBox'
      end

      it 'should type into a select2 search field' do
        select2_open label: 'game console'

        select2_search 'box', label: 'game console'
        expect(page).not_to have_css '.select2-results', text: 'Wii'
      end

      it 'should select an option from an opened select2 control' do
        select2_open label: 'game console'

        select2_select 'XBox', from: 'game console'
        expect(get_value('#console')).to eq 'xbox'
      end

      xit 'should clear selected options' do
        select2_open label: 'game console'

        select2_select 'XBox', from: 'game console'
        select2_clear label: 'game console'
        expect(get_value('#console')).to eq ''
      end
    end

    context 'witn a multi select box' do

      it 'should open select control' do
        select2_open css: '#multiple'
        expect(page).to have_css '.select2-results', text: 'Go to gym'
      end

      it 'should close select control' do
        select2_open css: '#multiple'

        select2_close
        expect(page).not_to have_css '.select2-results', text: 'Go to gym'
      end

      it 'should type into a select2 search field' do
        select2_open css: '#multiple'

        select2_search 'Go to gym', css: '#multiple'
        expect(page).not_to have_css '.select2-results', text: 'Buy Milk'
      end

      it 'should select an option from an opened select2 control' do
        select2_open css: '#multiple'

        select2_select 'Go to gym', css: '#multiple'
        expect(get_values('#todo')).to eq ['go to gym']
      end

      it 'should clear selected options' do
        select2_open css: '#multiple'

        select2_select 'Go to gym', css: '#multiple'
        select2_clear css: '#multiple'

        expect(get_values('#todo')).to eq([]).or eq(nil)
      end
    end
  end
end
