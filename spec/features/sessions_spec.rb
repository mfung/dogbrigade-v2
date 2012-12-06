require 'spec_helper'
feature 'Sessions Management', %q{
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
      
      it 'logs in a user' do
        visit login_path
        expect {
          fill_in '', ''
          click 'Login'
        }.to have_content('Signed In.')
      end
    end 
  end
end