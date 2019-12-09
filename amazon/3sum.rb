require "test/unit"

#https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/2966/

# 3Sum
# Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0?
# Find all unique triplets in the array which gives the sum of zero.

# Note:

# The solution set must not contain duplicate triplets.

# Example:

# Given array nums = [-1, 0, 1, 2, -1, -4],

# A solution set is:
# [
#   [-1, 0, 1],
#   [-1, -1, 2]
# ]

def three_sum(nums)
  return [] if nums.length < 3
  nums.sort!
  threes = []
  p (0...nums.length - 2)

  (0...nums.length - 2).each do |i|
    current_val = nums[i]
    p "#{i}|#{current_val}"

    # skips same value because value was previously processed, greatly improves runtime
    next if i > 0 && current_val == nums[i - 1]
    desired_val = 0 - current_val

    # reset left_i and right_i per iteration
    left_i, right_i = i + 1, nums.length - 1

    until left_i >= right_i
      left_val, right_val = nums[left_i], nums[right_i]
      total_val = left_val + right_val

      if total_val > desired_val
        right_i -= 1 
      elsif total_val < desired_val 
        left_i += 1 
      elsif total_val == desired_val
        three_sum = [left_val, right_val, current_val]
        threes.push(three_sum)

        # these loops will skip same element and fasten algorithm
        left_i += 1 while left_i < right_i && nums[left_i] == nums[left_i + 1]
        right_i -= 1 while left_i < right_i && nums[right_i] == nums[right_i - 1]

        right_i -= 1
        left_i += 1
      end 
    end 
  end
  threes.uniq # O(n) time, where n is length of threes array
end


class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal([[-1, 2, -1], [0, 1, -1]], three_sum([-1, 0, 1, 2, -1, -4]))
  end 
end
