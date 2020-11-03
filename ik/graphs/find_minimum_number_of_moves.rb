# Knight's Tour On A Chess Board

# Knight's Tour On A Chess Board


# You are given a rows * cols chessboard and a knight that moves like in normal chess. Currently knight is at starting position denoted by start_row th row and start_col th col, and want to reach at ending position denoted by end_row th row and end_col th col.  The goal is to calculate the minimum number of moves that the knight needs to take to get from starting position to ending position.

# start_row, start_col, end_row and end_col are 0-indexed. 


# Example

# Input:

# rows = 5

# cols = 5

# start_row = 0

# start_col = 0

# end_row = 4

# end_col = 1


# Output: 3


# 3 moves to reach from (0, 0) to (4, 1):

# (0, 0) -> (1, 2) -> (3, 3) -> (4, 1). 


# Notes

# Input Parameters:

# There are six arguments. First is an integer denoting rows, second is an integer denoting cols, third is an integer denoting start_row, fourth is an integer denoting start_col, fifth is an integer denoting end_row and sixth is an integer denoting end_col.


# Output: Return an integer.

# If it is possible to reach from starting position to ending position then return the minimum number of moves that the knight needs to take to get from starting position to ending position.

# If it is not possible to reach from starting position to ending position then return -1.


# Constraints:

#     1 <= rows * cols <= 10^5
#     0 <= start_row, end_row < rows
#     0 <= start_col, end_col < cols


# Complete the find_minimum_number_of_moves function below.
def find_minimum_number_of_moves(rows, cols, start_row, start_col, end_row, end_col)
  # Build board
  board = Array.new(rows) {Array.new(cols,0)}
  # Print board nicely
  p puts board.map { |x| x.join(' ') }
  parent, pos = min_moves(board, start_row, start_col, end_row, end_col)
  p parent
  
  cur = pos
  layers = 0
  while(cur != [end_row, end_col])
      layers += 1
      parent[cur].include?()
  end
  p 'done---'
end

# Can't figure out how to track depth level
def min_moves(board, start_row, start_col, end_row, end_col)
  queue = []
  q = []
  visited = {}
  parent = {}
  
  queue.unshift([start_row, start_col])
  q.unshift(pos: [start_row, start_col], moves: 0)
  p queue
  
  get_moves(board, start_row, start_col)
  get_moves(board, 2, 2)
  idx = 0
  
  # while (!queue.empty?)
  #     c = q.pop
      
  # end
  
  
  
  p 'into while'
  while (!queue.empty?)
      #layers = 0
      cur = queue.pop
      c = q.pop
      p c
      m = c[:moves]
      #layers += 1
      p cur
      visited[cur] = 1
      # p visited
      moves = get_moves(board, cur[0], cur[1])
      # p moves
      moves.each do |pos|
          p "checking #{pos}"
          if !visited.include?([pos])
              queue.unshift(pos)
              q.push(pos: pos, moves: m+1)
              visited[pos] = 1
              (parent[pos] ||= []) << cur
              if pos == [end_row, end_col]
                p 'fend it'
                # p "layers#{layers}"
                p 'parent'
                p parent
                p parent[pos]
                p queue
                p '-q-'
                p q
                return parent, pos 
              end
              # parent[pos].delete(pos)
              # p[[2,1]].delete([4,2])
              # layers -= 1
          end
      end
      p 'not found'
      p q[0][:moves] m-1
      #p "layers#{layers}"
      # p cur
  end
  
  p '-end-'
end

def get_moves(board, start_row, start_col)
  moves = []
  if start_row+2 >= 0 && start_row+2 < board[0].length
      moves << [start_row+2, start_col-1] if start_col-1 >= 0 && start_col-1 < board[0].length
      moves << [start_row+2, start_col+1] if start_col+1 >= 0 && start_col+1 < board[0].length
  end
  
  if start_row-2 >= 0 && start_row-2 < board[0].length
      moves << [start_row-2, start_col-1] if start_col-1 >= 0 && start_col-1 < board[0].length
      moves << [start_row-2, start_col+1] if start_col+1 >= 0 && start_col+1 < board[0].length
  end
  
  if start_row+1 >= 0 && start_row+1 < board[0].length
      moves << [start_row+1, start_col+2] if start_col+2 >= 0 && start_col+2 < board[0].length
      moves << [start_row+1, start_col-2] if start_col-2 >= 0 && start_col-2 < board[0].length
  end
  
  if start_row-1 >= 0 && start_row-1 < board[0].length
      moves << [start_row-1, start_col+2] if start_col+2 >= 0 && start_col+2 < board[0].length
      moves << [start_row-1, start_col-2] if start_col-2 >= 0 && start_col-2 < board[0].length
  end
  
  moves
end


# Example
# Input:

# rows = 5
# cols = 5
# start_row = 0
# start_col = 0
# end_row = 4
# end_col = 1

# 5
# 5
# 0
# 0
# 4
# 1


# Output: 3
# 3 moves to reach from (0, 0) to (4, 1):
# (0, 0) -> (1, 2) -> (3, 3) -> (4, 1). 