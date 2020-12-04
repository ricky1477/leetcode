require 'test/unit'
require 'byebug'
require 'set'


def merge_sort(arr)
  # Write your code here
  return arr if arr.size ==  1

  # Call merge_sort on left and right halfs of array
  left = merge_sort(arr.take(arr.size/2))
  right = merge_sort(arr.drop(arr.size/2))
  merge(left, right)
end

def merge(left, right)
  sorted = []

  until left.empty? || right.empty?
    sorted << (left.first > right.first ? right.shift : left.shift)
  end
  sorted.concat(left).concat(right)
end

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal([3,9,10,27,38,43,82], merge_sort([38,27,43,3,9,82,10]))
    assert_equal([1,3,5,7], merge_sort([1,7,5,3]))
    assert_equal([0,199999999,1000000000], merge_sort([1000000000,199999999,0]))
  end
end