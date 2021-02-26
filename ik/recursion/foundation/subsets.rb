require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/subsets/

# 78. Subsets
# Medium
# Given an integer array nums of unique elements, return all possible subsets (the power set).
# The solution set must not contain duplicate subsets. Return the solution in any order.

# Example 1:
# Input: nums = [1,2,3]
# Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

# Example 2:
# Input: nums = [0]
# Output: [[],[0]]
 
# Constraints:
# 1 <= nums.length <= 10
# -10 <= nums[i] <= 10
# All the numbers of nums are unique.

# @param {Integer[]} nums
# @return {Integer[][]}
# T(n) = O(2^n)
def subsets(nums)
  result = Array.new
  slate = Array.new
  helper(nums, 0, result, slate)
  return result
end

def helper(nums, idx, result, slate)
  if (idx == nums.length)
    result.push(slate.dup)
    return
  end

  # Include
  slate.push(nums[idx])
  helper(nums, idx+1, result, slate)
  slate.pop

  # Exclude
  helper(nums, idx+1, result, slate)
end


class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal([[1, 2, 3], [1, 2], [1, 3], [1], [2, 3], [2], [3], []], subsets([1,2,3]))
    assert_equal([[0],[]], subsets([0]))
  end
end 
