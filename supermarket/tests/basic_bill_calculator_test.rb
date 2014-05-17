require 'minitest/autorun'
require_relative '../cart'
require_relative '../basic_bill_calculator'

class BasicBillCalculatorTest < MiniTest::Unit::TestCase

  NAVAL_ORANGE = 'naval orange'
  POTATOES     = 'potatoes'

  def cart_with_an_orange
    product = Product.new(name: NAVAL_ORANGE,sold_by:Product::QUANTITY,price:1.00)
    item = CartItem.new(product: product, amount: 5)
    cart = Cart.new
    cart.tap do
      cart.add item
    end
  end

  def cart_with_potatoes
    product = Product.new(name: POTATOES, sold_by:Product::WEIGHT, unit: Unit::POUNDS, price:0.9)
    item = CartItem.new(product: product, amount: 2.04)
    cart = Cart.new
    cart.tap do
     cart.add item
    end
  end

  def test_total_for_quanity_based_product
    calc = BasicBillCalculator.new cart_with_an_orange
    assert_equal 5.00, calc.total
  end

  def test_total_for_weight_based_product
    calc = BasicBillCalculator.new cart_with_potatoes
    assert_equal 0.9*2.04, calc.total
  end

  def test_total_by_items
    calc = BasicBillCalculator.new cart_with_an_orange
    item_totals = calc.total_by_item
    total_item = item_totals.first
    assert_equal NAVAL_ORANGE, total_item.item.product_name
    assert_equal 5.0, total_item.total
  end
end
