require 'minitest/autorun'

class BinaryChopFourTest < MiniTest::Unit::TestCase
  def sub(array,start,ending)
    if ending < start
      []
    else
      array[start..ending]
    end
  end
  
  def bfind4(num, counter, array)
    ending = array.length - 1
    return -1 if ending < 0
    mid = ending / 2
    if array[mid] < num
      bfind4(num, counter + mid + 1, array[(mid+1)..ending])       
    elsif array[mid] > num
      bfind4(num, 0, sub(array,0,mid-1))   
    else
      counter + mid
    end
  end

  def chop(number, array)
    array ||= []
    return -1 if array.empty?
    bfind4(number, 0, array)
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
