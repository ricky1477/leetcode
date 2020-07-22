require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/transpose-matrix/
# 867. Transpose Matrix
# Given a matrix A, return the transpose of A.

# The transpose of a matrix is the matrix flipped over it's main diagonal,
# switching the row and column indices of the matrix.

# Example 1:
# Input: [[1,2,3],[4,5,6],[7,8,9]]
# Output: [[1,4,7],[2,5,8],[3,6,9]]

# Example 2:
# Input: [[1,2,3],[4,5,6]]
# Output: [[1,4],[2,5],[3,6]]
 
# Note:

# 1 <= A.length <= 1000
# 1 <= A[0].length <= 1000

# @param {Integer[][]} a
# @return {Integer[][]}
def transpose(a)
  # Declar a 2d array with height of width and with of height of original array
  b = Array.new(a.first.length){Array.new(a.length)}
  a.each_with_index do |arr, i|
    arr.each_with_index do |elem, j|
      # Insert in new array
      b[j][i] = elem
    end
  end    
  return b
end


# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal([[1,4,7],[2,5,8],[3,6,9]], transpose([[1,2,3],[4,5,6],[7,8,9]]))
    assert_equal([[1,4],[2,5],[3,6]], transpose([[1,2,3],[4,5,6]]))
  end
end
