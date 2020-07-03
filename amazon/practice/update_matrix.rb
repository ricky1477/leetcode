require 'test/unit'
require 'byebug'

# 542. 01 Matrix
# Medium

# Given a matrix consists of 0 and 1, find the distance of the nearest 0 for each cell.

# The distance between two adjacent cells is 1.


# Example 1:
# Input:
# [[0,0,0],
#  [0,1,0],
#  [0,0,0]]

# Output:
# [[0,0,0],
#  [0,1,0],
#  [0,0,0]]

# Example 2:

# Input:
# [[0,0,0],
#  [0,1,0],
#  [1,1,1]]

# Output:
# [[0,0,0],
#  [0,1,0],
#  [1,2,1]]

# Note:

# The number of elements of the given matrix will not exceed 10,000.
# There are at least one 0 in the given matrix.
# The cells are adjacent in only four directions: up, down, left and right.

def update_matrix(matrix)
  m = matrix.size
  n = matrix[0].size
  queue = []
  (0...m).each do |i|
      (0...n).each do |j|
          if matrix[i][j] == 0
              queue << [i,j]
          else
              matrix[i][j] = 2**31 - 1
          end
          p matrix
      end
  end
  dirs = [[-1,0],[1,0],[0,-1],[0,1]]
  while !queue.empty?
      cell = queue.shift
      dirs.each do |d|
          r = cell[0] + d[0]
          c = cell[1] + d[1]
          next if r < 0 || r >= m || c < 0 || c >= n || matrix[r][c] <= matrix[cell[0]][cell[1]] + 1
          queue << [r,c]
          matrix[r][c] = matrix[cell[0]][cell[1]] + 1
      end
  end
  return matrix
end

class TestTopKfrequent < Test::Unit::TestCase
  def test_simple
    assert_equal([[0,0,0],
    [0,1,0],
    [1,2,1]], update_matrix([[0,0,0],
    [0,1,0],
    [1,1,1]]))

  end 
end