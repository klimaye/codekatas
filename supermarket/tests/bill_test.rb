require 'minitest/autorun'
require_relative '../bill'

class BillTest < MiniTest::Unit::TestCase

  def test_has_total
    cart = nil
    bill = Bill.new(cart)
    assert_equal 0, bill.total
  end
end


