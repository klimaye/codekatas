require 'minitest/autorun'

class BinaryChopTwoTest < MiniTest::Unit::TestCase

  def bfind(number, array, start, ending)
    return -1 if start == array.length || ending < 0 || start > ending
    position = start + ((ending - start) / 2)
    if number == array[position]
      return position
    elsif number < array[position]
      bfind(number, array, start, position - 1)
    else
      bfind(number, array, position + 1, ending)
    end
  end

  def bfind2(number, array, start, ending)
    position = start + ((ending - start) / 2)
    return position if number == array[position]
    return -1 if start >= ending
    if number < array[position]
      bfind2(number, array, start, position - 1)
    else
      bfind2(number, array, position + 1, ending)
    end
  end
  def chop(number, array)
    array ||= []
    return -1 if array.empty?
    #both options work

    ##one with more escape conditions
    #bfind(number, array, 0, array.length)

    #one with one escape condition
    bfind2(number, array, 0, array.length)
  end

  def test_chop_one
    assert_equal(-1,chop(1,nil))
    assert_equal(-1, chop(3, []))
    assert_equal(-1, chop(3, [1]))
    assert_equal(0, chop(1, [1]))

    assert_equal(0, chop(1, [1, 3, 5]))
    assert_equal(1, chop(3, [1, 3, 5]))
    assert_equal(2, chop(5, [1, 3, 5]))
    assert_equal(-1, chop(0, [1, 3, 5]))
    assert_equal(-1, chop(2, [1, 3, 5]))
    assert_equal(-1, chop(4, [1, 3, 5]))
    assert_equal(-1, chop(6, [1, 3, 5]))

    assert_equal(0, chop(1, [1, 3, 5, 7]))
    assert_equal(1, chop(3, [1, 3, 5, 7]))
    assert_equal(2, chop(5, [1, 3, 5, 7]))
    assert_equal(3, chop(7, [1, 3, 5, 7]))
    assert_equal(-1, chop(0, [1, 3, 5, 7]))
    assert_equal(-1, chop(2, [1, 3, 5, 7]))
    assert_equal(-1, chop(4, [1, 3, 5, 7]))
    assert_equal(-1, chop(6, [1, 3, 5, 7]))
    assert_equal(-1, chop(8, [1, 3, 5, 7]))
  end
end
