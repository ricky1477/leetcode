
require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/line-reflection/
# 356. Line Reflection
# Medium

# Given n points on a 2D plane, find if there is such a line parallel to y-axis that reflect the given points symmetrically, in other words, answer whether or not if there exists a line that after reflecting all points over the given line the set of the original points is the same that the reflected ones.

# Note that there can be repeated points.

# Follow up:
# Could you do better than O(n2) ?

 

# Example 1:


# Input: points = [[1,1],[-1,1]]
# Output: true
# Explanation: We can choose the line x = 0.
# Example 2:


# Input: points = [[1,1],[-1,-1]]
# Output: false
# Explanation: We can't choose a line.
 

# Constraints:

# n == points.length
# 1 <= n <= 10^4
# -10^8 <= points[i][j] <= 10^8

# @param {Integer[][]} points
# @return {Boolean}
def is_reflected(points)
  min_x = (2**31)-1
  max_x = -(2**31)-1
  
  pt_set = Set.new
  # Add points to set and find min and max
  points.each do |pt|
    min_x = [min_x,pt[0]].min
    max_x = [max_x,pt[0]].max
    pt_set << pt
  end

  # Acts a line reflection checker
  sum = max_x + min_x

  # If any point does not have reflection, return false
  pt_set.each do |pt|
    return false unless pt_set.include?([sum-pt[0],pt[1]])    
  end
  
  return true
end

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(true, is_reflected( [[1,1],[-1,1]] ))
    assert_equal(true, is_reflected( [[-1,1],[3,1]] ))
    assert_equal(true, is_reflected( [[1,1],[1,1],[1,1]] ))
  end 
end

