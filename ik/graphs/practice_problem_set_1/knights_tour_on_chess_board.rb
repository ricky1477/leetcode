require 'test/unit'
require 'byebug'
require 'set'

# https://uplevel.interviewkickstart.com/resource/rc-codingproblem-5681-40770-54-332

# Complete the find_minimum_number_of_moves function below.
def find_minimum_number_of_moves(rows, cols, start_row, start_col, end_row, end_col)
  # Starting position is the same as destination
  return 0 if start_row == end_row && start_col == end_col
  queue = []

  # Build board
  distance_board = Array.new(rows) {Array.new(cols,-1)}

  queue << [start_row,start_col]
  distance_board[start_row][start_col] = 0

  # # Print board nicely
  # two_d_array_pretty_print(distance_board)

  # BFS
  while !queue.empty?
    curr_row,curr_col= queue.shift()
    adjList = adj_list(rows,cols,curr_row,curr_col)
    adjList.each do |item|
      adj_row,adj_col = item
      # If location hadn't been previously moved to..
      if (distance_board[adj_row][adj_col] == -1)
        distance_board[adj_row][adj_col] = distance_board[curr_row][curr_col] + 1
        # We've found the end position
        return distance_board[end_row][end_col] if adj_row == end_row && adj_col == end_col
        queue << item
      end 
    end
  end
  # Ending location not found
  -1 
end

def adj_list(rows,cols,start_row,start_col)
  list = [ 
    [start_row-2,start_col-1],[start_row-2,start_col+1],
    [start_row+2,start_col+1],[start_row+2,start_col-1],
    [start_row-1,start_col+2],[start_row+1,start_col+2],
    [start_row-1,start_col-2],[start_row+1,start_col-2]
  ]
  list.select{|r,c| 0 <= r && r < rows && 0 <= c && c < cols}
end

def two_d_array_pretty_print(arr)
  puts arr.map { |x| x.join(' ') }
end


class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(3, find_minimum_number_of_moves(5,5,0,0,4,1))
  end
end
