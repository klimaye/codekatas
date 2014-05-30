require 'minitest/autorun'

class Array
	def bchop(val, low=0,high=length - 1)
		return -1 if high < low
		mid = (low + high) / 2
		case 
		when self[mid] > val 
			then bchop(val,low,mid-1)
		when self[mid] < val
			then bchop(val,mid+1,high)
		else mid
		end
	end
end
class BinaryChopThreeTest < MiniTest::Unit::TestCase
 def test_chop_three
    assert_equal(-1, [].bchop(3))
    assert_equal(-1, [1].bchop(3))
    assert_equal(0,  [1].bchop(1))    
    assert_equal(0, [1,3,5].bchop(1))
    assert_equal(1, [1,3,5].bchop(3))
    assert_equal(2, [1,3,5].bchop(5))
    assert_equal(-1, [1,3,5].bchop(0))
    assert_equal(-1, [1,3,5].bchop(2))
  end
end