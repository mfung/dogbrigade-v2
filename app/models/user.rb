class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :fname, :lname, :zip_code, :password, :password_confirmation
  
  validates :email, presence: true, format: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, uniqueness: true
  validates :fname, presence: true
  validates :lname, presence: true
  validates :zip_code, presence: true
  
  def name
    [fname, lname].join " "
  end
  
end
