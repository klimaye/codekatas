require 'minitest/autorun'
require_relative '../product'

class ProductTest < MiniTest::Unit::TestCase
  ORANGE = 'orange'

  def test_product_equality
    p1 = Product.new(name:ORANGE)
    p2 = Product.new(name:ORANGE)
    assert_equal true, p1 == p2
  end
end
