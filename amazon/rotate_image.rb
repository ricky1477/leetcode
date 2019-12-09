require "test/unit"

#https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/2969/

# Rotate Image
# You are given an n x n 2D matrix representing an image.

# Rotate the image by 90 degrees (clockwise).

# Note:

# You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. 
# DO NOT allocate another 2D matrix and do the rotation.

# Example 1:

# Given input matrix = 
# [
#   [1,2,3],
#   [4,5,6],
#   [7,8,9]
# ],

# rotate the input matrix in-place such that it becomes:
# [
#   [7,4,1],
#   [8,5,2],
#   [9,6,3]
# ]
# Example 2:

# Given input matrix =
# [
#   [ 5, 1, 9,11],
#   [ 2, 4, 8,10],
#   [13, 3, 6, 7],
#   [15,14,12,16]
# ], 

# rotate the input matrix in-place such that it becomes:
# [
#   [15,13, 2, 5],
#   [14, 3, 4, 1],
#   [12, 6, 8, 9],
#   [16, 7,10,11]
# ]


def rotate(matrix)
  n = matrix.size
  last = n - 1
  level = 0
  while level < n / 2
    (level..last-1).each do |i|
      swap(matrix, [level, i], [i, last])
      swap(matrix, [level, i], [last, last - i + level])
      swap(matrix, [level, i], [last - i + level , level ])
    end
    level += 1
    last -= 1
  end
  matrix
end
  
def swap(matrix, x, y)
  tmp = matrix[x[0]][x[1]]
  matrix[x[0]][x[1]] = matrix[y[0]][y[1]]
  matrix[y[0]][y[1]] = tmp
end

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    input = [
      [1,2,3],
      [4,5,6],
      [7,8,9]
    ]
    output = [
      [7,4,1],
      [8,5,2],
      [9,6,3]
    ]
    assert_equal(output, rotate(input))
    input = [
      [5, 1, 9,11],
      [2, 4, 8,10],
      [13, 3, 6, 7],
      [15,14,12,16]
    ], 
    output = [
      [15,13, 2, 5],
      [14, 3, 4, 1],
      [12, 6, 8, 9],
      [16, 7,10,11]
    ]
    assert_equal(output, rotate(input))
  end 
end

