require 'spec_helper'

select2_version ||= ENV['VERSION'] || 2

def get_values(selector)
  page.evaluate_script "$('#{selector}').select2('val')"
end
alias :get_value :get_values

describe CapybaraSelect2 do

  context "with select2 version #{select2_version}" do

    before { visit "/select2-v#{select2_version}/index.html" }

    it "should select several options at once" do
      select2 'Buy Milk', 'Go to gym', css: '#multiple'
      expect(get_values('#todo')).to eql ['buy milk', 'go to gym']
    end

    context 'when no options are specified' do

      it 'should raise error that user must specify :css, :xpath or :from options' do
        expect {
          select2 'Buy Milk'
        }.to raise_error "Please specify :css, :xpath or :from in options"
      end

    end

    context 'with a single select box' do

      it 'should select an option from a select found by an XPath selector' do
        select2 'XBox', xpath: "//div[@id='single']"
        expect(get_value('#console')).to eql 'xbox'
      end

      it 'should select an option from a select found by a CSS selector' do
        select2 'XBox', css: '#single'
        expect(get_value('#console')).to eql 'xbox'
      end

      it 'should select an option from a select found by a label' do
        select2 'XBox', from: 'Select game console'
        expect(get_value('#console')).to eql 'xbox'
      end

      context 'searching for an option' do

        it 'should select an option from the search results' do
          select2 'Wii', css: '#single', search: true
          expect(get_value('#console')).to eql 'wii'
        end

        it 'should select the first matched option from the search results' do
          select2 'PlayStation', css: '#single', search: true, match: :first
          expect(get_value('#console')).to eql 'playstation 3'
        end

        it 'should select an option by exact text from the search results' do
          select2 'PlayStation', css: '#single', search: true, exact_text: true
          expect(get_value('#console')).to eql 'playstation'
        end

        it 'should select an option within the context of a parent element' do
          within '#single' do
            select2 'Wii', css: '.select2-container', search: true
          end
          expect(get_value('#console')).to eql 'wii'
        end

      end
    end

    context 'with a grouped select box' do

      it 'should select an option from the grouped select box' do
        select2 'Big Boom Wooh', css: '#grouped'
        expect(get_values('#movie')).to eql 'Big Boom Wooh'
      end

    end

    context 'witn a multi select box' do

      it 'should select an option from a select found by an XPath selector' do
        select2 'Buy Milk', xpath: "//div[@id='multiple']"
        expect(get_values('#todo')).to eql ['buy milk']
      end

      it 'should select an option from a select found by a CSS selector' do
        select2 'Buy Milk', css: '#multiple'
        expect(get_values('#todo')).to eql ['buy milk']
      end

      it 'should select an option from a select found by a label' do
        select2 'Buy Milk', from: 'Things to do'
        expect(get_values('#todo')).to eql ['buy milk']
      end

      it 'should select a new option from a select with already selected option' do
        select2 'Buy Milk', css: '#multiple', search: true
        select2 'See Malaysia', css: '#multiple', search: true

        expect(get_values('#todo')).to eql ['buy milk', 'see malaysia']
      end

      context 'searching for an option' do

        it 'should select an option from the search results' do
          select2 'Buy Milk', css: '#multiple', search: true
          expect(get_values('#todo')).to eql ['buy milk']
        end

      end

      context 'creating a dynamic option' do

        it 'should add a new option with text entered in the search field' do
          select2 'Millennials', css: '#tagging', tag: true
          expect(get_values('#tags')).to eql ['Millennials']
        end

      end
    end
  end
end
