require 'test/unit'
require 'byebug'
require 'set'

# 200
# https://leetcode.com/problems/number-of-islands/
# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  # two_d_array_pretty_print(grid)
  # p '---'
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
  # two_d_array_pretty_print(grid)
  # p '---'
  dfs(grid, row_num - 1, column_num)
  dfs(grid, row_num + 1, column_num)
  dfs(grid, row_num, column_num - 1)
  dfs(grid, row_num, column_num + 1)
  return 1
end

def two_d_array_pretty_print(arr)
  puts arr.map { |x| x.join(' ') }
end


class TestClass < Test::Unit::TestCase
  def test_simple
    grid = [
      ["1","1","1","1","0"],
      ["1","1","0","1","0"],
      ["1","1","0","0","0"],
      ["0","0","0","0","0"]
    ]
    assert_equal(1, num_islands(grid))
  end
end
