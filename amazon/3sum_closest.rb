require "test/unit"

#https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/2967/

# 3Sum Closest
# Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. 
# Return the sum of the three integers. You may assume that each input would have exactly one solution.

# Example:

# Given array nums = [-1, 2, 1, -4], and target = 1.

# The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

def three_sum_closest(nums, target)
  nums.sort!
  result = nums.slice(0..2).sum
  0.upto(nums.size-2) do |i|
    j = i+1
    k = nums.size-1
    while j < k
      sum = nums[i]+nums[j]+nums[k]
      return sum if sum == target
      result = sum if (sum-target).abs < (result-target).abs
      if sum < target 
        j+=1
      else
        k-=1
      end
    end
  end
  result
end

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(2, three_sum_closest([-1,2,1,-4], 1))
  end 
end
