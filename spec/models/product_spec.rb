require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    # validation tests/examples here
    it 'should validate a new product and save correctly with name, price, quantity and category' do
      new_category = Category.new(name: "Hats")
      new_product = Product.new(category: new_category, name: "beanie", price_cents: 5000, quantity: 50)
      new_product.save
      expect(new_product).to be_valid
    end
  end
end
