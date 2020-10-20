
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

  scenario "User can login" do 
    visit root_path
    find_link('Login').click
    expect(page).to have_text 'Email:'
    expect(page).to have_text 'Password:'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: '1234567'
    save_screenshot
    find_button('Submit').click
    expect(page).to have_content('Products')
    expect(page).to have_content('Logout')
  end
end