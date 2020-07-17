require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/arranging-coins/

# 441. Arranging Coins
# Easy

# You have a total of n coins that you want to form in a staircase shape, 
# where every k-th row must have exactly k coins.

# Given n, find the total number of full staircase rows that can be formed.

# n is a non-negative integer and fits within the range of a 32-bit signed integer.

# Example 1:

# n = 5
# The coins can form the following rows:
# ¤
# ¤ ¤
# ¤ ¤
# Because the 3rd row is incomplete, we return 2.


# Example 2:
# n = 8
# The coins can form the following rows:
# ¤
# ¤ ¤
# ¤ ¤ ¤
# ¤ ¤
# Because the 4th row is incomplete, we return 3.

# # Binary Search O(log(n))
# @param {Integer} n
# @return {Integer}
def arrange_coins(n)
    return -1 if n.nil?
    left, right = 0, n

    while(right >= left)
      k = left + (right-left)/2
      cur = k*(k+1)/2 
      if cur == n
        return k
      elsif cur > n
        right = k - 1
      else 
        left = k + 1
      end
    end
    return right
end

# Math Series 
# Σ (1+2+3...k) = k(k+1)/2

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(2, arrange_coins(5))
    assert_equal(3, arrange_coins(8))
  end
end

