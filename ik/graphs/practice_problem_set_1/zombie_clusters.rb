require 'test/unit'
require 'byebug'
require 'set'

# https://uplevel.interviewkickstart.com/resource/rc-codingproblem-5681-40770-54-335

# Complete the 'zombieCluster' function below.

# The function accepts STRING ARRAY as parameter.
#
# def zombieCluster(zombies)
#   num_clusters = 0
#   zombies = zombies.map {|str| str.split('')}
#   (0...zombies.length).each do |row_num|
#     (0...zombies[row_num].length).each do |column_num|
#       num_clusters += dfs(zombies, row_num, column_num)
#     end
#   end
#   num_clusters
# end

# def dfs(grid, row_num, column_num)
#   if row_num < 0 || column_num < 0 || row_num >= grid.length || column_num >= grid[row_num].length || grid[row_num][column_num] == "0"
#     return 0
#   end

#   grid[row_num][column_num] = "0"
#   dfs(grid, row_num - 1, column_num)
#   dfs(grid, row_num + 1, column_num)
#   dfs(grid, row_num, column_num - 1)
#   dfs(grid, row_num, column_num + 1)
#   return 1
# end


# def two_d_array_pretty_print(arr)
#   puts arr.map { |x| x.join(' ') }
# end


def zombieCluster(zombies)
  return 0 if zombies.empty?
  zombies = zombies.map {|row| row.chars }
  clusters = 0
  visited = []
  
  for i in 0...zombies.size
    if visited[i].nil?
      clusters += 1
      dfs(i, zombies, visited)
    end
  end
  clusters
end

def dfs(node, zombies, visited)
  return if visited[node] || node.nil?
  visited[node] = true
  p visited
  for i in 0...zombies.size do
    neighbor = zombies[node][i].to_i
    if neighbor == 1 && visited[i].nil?
      dfs(i, zombies, visited)
    end
  end
end



class TestClass < Test::Unit::TestCase
  def test_simple
    # grid = [
    #   ["1","1","0","0"],
    #   ["1","1","1","0"],
    #   ["0","1","1","0"],
    #   ["0","0","0","1"]
    # ]
    grid = [
      '1100',
      '1110',
      '0110',
      '0001'
    ]
    assert_equal(2, zombieCluster(grid))

    # grid = [
    #   ["1","0","0","0","0"],
    #   ["0","1","0","0","0"],
    #   ["0","0","1","0","0"],
    #   ["0","0","0","1","0"],
    #   ["0","0","0","0","1"]
    # ]
    grid = [
      '10000',
      '01000',
      '00100',
      '00010',
      '00001'
    ]
    assert_equal(5, zombieCluster(grid))
  end
end
