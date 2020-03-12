require 'spec_helper'

select2_version ||= ENV['SELECT2_VERSION'] || SupportedVersions.first

def open_select2(selector)
  page.execute_script "$('#{selector}').select2('open')"
end

describe CapybaraSelect2 do

  context "with select2 version #{select2_version}" do

    before { visit "/select2/v#{select2_version}/examples" }

    context 'with a single select box' do

      it 'should confirm that the page has a select2 option with a specific text' do
        open_select2('#console')
        expect(page).to have_select2_option('XBox')
      end

      it 'should confirm that there is no select2 option with a specific text' do
        open_select2('#console')
        expect(page).not_to have_select2_option('PC4')
      end

    end

    context 'witn a multi select box' do

      it 'should confirm that there is a select2 option with a specific text' do
        open_select2('#todo')
        expect(page).to have_select2_option('Buy Milk')
      end

      it 'should confirm that there is no select2 option with a specific text' do
        open_select2('#todo')
        expect(page).not_to have_select2_option('Travel to Minsk')
      end
    end

  end
end

