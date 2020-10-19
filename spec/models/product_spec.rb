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

    it 'should not validate a product without a name' do
      new_category = Category.new(name: "Hats")
      new_product = Product.new(category: new_category, name: nil, price_cents: 5000, quantity: 50)
      new_product.save
      expect(new_product).to_not be_valid
      expect(new_product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not validate a product without a price' do
      new_category = Category.new(name: "Hats")
      new_product = Product.new(category: new_category, name: "cloche", price_cents: nil, quantity: 50)
      new_product.save
      expect(new_product).to_not be_valid
      expect(new_product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not validate a product without quanity' do
      new_category = Category.new(name: "Hats")
      new_product = Product.new(category: new_category, name: "cloche", price_cents: 5000, quantity: nil)
      new_product.save
      expect(new_product).to_not be_valid
      expect(new_product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not validate a product without a category' do
      new_product = Product.new(category: nil, name: "cloche", price_cents: 5000, quantity: 50)
      new_product.save
      expect(new_product).to_not be_valid
      expect(new_product.errors.full_messages).to include("Category can't be blank")
    end
    
  end
end
