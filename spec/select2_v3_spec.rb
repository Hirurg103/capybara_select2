require 'spec_helper'

describe CapybaraSelect2 do

  shared_context 'with select2 version 3' do |options = {}|

    before { visit 'select2-v3/index.html' }

    driver = options[:driver]
    context "with a JS driver: #{driver}", driver: driver do

      context 'selecting a value from a single select box' do

        it 'should select an option from select found by XPath' do
          select2 'XBox', xpath: '//div[@id="single"]'
          expect(page).to have_css '.select2-chosen', text: 'XBox'
        end

        it 'should select an option from select found by CSS selector' do
          select2 'XBox', css: '#single'
          expect(page).to have_css '.select2-chosen', text: 'XBox'
        end

        it 'should select an option from select found by label' do
          select2 'XBox', from: 'Select game console'
          expect(page).to have_css '.select2-chosen', text: 'XBox'
        end

        context 'when searching for an option' do
          it 'should select an option from search results' do
            select2 'Wii', css: '#single', search: true
            expect(page).to have_css '.select2-chosen', text: 'Wii'
          end

          it 'should select first matched option from search results' do
            select2 'PlayStation', css: '#single', search: true, match: :first
            expect(page).to have_css '.select2-chosen', text: 'PlayStation 3'
          end
        end

        context 'when searching for an option within a block' do
          it 'should select an option from search results' do
            within '#single' do
              select2 'Wii', css: '.select2-container', search: true
            end
            expect(page).to have_css '.select2-container span', text: 'Wii'
          end
        end
      end

      context 'selecting a value from a multi select box' do

        it 'should select an option from select found by XPath' do
          select2 'Buy Milk', xpath: '//div[@id="multiple"]'
          expect(page).to have_css '.select2-search-choice', text: 'Buy Milk'
        end

        it 'should select an option from select found by CSS selector' do
          select2 'Buy Milk', css: '#multiple'
          expect(page).to have_css '.select2-search-choice', text: 'Buy Milk'
        end

        it 'should select an option from select found by label' do
          select2 'Buy Milk', from: 'Things to do'
          expect(page).to have_css '.select2-search-choice', text: 'Buy Milk'
        end

        it 'should select an option from select with previously selected values' do
          select2 'Buy Milk', css: '#multiple', search: true
          select2 'See Malaysia', css: '#multiple', search: true

          expect(page).to have_css '.select2-search-choice', text: 'Buy Milk'
        end

        context 'when searching for an option' do
          before { select2 'Buy Milk', css: '#multiple', search: true }

          it 'should select an option from search results' do
            expect(page).to have_css '.select2-search-choice', text: 'Buy Milk'
          end
        end
      end

      # tagging

      context 'creating a dynamic option' do
        it 'should add an option from search box' do
          select2 'Millennials', css: '#tagging', tag: true

          expect(page).to have_css '.select2-search-choice', text: 'Millennials'
        end
      end

    end
  end

  include_context 'with select2 version 3', driver: :firefox
  include_context 'with select2 version 3', driver: :webkit

end
