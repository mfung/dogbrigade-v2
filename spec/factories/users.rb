# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "johndoe#{n}@dogbrigade.com" }
    fname "John"
    lname "Doe"
    zip_code "92376"
    password "secret"
  end
end
