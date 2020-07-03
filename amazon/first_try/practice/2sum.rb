require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/508/

# Given an array of integers, return indices of the two numbers such that they add up to a specific target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# Example:

# Given nums = [2, 7, 11, 15], target = 9,

# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}


# Brute force
=begin
def two_sum(nums, target)
  nums.each_with_index do |n, i|
    sub_array = nums[i+1..nums.length-1]
    #p "#{n}|#{sub_array}"
    sub_array.each_with_index do |m, j|
      # p "#{n}|#{m}"
      # p n+m
      # p "#{i}|#{j+1}" if n+m == target
      return [i,j+i+1] if n+m == target
    end
  end
  return []
end
=end


def two_sum(nums, target)
  # p "target:#{target}"
  nums.each_with_index do |n, i|
    complement = target - n
    # p "#{n}|#{complement}"
    sub_array = nums.dup
    sub_array.delete_at(i)
    # p sub_array
    if (sub_array.include?(complement))
      return [i,sub_array.index(complement)+1]
    end
  end
end


class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal([0,1], two_sum([2, 7, 11, 15],9))
    # p '------'
    assert_equal([0,2], two_sum([2, 7, 11, 15],13))
    # p '------'
    assert_equal([0,3], two_sum([2, 7, 11, 15],17))
    # p '------'
    assert_equal([1,2], two_sum([3, 2, 4],6))
    # p '------'
    assert_equal([0,1], two_sum([3, 3],6))
  end 
end
