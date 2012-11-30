require 'spec_helper'

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