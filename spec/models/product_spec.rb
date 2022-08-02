require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should validate the four fields' do
      @category = Category.new(name: 'House Plants')
      @product = Product.new(
        :name => 'Pothos', 
        :price_cents => 1099, 
        :quantity => 11, 
        :category => @category)
      @product.errors.full_messages
      expect(@product).to be_present
  end

  it 'should validate the name' do
    @category = Category.new(name: 'Large Plants')
    @product = Product.new(
      :name => nil, 
      :price_cents => 1299, 
      :quantity => 18, 
      :category => @category)
    @product.save
    expect(@product.errors.full_messages).to be_present
    expect(@product).not_to be_valid
end

it 'should validate the price' do
  @category = Category.new(name: 'Vine Plants')
  @product = Product.new(
    :name => 'ivy', 
    :price_cents => nil, 
    :quantity => 21, 
    :category => @category)
    @product.save
    expect(@product.errors.full_messages).to be_present
    expect(@product).not_to be_valid
  end
  
it 'should validate the quanitity' do
  @category = Category.new(name: 'House Plants')
  @product = Product.new(
    :name => 'ZZ Plant', 
    :price_cents => 1199, 
    :quantity => nil, 
    :category => @category)
    @product.save
    expect(@product.errors.full_messages).to be_present
    expect(@product).not_to be_valid
  end

it 'should validate the category' do
  @category = Category.new(name: 'Succulents')
  @product = Product.new(
    :name => 'Sedums', 
    :price_cents => 1099, 
    :quantity => 11, 
    :category => nil)
    @product.save
    expect(@product.errors.full_messages).to be_present
    expect(@product).not_to be_valid
end
end
end