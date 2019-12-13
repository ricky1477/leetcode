require "test/unit"

# https://leetcode.com/problems/spiral-matrix/


# 54. Spiral Matrix
# Medium

# Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

# Example 1:

# Input:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# Output: [1,2,3,6,9,8,7,4,5]
# Example 2:

# Input:
# [
#   [1, 2, 3, 4],
#   [5, 6, 7, 8],
#   [9,10,11,12]
# ]
# Output: [1,2,3,4,8,12,11,10,9,5,6,7]

# Explanation
# https://leetcode.com/problems/spiral-matrix/discuss/20571/1-liner-in-Python-%2B-Ruby

def spiral_matrix_one(matrix)
  (row = matrix.shift) ? row + spiral_matrix_one(matrix.transpose.reverse) : []
end

# 59. Spiral Matrix II
# Medium
# Given a positive integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.

# Example:

# Input: 3
# Output:
# [
#  [ 1, 2, 3 ],
#  [ 8, 9, 4 ],
#  [ 7, 6, 5 ]
# ]

def spiral_matrix_two(n)
  arr = Array.new(n){ Array.new(n) }
  # p arr
   
  i, j, di, dj = 0, 0, 0, 1
  (0...n*n).each do |k|
    arr[i][j] = k + 1 
    # p arr 
    
    di, dj = dj, -di if arr[(i+di)%n][(j+dj)%n]
    
    i += di
    j += dj
  end

  arr
end


class TestSpiralMatrix < Test::Unit::TestCase
  def test_one
    assert_equal([1,2,3,6,9,8,7,4,5], spiral_matrix_one([[1,2,3],[4,5,6],[7,8,9]]))
  end 
  def test_two
    assert_equal([[1]], spiral_matrix_two(1))
    assert_equal([[1,2],[4,3]], spiral_matrix_two(2))
    assert_equal([[1,2,3],[8,9,4],[7,6,5]], spiral_matrix_two(3))
  end 
end