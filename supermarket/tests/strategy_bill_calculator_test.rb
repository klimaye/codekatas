require 'minitest/autorun'
require_relative '../cart'
require_relative '../strategy_bill_calculator'

class StrategyBillCalculatorTest < MiniTest::Unit::TestCase

  NAVAL_ORANGE = 'naval orange'
  POTATOES     = 'potatoes'

  def cart_with_an_orange(amount=5)
    product = Product.new(name: NAVAL_ORANGE,sold_by:Product::QUANTITY,price:1.00)
    item = CartItem.new(product: product, amount: amount)
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

  def test_worst_case_value_of_stock
    # if we have 100 oranges in stock and we have a special  'buy 2 get one
    # free' then what is value of the stock.
    # worst case 67 (33 purchases that used the special + 1 regular purchase)
    # best case 100 (100 1 orange purchases)
    product = Product.new(name: NAVAL_ORANGE,sold_by:Product::QUANTITY,price:1.00)
    criteria = Proc.new do |items|
      total = 0
      items.each { |item| total += item.amount }
      puts "total is #{total}"
      [total/3, total%3]
    end
    config = {
      product: product,
      qualifying_criteria: criteria,
      qualifying_price: 2.00,
      regular_price: 1.00
    }
    calc = StrategyBillCalculator.new cart_with_an_orange(100), config
    assert_equal 67, calc.total
  end

  def test_three_for_one_dollar
    product = Product.new(name: NAVAL_ORANGE,sold_by:Product::QUANTITY,price:0.40)
    criteria = Proc.new do |items|
      total = 0
      items.each { |item| total += item.amount }
      puts "test 3 for 1 : total is #{total}"
      [total/3, total%3]
    end
    config = {
      product: product,
      qualifying_criteria: criteria,
      qualifying_price: 1,
      regular_price: 0.4
    }
    calc = StrategyBillCalculator.new cart_with_an_orange, config
    assert_equal 1.8, calc.total
  end

  def test_total_for_quanity_based_product
    product = Product.new(name: NAVAL_ORANGE,sold_by:Product::QUANTITY,price:1.00)
    criteria = Proc.new do |items|
      total = 0
      items.each { |item| total += item.amount }
      puts "total is #{total}"
      [total/3, total%3]
    end
    config = {
      product: product,
      qualifying_criteria: criteria,
      qualifying_price: 2.00,
      regular_price: 1.00
    }
    calc = StrategyBillCalculator.new cart_with_an_orange, config
    assert_equal 4.00, calc.total
  end

  def test_applicable
    product = Product.new(name: NAVAL_ORANGE,sold_by:Product::QUANTITY,price:1.00)
    criteria = Proc.new do |items|
      total = 0
      items.each { |item| total += item.amount }
      [total/3, total%3]
    end
    config = {
      product: product,
      qualifying_criteria: criteria,
      qualifying_price: 2.00,
      regular_price: 1.00
    }
    calc = StrategyBillCalculator.new cart_with_an_orange, config
    assert_equal true, calc.applicable?
  end

  def test_total_for_weight_based_product
    #calc = BasicBillCalculator.new cart_with_potatoes
    #assert_equal 0.9*2.04, calc.total
  end

  def test_total_by_items
    #calc = BasicBillCalculator.new cart_with_an_orange
    #item_totals = calc.total_by_item
    #total_item = item_totals.first
    #assert_equal NAVAL_ORANGE, total_item.item.product_name
    #assert_equal 5.0, total_item.total
  end
end
