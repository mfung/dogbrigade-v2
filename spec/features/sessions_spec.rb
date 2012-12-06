require 'spec_helper'
feature 'User Management', %q{
  As a dog lover
  In order to make it easier to search for dogs
  I need to be able to login and loggout
} do
  context 'guest' do
    describe 'Sessions#new' do
      it 'has a login form' do
        visit login_path
        expect(page).to have_content('Sign In')
        expect(page).to have_selector('#login_email')
      end
    end 
  end
end