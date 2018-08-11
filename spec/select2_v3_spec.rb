require 'spec_helper'

describe CapybaraSelect2 do

  shared_context 'with select2 version 3' do |options = {}|

    before { visit 'select2-v3/index.html' }

    driver = options[:driver]
    context "with a JS driver: #{driver}", driver: driver do

      context 'selecting a value from a single select box' do

        it 'identified by XPath' do
          select2 'XBox', xpath: '//div[@id="single"]'
          expect(page).to have_css '.select2-chosen', text: 'XBox'
        end

        it 'identified by CSS selector' do
          select2 'XBox', css: '#single'
          expect(page).to have_css '.select2-chosen', text: 'XBox'
        end

        it 'identified by label' do
          select2 'XBox', from: 'Select game console'
          expect(page).to have_css '.select2-chosen', text: 'XBox'
        end

      end

      context 'selecting a value from a multi select box' do

        it 'identified by XPath' do
          select2 'Buy Milk', xpath: '//div[@id="multiple"]'
          expect(page).to have_css '.select2-search-choice', text: 'Buy Milk'
        end

        it 'identified by CSS selector' do
          select2 'Buy Milk', css: '#multiple'
          expect(page).to have_css '.select2-search-choice', text: 'Buy Milk'
        end

        it 'identified by label' do
          select2 'Buy Milk', from: 'Things to do'
          expect(page).to have_css '.select2-search-choice', text: 'Buy Milk'
        end

        it 'should select with search for an option' do
          select2 'Buy Milk', css: '#multiple', search: true

          expect(page).to have_css '.select2-search-choice', text: 'Buy Milk'
        end

      end

      context 'creating a dynamic option' do
        it 'should add an option from search box' do
          select2 'Millenials', css: '#tagging', tag: true

          expect(page).to have_css '.select2-search-choice', text: 'Millenials'
        end
      end

    end
  end

  include_context 'with select2 version 3', driver: :selenium
  include_context 'with select2 version 3', driver: :webkit

end
