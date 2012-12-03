require 'spec_helper'

feature 'Static Pages', %q{
  As a pet lover
  In order to help other pet lovers find pets
  I need to have static pages they can visit to find out more information about the site
} do
  context "guest" do
    scenario 'index page' do
      visit root_path
      expect(page).to have_content 'Welcome'
    end
    scenario 'about us page' do
      visit about_us_path
      expect(page).to have_content 'About Us'
    end
  end
end

describe PagesController do
  describe "home" do
    before :each do
      visit root_path
    end
    it "has a welcome message" do
      expect(page).to have_content 'Welcome'
    end
    it "has a Sign Up! link" do
      expect(page).to have_content 'Sign Up!'
    end
    it "has a menu bar" do
      expect(page).to have_content 'Home'
      expect(page).to have_content 'Search'
    end
  end
end