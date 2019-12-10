require "test/unit"

# https://leetcode.com/problems/rotting-oranges/

# 994. Rotting Oranges
# Easy

# In a given grid, each cell can have one of three values:

# the value 0 representing an empty cell;
# the value 1 representing a fresh orange;
# the value 2 representing a rotten orange.
# Every minute, any fresh orange that is adjacent (4-directionally) to a rotten orange becomes rotten.

# Return the minimum number of minutes that must elapse until no cell has a fresh orange.  If this is impossible, return -1 instead.

# Example 1:
# Input: [[2,1,1],[1,1,0],[0,1,1]]
# Output: 4

# Example 2:
# Input: [[2,1,1],[0,1,1],[1,0,1]]
# Output: -1
# Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.

# Example 3:

# Input: [[0,2]]
# Output: 0
# Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.
 

# Note:

# 1 <= grid.length <= 10
# 1 <= grid[0].length <= 10
# grid[i][j] is only 0, 1, or 2.

def oranges_rotting(grid)
  return 0 if count_fresh(grid) == 0
  count = 1
  print_grid(grid)
  p count_fresh(grid)
  p find_all_rotten(grid)
  p find_all_rotten_adj(grid).flatten.uniq
  while count_fresh(grid) > 0
    find_all_rotten(grid).each do |pos|
      rot_adjacent(grid, pos[0], pos[1])
    end
    break unless find_all_rotten_adj(grid).flatten.uniq.include?(1)
    count+=1
  end
  return count_fresh(grid) == 0 ? count:-1
end

def print_grid(grid)
  grid.each {|r| puts r.inspect}
end

def rot_adjacent(grid, x, y)
  grid[x+1][y] = 2 if ( x < grid.length-1 && grid[x+1][y] == 1)
  grid[x-1][y] = 2 if ( x > 0 && grid[x-1][y] == 1)
  grid[x][y+1] = 2 if ( y < grid.length-1 && grid[x][y+1] == 1)
  grid[x][y-1] = 2 if ( y > 0 && grid[x][y-1] == 1)
end

def find_all_rotten_adj(grid)
  adj = []
  find_all_rotten(grid).each do |pos|
    adj << adj_cells(grid, pos[0], pos[1])
  end
  return adj
end

def adj_cells(grid, i, j)
  cells = []
  cells << grid[i+1][j] if i < grid.length-1
  cells << grid[i-1][j] if i > 0
  cells << grid[i][j+1] if j < grid.length-1
  cells << grid[i][j-1] if j > 0
  # cells << grid[i+1][j] if i+1 < grid.length
  # cells << grid[i-1][j] if i-1 >= 0
  # cells << grid[i][j+1] if j+1 < grid[0].length
  # cells << grid[i][j-1] if j-1 >= 0
end

def count_fresh(grid)
  count_fresh = 0
  grid.each do |row|
    count_fresh += row.count{|x| x == 1}
  end
  return count_fresh
end

def find_all_rotten(grid)
  rotten = []
  grid.each_with_index do |row,i|
    row.each_with_index do |x,j|
      rotten << [i,j] if x == 2
    end
  end
  return rotten
end


class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(2, oranges_rotting([[1,1,1],[1,2,1],[1,1,1]]))
    assert_equal(4, oranges_rotting([[2,1,1],[1,1,0],[0,1,1]]))
    assert_equal(-1, oranges_rotting([[2,1,1],[0,1,1],[1,0,1]]))
    assert_equal(0, oranges_rotting([[0,2]]))
    #assert_equal(1, oranges_rotting([[2,1,0,2]])) DOESN"T WORK for non-square matrices
end