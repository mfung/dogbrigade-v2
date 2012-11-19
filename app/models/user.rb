class User < ActiveRecord::Base
  attr_accessible :email, :fname, :lname, :zip_code
end
