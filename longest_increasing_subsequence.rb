require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/longest-continuous-increasing-subsequence/

# 674. Longest Continuous Increasing Subsequence
# Easy

# Given an unsorted array of integers, find the length of longest 
# continuous increasing subsequence (subarray).

# Example 1:
# Input: [1,3,5,4,7]
# Output: 3
# Explanation: The longest continuous increasing subsequence is [1,3,5], 
# its length is 3. 
# Even though [1,3,5,7] is also an increasing subsequence, it's not a 
# continuous one where 5 and 7 are separated by 4. 
# Example 2:
# Input: [2,2,2,2,2]
# Output: 1
# Explanation: The longest continuous increasing subsequence is [2],
#  its length is 1. 
# Note: Length of the array will not exceed 10,000.


# @param {Integer[]} nums
# @return {Integer}
def find_length_of_lcis(nums)
  return 0 if nums.empty?
  return 1 if nums.length == 1
  lcis = 1
  incr_subsq = 1
  # Loops through array beg to second last
  nums[0..nums.length-2].each_with_index do |num, idx|
    # p "#{num}:#{nums[idx+1]}:#{idx}"
    num < nums[idx+1] ? incr_subsq+=1 : incr_subsq=1
    lcis = incr_subsq if incr_subsq > lcis
    # p incr_subsq
  end
  return lcis
end

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(3, find_length_of_lcis([1,3,5,4,7]))
    assert_equal(1, find_length_of_lcis([2,2,2,2,2]))
    assert_equal(5, find_length_of_lcis([1,3,5,4,5,6,7,8]))
    assert_equal(1, find_length_of_lcis([8]))
    assert_equal(0, find_length_of_lcis([]))
  end
end
