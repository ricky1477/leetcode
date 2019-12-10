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


# Explanation
# https://www.geeksforgeeks.org/inplace-rotate-square-matrix-by-90-degrees/

def rotate(matrix)
  #print_matrix(matrix)
  last = matrix.size - 1
  level = 0
  # Consider all squares one by one 
  while level < matrix.size / 2
    # Consider elements in group    
    # of 4 in current square 
    (level..last-1).each do |i|
      # move values from right to top 
      swap(matrix, [level, i], [i, last])
      # p "[#{level},#{i}]|[#{i},#{last}]"
      # print_matrix(matrix)
      # move values from bottom to right 
      swap(matrix, [level, i], [last, last - i + level])
      # p "[#{level},#{i}]|[#{last},#{last -i + level}]"
      # print_matrix(matrix)
      # move values from left to bottom
      swap(matrix, [level, i], [last - i + level , level ])
      # p "[#{level},#{i}]|[#{last - i + level},#{level}]"
      # print_matrix(matrix)
    end
    level += 1
    last -= 1
  end
  matrix
end
  
# Helper method to swap array elements in place
def swap(matrix, x, y)
  tmp = matrix[x[0]][x[1]]
  matrix[x[0]][x[1]] = matrix[y[0]][y[1]]
  matrix[y[0]][y[1]] = tmp
end

def print_matrix(matrix)
  matrix.each {|r| puts r.inspect}
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
    ]
    output = [
      [15,13, 2, 5],
      [14, 3, 4, 1],
      [12, 6, 8, 9],
      [16, 7,10,11]
    ]
    #assert_equal(output, rotate(input))
    input = [
      [1,2,3,4],
      [5,6,7,8],
      [9,10,11,12],
      [13,14,15,16]
    ]
    output = [
      [13, 9, 5, 1],
      [14, 10, 6, 2],
      [15, 11, 7, 3],
      [16, 12, 8, 4]
    ]
    #assert_equal(output, rotate(input))
  end 
end

