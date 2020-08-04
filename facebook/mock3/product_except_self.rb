require "test/unit"

# Given an array nums of n integers where n > 1,  return an array output
#  such that output[i] is equal to the product of all the elements of 
#  nums except nums[i].

# Example:

# Input:  [1,2,3,4]
# Output: [24,12,8,6]
# Constraint: It's guaranteed that the product of the elements of any 
# prefix or suffix of the array (including the whole array) fits in a 
# 32 bit integer.

# Note: Please solve it without division and in O(n).

# Follow up:
# Could you solve it with constant space complexity? (The output array 
#   does not count as extra space for the purpose of space complexity analysis.)


# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  # product = nums.inject(&:*)
  nums << 1
  nums.unshift(1)
  output = []
  left = []
  right = []
  p nums
  nums.each_with_index do |num, idx|
    p num
    left << nums[0..idx].inject(&:*)
    right << nums[idx+1..nums.length-1].inject(&:*)
    # output << left[idx] * right[idx]
    # p "#{left}|#{right}|#{output}"
  end

  left.delete_at(right.size - 1)
  right.delete_at(0)
  p left
  p right
  p right[0..right.size - 2]
  right[0..right.size - 2].each_with_index do |num, i|
    p left[i]
    p right[i]
    output << right[i] * left[i]
  end

  output
end

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal([24,12,8,6], product_except_self([1,2,3,4]))
  end 
end