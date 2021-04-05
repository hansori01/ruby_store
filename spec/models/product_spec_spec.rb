require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should save valid product" do
      @category = Category.create(name:"Device")
      item = Product.new(
        name: "Tablet",
        price: 300.00,
        quantity: 3,
        category_id: @category.id
      )
      expect(item).to (be_valid)
    end

    it 'should not save without name' do
      @category = Category.create(name: "noname")
      item = Product.new(
        name: nil,
        price: 4.00,
        quantity: 11,
        category_id: @category.id
      )
      expect(item).to_not (be_valid)
      expect(item.errors[:name]).to include("can't be blank")
    end

    it 'should not save without price' do
      @category = Category.create(name: 'noMo')
      item = Product.new(
        name: "Tissue",
        price: nil,
        quantity: 1,
        category_id: @category.id
      )
      expect(item).to_not (be_valid)
      expect(item.errors[:price]).to include("is not a number")
    end

    it 'should not save without quantity' do
      @category = Category.create(name: 'noitem')
      item = Product.new(
        name: "Tissue",
        price: 10.00,
        quantity: nil,
        category_id: @category.id
      )
      expect(item).to_not (be_valid)
      expect(item.errors[:quantity]).to include("can't be blank")
    end

    it 'should not save without category id' do
      @category = Category.create(name: 'nocategory')
      item = Product.new(
        name: "Tissue",
        price: 10.00,
        quantity: 1,
        category_id: nil
      )
      expect(item).to_not (be_valid)
      expect(item.errors[:category]).to include("can't be blank")
    end

  end
end
