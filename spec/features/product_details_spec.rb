require 'rails_helper'

RSpec.feature "Visitor navigates to home page and goes to the ProductDetails page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
  
    10.times do |n|
      @category.products.create!(
        name: 'Women\'s Zebra pants',
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product details" do
    # ACT
    visit root_path

    expect(page).to have_text 'Women\'s Zebra pants'

    find('h4', match: :first, :text => 'Women\'s Zebra pants').click
    puts page.html
    # VERIFY
    expect(page).to have_css 'article.product-detail', count: 1
    save_screenshot
  end

end
