
require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: 'Zeus',
      last_name: 'Smith', 
      email: 'test@test.com', 
      password: '1234567', 
      password_confirmation: '1234567'
    )
  end

  scenario "They can login" do

    visit root_path
    find_link('Login').click

    fill_in "Email:", with: 'test@test.com'
    fill_in "Password:", with: '1234567'
    save_screenshot
    click_button "Submit"

    expect(page).to have_content("Welcome #{@user.name}")

    click_link 'Logout'

    expect(page).to have_content("Login")

    # save_screenshot
  end
end