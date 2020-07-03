require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/2971/

# Missing Number

# Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.

# Example 1:

# Input: [3,0,1]
# Output: 2
# Example 2:

# Input: [9,6,4,2,3,5,7,0,1]
# Output: 8
# Note:
# Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?

def missing_number(nums)
  nums = nums.sort
  nums.each.with_index do |n,i| 
    return i if n != i
  end
  return nums.last+1
end


class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(2, missing_number([3,0,1]))
    assert_equal(8, missing_number([9,6,4,2,3,5,7,0,1]))
    assert_equal(1, missing_number([0]))
    assert_equal(0, missing_number([1]))
    assert_equal(2, missing_number([1,0]))
  end 
end