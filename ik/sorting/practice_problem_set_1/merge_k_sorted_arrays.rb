require 'test/unit'
require 'byebug'
require 'set'

# O(2n) merge and check if ascending? => O(n)
def mergeArrays(arr)
  result_arr = []
  if ascending? (arr)
    while(!arr.flatten.empty?)
      mins = []
      arr.map { |sub_array| mins << (sub_array.first.nil? ? 10**7 : sub_array.first) }
      min = mins.min
      p mins
      p min
      p arr[mins.index(min)]
      result_arr << arr[mins.index(min)].shift
      p '-----'
    end
  else
    while(!arr.flatten.empty?)
      maxs = []
      arr.map { |sub_array| maxs << (sub_array.first.nil? ? -10**7 : sub_array.first) }
      max = maxs.max
      result_arr << arr[maxs.index(max)].shift
    end
  end
  p result_arr

  result_arr
end

# O(n)
def ascending?(arr)
  result = true
  arr.each do |a|
    result = a.first <= a.last if result
  end
  result
end
 



class TestClass < Test::Unit::TestCase

  
  def test_simple
    assert_equal([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
      mergeArrays([[1, 3, 5, 7],[2, 4, 6, 8],[0, 9, 10, 11]]))
    assert_equal([1, 2, 3, 4], mergeArrays([[1, 3], [2, 4]]))
    assert_equal([1, 3], mergeArrays([[1, 3]]))
    assert_equal([6,7,9,10,15,18], mergeArrays([[6,10,15],[7,9,18]]))
    assert_equal([18,15,10,9,7,6], mergeArrays([[15,10,6],[18,9,7]]))

  end
end 