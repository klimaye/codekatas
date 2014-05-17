require 'minitest/autorun'
require_relative '../cart'

class CartTest < MiniTest::Unit::TestCase

  def test_has_cart_items
    cart = Cart.new
    assert_equal true,cart.respond_to?(:items)
    assert_equal 0, cart.items.count
  end
end
