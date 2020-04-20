require "test/unit"

#https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/499/

# Product of Array Except Self
# Solution
# Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

# Example:

# Input:  [1,2,3,4]
# Output: [24,12,8,6]
# Note: Please solve it without division and in O(n).

# Follow up:
# Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)

# Times out
# def product_except_self(nums)
#   copy = nums.dup
#   product = Array.new
#   copy.each.with_index do |num,i|
#     nums.delete_at(i)
#     #p nums
#     #p nums.inject(:*)
#     product << nums.inject(:*)
#     #p new
#     nums = copy.dup
#   end
#   return product
# end

#make num a CONST?

def product_except_self(nums)
  output = Array.new(nums.length)
  product = 1
  for i in 0...nums.length
      product *= nums[i]
      output[i] = product
  end 
  # Each position will now contain the product of itself and all before it
  # Starting at the end, the value at [i - 1] will contain the product up to but not including the current value
  # this partial product * the product of all elements after the current position is what we want
  product = 1
  (nums.length - 1).downto(1) do |i|
    output[i] = product * output[i - 1]
    product *= nums[i]
  end
  # The first element will just be the final product
  output[0] = product
  return output
end

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal([24, 12, 8, 6], product_except_self([1,2,3,4]))
    assert_equal([0,1], product_except_self([1,0]))
  end 
end