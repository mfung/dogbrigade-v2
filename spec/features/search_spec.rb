require 'spec_helper'

feature 'Search', %q{
  As a dog lover
  In order to find a pet
  I need to be able to search
} do
  context 'guest' do
    describe 'search#index' do
      before :each do
        visit search_index_path
      end

      it 'has a search form' do
        expect(page).to have_selector('form#search')
      end
    end
  end
end