require 'test/unit'
require 'byebug'

def minimumDays(rows, columns, grid)
  days = 0
  cells = []
  # All servers updated
  while(grid.flatten.uniq != [1])
    ones = find_all_ones(grid)
    ones.each do |one|
      cells = update_adj_cells(grid, one[0], one[1], cells)
    end
    days += 1
  end
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
  grid[i+1][j] = 1 if i < grid.length-1
  grid[i-1][j] = 1 if i > 0
  grid[i][j+1] = 1 if j < grid.length-1
  grid[i][j-1] = 1 if j > 0
end


class Test3SumClosest < Test::Unit::TestCase
  def test_simple
    assert_equal(2, minimumDays(4, 5, [[0,1,1,0,1],
                                       [0,1,0,1,0],
                                       [0,0,0,0,1],
                                       [0,1,0,0,0]]))

    assert_equal(4, minimumDays(5, 5, [[1,0,0,0,0],
                                       [0,1,0,0,0],
                                       [0,0,1,0,0],
                                       [0,0,0,1,0],
                                       [0,0,0,1,1]]))
    
    assert_equal(3, minimumDays(5, 6, [[0,0,1,0,0,0],
                                       [0,1,0,0,0,0],
                                       [0,0,0,0,0,1],
                                       [0,0,0,0,0,0],
                                       [0,1,0,0,0,0]]))
  end 
end

