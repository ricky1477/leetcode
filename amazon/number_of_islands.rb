require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/78/trees-and-graphs/894/
# Number of Islands

# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

# Example 1:

# Input:
# 11110
# 11010
# 11000
# 00000

# Output: 1
# Example 2:

# Input:
# 11000
# 11000
# 00100
# 00011

# Output: 3


def num_islands(grid)
  num_islands = 0
  (0...grid.length).each do |row_num|
    (0...grid[row_num].length).each do |column_num|
      num_islands += dfs(grid, row_num, column_num)
    end
  end
  num_islands
end

def dfs(grid, row_num, column_num)
  if row_num < 0 || column_num < 0 || row_num >= grid.length || column_num >= grid[row_num].length || grid[row_num][column_num] == "0"
    return 0
  end

  grid[row_num][column_num] = "0"
  dfs(grid, row_num - 1, column_num)
  dfs(grid, row_num + 1, column_num)
  dfs(grid, row_num, column_num - 1)
  dfs(grid, row_num, column_num + 1)
  return 1
end