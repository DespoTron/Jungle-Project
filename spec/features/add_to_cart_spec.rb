require 'rails_helper'

RSpec.feature "AddProducts", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    @category.products.create!(
      name: 'Women\'s Zebra pants',
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel2.jpg'),
      price: 50.50,
      quantity: 5
    )
  end


  scenario "A user can add a product to their cart and check it" do
    # visit the home page
    visit '/'

    # find a product listing
    # click add button on that product listing
    first('article.product').find_button('Add').click

    # check if nav ahs item in cart
    # click cart link
    find_link('My Cart (1)').click

    # check that item exists in the cart
    expect(page).to have_content('TOTAL:')
    expect(page).to have_content('Women\'s Zebra pants')
    page.save_screenshot
  end

end

# check that item exists in the cart
