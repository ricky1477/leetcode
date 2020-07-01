
require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/intersection-of-two-arrays/
# 349. Intersection of Two Arrays
# Easy

# Given two arrays, write a function to compute their intersection.

# Example 1:

# Input: nums1 = [1,2,2,1], nums2 = [2,2]
# Output: [2]
# Example 2:

# Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
# Output: [9,4]
# Note:

# Each element in the result must be unique.
# The result can be in any order.


# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersection(nums1, nums2)
  #return nums1 & nums2
  intersection1 = Set.new
  intersection2 = Set.new
  
  nums1.each {|int| intersection1.add(int)}
  nums2.each {|int| intersection2.add(int)}
  
  if intersection1.length > intersection2.length 
    big, small = intersection1, intersection2
  else
    big, small, intersection= intersection2, intersection1
  end

  small.delete_if {|int| !big.include?(int)}
  #set.delete_if {|int| int.}
 
  small.to_a
 end

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal([2], intersection([1,2,2,1], [2,2]))
  end 
end

