# https://uplevel.interviewkickstart.com/resource/rc-codingproblem-5659-29811-4-85

require 'test/unit'
require 'byebug'
require 'set'


# Complete the topK function below.
# O(nLog(n))
def topK(arr, k)
  set = Set.new
  arr.sort!
  p arr
  idx = arr.length - 1
  while (set.length < k && idx >= 0)
    set.add(arr[idx])
    idx -= 1
  end

  set.to_a.reverse
end


class TestClass < Test::Unit::TestCase
  
  def test_simple
    assert_equal([4, 5], topK([1, 5, 4, 4, 2], 2))
    assert_equal([1, 5], topK([1, 5, 1, 5, 1], 3))
    assert_equal([1, 2, 4, 6, 8, 9, 10], topK([1, 2, 2, 2, 4, 6, 6, 8, 8, 9, 10], 9))


    
  end
end 