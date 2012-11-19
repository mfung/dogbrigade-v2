require 'spec_helper'

describe User do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it 'is invalid without an email' do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end
  it 'is invalid without a first name' do
    expect(FactoryGirl.build(:user, fname: nil)).to_not be_valid
  end
  it 'is invalid without a last name' do
    expect(FactoryGirl.build(:user, lname: nil)).to_not be_valid
  end
  it "is invalid without a zip code" do 
    expect(FactoryGirl.build(:user, zip_code: nil)).to_not be_valid
  end
  it "returns a users full name as a string" do
    expect(FactoryGirl.create(:user, fname: 'Jack', lname: 'Black').name).to eq 'Jack Black'
  end
  it "is invalid without a correct format email" do
    expect(FactoryGirl.build(:user, email: '@aasdf$')).to_not be_valid
  end
  it "is invalid with a duplicate email address" do 
    FactoryGirl.create(:user, email: 'max@dogbrigade.com')
    expect(FactoryGirl.build(:user, email: 'max@dogbrigade.com')).to_not be_valid
  end
end
