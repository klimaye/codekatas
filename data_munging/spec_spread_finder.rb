require 'minitest/autorun'
require_relative 'spread_finder'
class SpreadFinderTests < MiniTest::Unit::TestCase

  def test_is_number
    assert(is_number?("32"))
    assert(is_number?("32*"))
    assert(is_number?("323*"))
    refute(is_number?("  "))
    refute(is_number?("A32"))
  end

  def test_are_numbers
    assert(are_numbers?("100","0"))
    assert(!are_numbers?("a","0"))
  end

  def test_number
    assert_equal(32, number("32"))
    assert_equal(32, number("32*"))
    assert_equal(0, number('0'))
  end

  def test_split
    str = "Dy MaxT   MinT"
    assert_equal(3, split(str).size)
    assert_equal("Dy", split(str).first)
    assert_equal("MinT", split(str).last)
  end

  def test_calc_spread
    assert_equal(1000, calc_temp_spread(["test","a","1"]))
    assert_equal(50, calc_temp_spread(["test", "100","50"]))
  end

  def test_find_day_with_smallest_spread
    smallest_spread_hash = find_day_with_smallest_spread_redux
    assert_equal("14", smallest_spread_hash[:item])
  end
end
