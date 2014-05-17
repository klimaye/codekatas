require 'minitest/autorun'
require_relative '../cart_item'

class CartItemTest < MiniTest::Unit::TestCase

  def test_quanity_based_product
    product = Product.new(name: 'naval orange',sold_by:Product::QUANTITY,price:1.00)
    item = CartItem.new(product: product, amount: 1)
    assert_equal 'naval orange', item.product_name
    assert_equal 1, item.amount
    assert_equal nil,item.product_unit
    assert_equal Product::QUANTITY, item.product_sold_by
  end

  def test_weight_based_product
    product = Product.new(name: 'potatoes', sold_by:Product::WEIGHT, unit: Unit::POUNDS, price:1.00)
    item = CartItem.new(product: product, amount: 0.88)
    assert_equal 'potatoes', item.product_name
    assert_equal 0.88, item.amount
    assert_equal Unit::POUNDS,item.product_unit
    assert_equal Product::WEIGHT, item.product_sold_by
  end

end
