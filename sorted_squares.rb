require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/squares-of-a-sorted-array/

# 977. Squares of a Sorted Array
# Easy

# Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

# Example 1:

# Input: [-4,-1,0,3,10]
# Output: [0,1,9,16,100]
# Example 2:

# Input: [-7,-3,2,3,11]
# Output: [4,9,9,49,121]
 

# Note:

# 1 <= A.length <= 10000
# -10000 <= A[i] <= 10000
# A is sorted in non-decreasing order.

# @param {Integer[]} a
# @return {Integer[]}
def sorted_squares(array)
  results = []
  left = 0
  right = array.length - 1
  index = array.length - 1

  while index >= 0
    a = array[left] * array[left]
    b = array[right] * array[right]

    if a > b
      results[index] = a
      left += 1
    else
      results[index] = b
      right -= 1
    end

    index -= 1
  end

  results
end

# O(n)
# The problem states that our input array is already sorted, meaning the hard work is
#  (mostly) already done for us. Knowing that the largest squared value will either 
#  be the very first item in the input array (the lowest negative number) or the 
#  last item in the input array (the largest positive number), we can use two 
#  pointers and walk our way through the array comparing items.

# The left pointer starts at the beginning of the array and walks forward 
# while the right pointer starts at the end and walks backwards. At each 
#   step we check which item squared is larger and then place that item at 
#   the end of our results array. [Why the end? Since we're comparing items 
#     from the end of our array - IE, we're comparing the current smallest 
#     negative and the current largest positive - we'll be placing items 
#     into our results array from the end, too.] We then increment the 
#     pointer and compare again ... comparing each element until we've 
#     compared them all one-by-one. Giving us an O(N) runtime and a slightly 
#     more involved algorithm than the quick one-liner above:

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(2, arrange_coins(5))
    assert_equal(3, arrange_coins(8))
  end
end

