require 'spec_helper'

describe CapybaraSelect2 do

  shared_context 'with select2 version 4' do |options = {}|

    before { visit 'select2-v4/index.html' }

    driver = options[:driver]
    context "with a JS driver: #{driver}", driver: driver do

      context 'selecting a value from a single select box' do

        it 'should select an option from select found by XPath' do
          select2 'XBox', xpath: "//div[@id='single']"
          expect(page).to have_css '.select2-container span', text: 'XBox'
        end

        it 'should select an option from select found by CSS selector' do
          select2 'XBox', css: '#single .select2-container'
          expect(page).to have_css '.select2-container span', text: 'XBox'
        end

        it 'should select an option from select found by label' do
          select2 'XBox', from: 'Select game console'
          expect(page).to have_css '.select2-container span', text: 'XBox'
        end

        context 'when searching for an option' do
          before { select2 'Wii', css: '#single', search: true }

          it 'should select an option from search results' do
            expect(page).to have_css '.select2-container span', text: 'Wii'
          end
        end
      end

      context 'selecting a value from a multi select box' do

        it 'should select an option from select found by XPath' do
          select2 'Buy Milk', xpath: "//div[@id='multiple']"
          expect(page).to have_css '.select2-selection__choice', text: 'Buy Milk'
        end

        it 'should select an option from select found by CSS selector' do
          select2 'Buy Milk', css: '#multiple .select2-container'
          expect(page).to have_css '.select2-selection__choice', text: 'Buy Milk'
        end

        it 'should select an option from select found by label' do
          select2 'Buy Milk', from: 'Things to do'
          expect(page).to have_css '.select2-selection__choice', text: 'Buy Milk'
        end

        it 'should select an option from select with previously selected values' do
          select2 'Buy Milk', css: '#multiple', search: true
          select2 'See Malaysia', css: '#multiple', search: true

          expect(page).to have_css '.select2-selection__choice', text: 'Buy Milk'
        end

        context 'when searching for an option' do
          before { select2 'Buy Milk', css: '#multiple', search: true }

          it 'should select an option from search results' do
            expect(page).to have_css '.select2-selection__choice', text: 'Buy Milk'
          end
        end
      end

      context 'selecting a value from a grouped select box' do

        it 'should select an option from select' do
          select2 'Big Boom Wooh', css: '#grouped .select2-container'
          expect(page).to have_css '.select2-container span', text: 'Big Boom Wooh'
        end
      end

      # tagging

      context 'creating a dynamic option' do
        it 'should add an option from search box' do
          select2 'Millennials', css: '#tagging', tag: true

          expect(page).to have_css '.select2-selection__choice', text: 'Millennials'
        end
      end

    end
  end

  include_context 'with select2 version 4', driver: :firefox
  include_context 'with select2 version 4', driver: :webkit

end
