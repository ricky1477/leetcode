require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/81/design/517/

# Design Tic-Tac-Toe
# Design a Tic-tac-toe game that is played between two players on a n x n grid.

# You may assume the following rules:

# A move is guaranteed to be valid and is placed on an empty block.
# Once a winning condition is reached, no more moves is allowed.
# A player who succeeds in placing n of their marks in a horizontal, vertical, or diagonal row wins the game.
# Example:
# Given n = 3, assume that player 1 is "X" and player 2 is "O" in the board.

# TicTacToe toe = new TicTacToe(3);

# toe.move(0, 0, 1); -> Returns 0 (no one wins)
# |X| | |
# | | | |    // Player 1 makes a move at (0, 0).
# | | | |

# toe.move(0, 2, 2); -> Returns 0 (no one wins)
# |X| |O|
# | | | |    // Player 2 makes a move at (0, 2).
# | | | |

# toe.move(2, 2, 1); -> Returns 0 (no one wins)
# |X| |O|
# | | | |    // Player 1 makes a move at (2, 2).
# | | |X|

# toe.move(1, 1, 2); -> Returns 0 (no one wins)
# |X| |O|
# | |O| |    // Player 2 makes a move at (1, 1).
# | | |X|

# toe.move(2, 0, 1); -> Returns 0 (no one wins)
# |X| |O|
# | |O| |    // Player 1 makes a move at (2, 0).
# |X| |X|

# toe.move(1, 0, 2); -> Returns 0 (no one wins)
# |X| |O|
# |O|O| |    // Player 2 makes a move at (1, 0).
# |X| |X|

# toe.move(2, 1, 1); -> Returns 1 (player 1 wins)
# |X| |O|
# |O|O| |    // Player 1 makes a move at (2, 1).
# |X|X|X|
# Follow up:
# Could you do better than O(n2) per move() operation?

#    Hide Hint #1  
# Could you trade extra space such that move() operation can be done in O(1)?
#    Hide Hint #2  
# You need two arrays: int rows[n], int cols[n], plus two variables: diagonal, anti_diagonal.

# to check if row, col or diagonal is finished and won
class BoardStat
  attr_accessor :free, :size, :status
  
  def initialize(n)
    @size = n
    @free = n
    @status = 0
  end
  
  def add(player) 
    @free -= 1
    if @status == 0 || @status == player
      @status = player
    else
      @status = -1
    end
  end
  
  def won?
    @status > 0 && @free == 0
  end
end

class TicTacToe
  attr_accessor :row, :col, :size
=begin
  Initialize your data structure here.
  :type n: Integer
=end
  def initialize(n)
    # @field = Array.new(n, Array.new(n, nil))
    @diagonal = [BoardStat.new(n), BoardStat.new(n)]
    @row = Array.new(n)
    @col = Array.new(n)
    @row.each_with_index do |_,k|
      @row[k] = BoardStat.new(n)
      @col[k] = BoardStat.new(n)
      @size = n
    end
  end


=begin
  Player {player} makes a move at ({row}, {col}).
      @param row The row of the board.
      @param col The column of the board.
      @param player The player, can be either 1 or 2.
      @return The current winning condition, can be either:
              0: No one wins.
              1: Player 1 wins.
              2: Player 2 wins.
  :type row: Integer
  :type col: Integer
  :type player: Integer
  :rtype: Integer
=end
  def move(row, col, player)
    @diagonal[0].add(player) if col == row
    @diagonal[1].add(player) if col == @size - row - 1
    @row[row].add(player)
    @col[col].add(player)
    return player if @row[row].won? || @col[col].won? || @diagonal[0].won? || @diagonal[1].won?
    0
  end
end