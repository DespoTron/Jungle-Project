class User < ActiveRecord::Base

  has_secure_password
  
  validates :password, presence: true
  validates :password_confirmation, presence: true  
  validates :password, length: { minimum: 6 }
  validates_uniqueness_of :email :case_senstive => false
  validates :first_name, :last_name, :email, presence true

end
