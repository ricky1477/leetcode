require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/range-sum-query-mutable/

# 307. Range Sum Query - Mutable
# Medium

# Given an integer array nums, find the sum of the
# elements between indices i and j (i ≤ j), inclusive.

# The update(i, val) function modifies nums by updating
# the element at index i to val.

# Example:

# Given nums = [1, 3, 5]

# sumRange(0, 2) -> 9
# update(1, 2)
# sumRange(0, 2) -> 8
 

# Constraints:

# The array is only modifiable by the update function.
# You may assume the number of calls to update and sumRange
# function is distributed evenly.
# 0 <= i <= j <= nums.length - 1

class NumArray
  # :type nums: Integer[]
  def initialize(nums)
    @nums = nums
  end

  def print
    @nums
  end  
  
  # :type i: Integer
  # :type val: Integer
  # :rtype: Void
  # O(1)
  def update(i, val)
    @nums[i] = val
    @nums
  end
  
  # :type i: Integer
  # :type j: Integer
  # :rtype: Integer
  # O(k)
  def sum_range(i, j)
    @nums[i..j].inject(:+)
  end
end


# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    # Your NumArray object will be instantiated and called as such:
    nums = [1, 3, 5]
    obj = NumArray.new(nums)
    obj.print
    assert_equal([1, 3, 5], obj.print)
    assert_equal(9, obj.sum_range(0, 2))
    assert_equal([1, 2, 5], obj.update(1, 2))
    assert_equal(8, obj.sum_range(0, 2))
  end
end
