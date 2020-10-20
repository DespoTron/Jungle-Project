require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations for Users Model' do
    # validation examples here
    it "is valid with password and password_confirmation matching" do
      user = User.new(first_name: 'Zeus', last_name: 'Smith', email: 'test@test.com', password: 'C^t+6C', password_confirmation: 'C^t+6C')
      user.save
      expect(user).to be_valid
    end

    it "should validate the password, but be invalid when password_confirmation does not match" do
      user = User.new(first_name: 'Zeus', last_name: 'Smith', email: 'test@test.com', password: 'C^t+6C', password_confirmation: 'C^t+6CA')
      user.save
      expect(user).to_not be_valid
    end

    

  end
end
