
require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/
# 378. Kth Smallest Element in a Sorted Matrix
# Medium

# Given a n x n matrix where each of the rows and columns are sorted 
# in ascending order, find the kth smallest element in the matrix.

# Note that it is the kth smallest element in the sorted order, not
# the kth distinct element.

# Example:

# matrix = [
#    [ 1,  5,  9],
#    [10, 11, 13],
#    [12, 13, 15]
# ],
# k = 8,

# return 13.
# Note:
# You may assume k is always valid, 1 ≤ k ≤ n2.

# @param {Integer[][]} matrix
# @param {Integer} k
# @return {Integer}
def kth_smallest(matrix, k)
    
end

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(true, kth_smallest( [[1,1],[-1,1]] ))
    assert_equal(true, is_reflected( [[-1,1],[3,1]] ))
    assert_equal(true, is_reflected( [[1,1],[1,1],[1,1]] ))
  end 
end

