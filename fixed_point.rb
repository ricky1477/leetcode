require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/fixed-point/
# 1064. Fixed Point
# Easy

# Given an array A of distinct integers sorted in ascending order, 
# return the smallest index i that satisfies A[i] == i.  Return -1 if no such i exists.

# Example 1:

# Input: [-10,-5,0,3,7]
# Output: 3
# Explanation: 
# For the given array, A[0] = -10, A[1] = -5, A[2] = 0, A[3] = 3, thus the output is 3.
# Example 2:

# Input: [0,2,5,8,17]
# Output: 0
# Explanation: 
# A[0] = 0, thus the output is 0.
# Example 3:

# Input: [-10,-5,3,4,7,9]
# Output: -1
# Explanation: 
# There is no such i that A[i] = i, thus the output is -1.
 
# Note:

# 1 <= A.length < 10^4
# -10^9 <= A[i] <= 10^9

# @param {Integer[]} a
# @return {Integer}
# Brute force O(n)
# def fixed_point(a)
#   return -1 unless a || a.length < 1

#   a.each_with_index do |int, idx|
#     return int if int == idx
#   end
#   return -1
# end

# # Binary Search O(log(n))
def fixed_point(a)
  return -1 if a.empty?
  left, right = 0, a.length - 1

  while(right >= left)
    mid = left + ((right - left) / 2)
    if a[mid] == mid
      # Can't return this since might have smaller value
      break 
    elsif a[mid] > mid
      right = mid - 1
    else
      left = mid + 1
    end
  end
  a[0..mid].each_with_index {|int, idx| return int if int == idx}
  return -1
end

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(3, fixed_point( [-10,-5,0,3,7]) )
    assert_equal(0, fixed_point([0,2,5,8,17]))
    assert_equal(-1, fixed_point([-10,-5,3,4,7,9]))
    assert_equal(4, fixed_point([-10,-5,-2,0,4,5,6,7,8,9,10]))
    assert_equal(0, fixed_point([0,1,2,3,4]))
  end
end

