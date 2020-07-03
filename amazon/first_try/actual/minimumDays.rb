require 'test/unit'
require 'byebug'
require 'set'

def minimumDays(rows, columns, grid)
  # WRITE YOUR CODE HERE
  days = 0
  cells = []

  #print_matrix(grid)
  # p grid.length
  # p '-----'
  ones = find_all_ones(grid)
  # p ones
  # p update_adj_cells(grid, 0, 0, cells)

  # All servers updated
  while(grid.flatten.uniq != [1])
    ones = find_all_ones(grid)
    ones.each do |one|
      cells = update_adj_cells(grid, one[0], one[1], cells)
    end
    days += 1
  end

  # p cells
  # p '-----'
  #print_matrix(grid)
  return days
end

def find_all_ones(grid)
  ones = []
  grid.each_with_index do |row,i|
    row.each_with_index do |x,j|
      ones << [i,j] if x == 1
    end
  end
  return ones
end

def update_adj_cells(grid, i, j, adj_cells)
  if i < grid.length-1
    grid[i+1][j] = 1
  end
  if i > 0
    grid[i-1][j] = 1
  end
  if j < grid.length-1
    grid[i][j+1] = 1
  end
  if j > 0
    grid[i][j-1] = 1
  end
end

def print_matrix(matrix)
  matrix.each {|r| puts r.inspect}
end


class Test3SumClosest < Test::Unit::TestCase
  def test_simple
    assert_equal(2, minimumDays(4, 5, [[0,1,1,0,1],
                                       [0,1,0,1,0],
                                       [0,0,0,0,1],
                                       [0,1,0,0,0]]))
  end 
end

