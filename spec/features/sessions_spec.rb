require 'spec_helper'
feature 'Sessions Management', %q{
  As a dog lover
  In order to make it easier to search for dogs
  I need to be able to login and loggout
} do
  context 'guest' do
    describe 'Sessions#new' do
      before :each do
        FactoryGirl.create(:user, email: 'test@mail.com', password: 'secret', password_confirmation: 'secret')
      end
      
      it 'has a login form' do
        visit login_path
        expect(page).to have_content('Sign In')
        expect(page).to have_selector('#login_email')
      end
      
      it 'logs in a user' do
        visit login_path
        within '#login-form' do
          fill_in 'login[email]', with: 'test@mail.com'
          fill_in 'login[password]', with: 'secret'
          click_button 'Login'
        end
        expect(page).to have_content('Logged in!')
      end
      
      it 'does not login a user if invalid' do
        visit login_path
        within '#login-form' do
          fill_in 'login[email]', with: 'test@mail.com'
          fill_in 'login[password]', with: 'secret2'
          click_button 'Login'
        end
        expect(page).to have_content('Email or password is invalid!')
      end
    end 
  end
end