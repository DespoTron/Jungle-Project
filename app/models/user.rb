class User < ActiveRecord::Base

  has_secure_password
  
  validates :password, presence: true
  validates :password_confirmation, presence: true  
  validates :password, length: { minimum: 6 }
  validates_uniqueness_of :email :case_senstive => false
  validates :first_name, :last_name, :email, presence true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user 
    else 
      return nil
    end 
  end

end
