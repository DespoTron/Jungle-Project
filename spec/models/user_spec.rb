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

    it "cannot create email if it is not unique" do
      user = User.new(first_name: 'Zeus', last_name: 'Smith', email: 'test@test.com', password: 'C^t+6C', password_confirmation: 'C^t+6C')
      user.save
      userTwo = User.new(first_name: 'Zeus', last_name: 'Smith', email: 'TEST@TEST.com', password: 'C^t+6C', password_confirmation: 'C^t+6C')
      userTwo.save
      expect(userTwo).to_not be_valid
    end

    it "cannot create a user without a password" do
      user = User.new(first_name: 'Zeus', last_name: 'Smith', email: 'test@test.com', password: nil, password_confirmation: nil)
      user.save
      expect(user).to_not be_valid
    end

    it "should have a password with a minimum length of 6 characters" do
      user = User.new(first_name: 'Zeus', last_name: 'Smith', email: 'test@test.com', password: 'hello', password_confirmation: 'hello')
      user.save
      expect(user).to_not be_valid
    end

    it "should not create a user without the first name" do
      user = User.new(last_name: 'Smith', email: 'test@test.com', password: 'hello', password_confirmation: 'hello')
      user.save
      expect(user).to_not be_valid
    end

    it "should not create a user without the last name" do
      user = User.new(first_name: 'Zeus', email: 'test@test.com', password: 'hello', password_confirmation: 'hello')
      user.save
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it "should authenticate user if credentials match an existing user information" do
      user = User.new(first_name: 'Artemis', last_name: 'Hades', email: 'test@test.com', password: 'C^t+6C', password_confirmation: 'C^t+6C')
      user.save
      user_test = User.authenticate_with_credentials("test@test.com", 'C^t+6C')
      expect(user_test).to eql(user)
    end

    

  end

end
