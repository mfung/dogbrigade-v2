require 'spec_helper'

feature 'User Management', %q{
  As a dog lover
  In order to make it easier to search for dogs
  I need to be able to manage my user account
} do
  context 'guest' do
    describe 'Users#new' do
      before :each do
        visit new_user_path
      end

      it 'has a new user form' do
        expect(page).to have_selector('form#new_user')
      end

      it 'adds a new user' do
        expect {
          fill_in 'Email', with: 'test@gmail.com'
          fill_in 'user[fname]', with: 'Tony'
          fill_in 'user[lname]', with: 'Spark'
          fill_in 'user[zip_code]', with: '12345'
          fill_in 'user[password]', with: 'secret123'
          fill_in 'user[password_confirmation]', with: 'secret123'
          click_button 'Create User'
        }.to change(User, :count).by(1)
      end
    end
  end
  
  context 'member' do
    describe 'Users#edit' do
      it 'has a edit user form' do
        pending
      end
    end
  end
  
end