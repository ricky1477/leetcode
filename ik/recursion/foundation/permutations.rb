require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/permutations/

# 46. Permutations
# Medium

# Given an array nums of distinct integers, return all the possible
#  permutations. You can return the answer in any order.

# Example 1:
# Input: nums = [1,2,3]
# Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

# Example 2:
# Input: nums = [0,1]
# Output: [[0,1],[1,0]]

# Example 3:
# Input: nums = [1]
# Output: [[1]]

# Constraints:
# 1 <= nums.length <= 6
# -10 <= nums[i] <= 10
# All the integers of nums are unique.

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  results = Set.new
  helper(nums, 0, results)
  results.to_a
end

def helper(nums, idx, results)
  if idx == nums.length
    list = nums.dup
    results << list
    return
  end

  for i in 0..nums.length-1 do
    # Swap
    nums[idx], nums[i], = nums[i], nums[idx]
    helper(nums, idx+1, results)
    nums[i], nums[idx], = nums[idx], nums[i]
  end
end


class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal([[3, 1, 2], [2, 3, 1], [2, 1, 3], [3, 2, 1], [1, 3, 2], [1, 2, 3]], permute([1,2,3]))
    assert_equal([[1,0],[0,1]], permute([0,1]))
    assert_equal([[1]], permute([1]))
  end
end 