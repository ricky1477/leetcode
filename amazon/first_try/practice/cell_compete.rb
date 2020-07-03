require "test/unit"

# Eight houses, represented as cells, are arranged in a straight line. Each day every cell competes with its adjacent cells (neighbors).
#  An integer value of 1 represents an active cell and a value of 0 represents an inactive cell. 
#  If the neighbors on both the sides of a cell are either active or inactive, the cell becomes inactive on the next day;
#   otherwise the cell becomes active. The two cells on each end have a single adjacent cell, 
#   so assume that the unoccupied space on the opposite side is an inactive cell. Even after updating the cell state, consider its previous 
#   state when updating the state of other cells. The state information of all cells should be updated simultaneously.


def cellCompete(states, days)
  a=*(1..days).each do |int|
    #p int
    hash = Hash[(0...states.size).zip states]
    hash[-1] = 0
    hash[states.size] = 0
    states.each.with_index do |state, i|
      #p "#{hash[i-1]}|#{state}|#{hash[i+1]}"
      hash[i-1] == hash[i+1] ? states[i] = 0 : states[i] = 1
    end
    #p states
  end
  return states
end


class TestCellCompete < Test::Unit::TestCase
  def test_simple
    # assert_equal([0,1,0,0,1,0,1,0], cellCompete([1,0,0,0,0,1,0,0],1))
    # assert_equal([0,0,0,0,0,1,1,0], cellCompete([1,1,1,0,1,1,1,1],2))
    # assert_equal([0,0,0,0,1,1,1,1], cellCompete([1,1,1,0,1,1,1,1],3))
  end 
end


# 957. Prison Cells After N Days
# Medium
# There are 8 prison cells in a row, and each cell is either occupied or vacant.

# Each day, whether the cell is occupied or vacant changes according to the following rules:

# If a cell has two adjacent neighbors that are both occupied or both vacant, then the cell becomes occupied.
# Otherwise, it becomes vacant.
# (Note that because the prison is a row, the first and the last cells in the row can't have two adjacent neighbors.)

# We describe the current state of the prison in the following way: cells[i] == 1 if the i-th cell is occupied, else cells[i] == 0.

# Given the initial state of the prison, return the state of the prison after N days (and N such changes described above.)

# Example 1:
# Input: cells = [0,1,0,1,1,0,0,1], N = 7
# Output: [0,0,1,1,0,0,0,0]
# Explanation: 
# The following table summarizes the state of the prison on each day:
# Day 0: [0, 1, 0, 1, 1, 0, 0, 1]
# Day 1: [0, 1, 1, 0, 0, 0, 0, 0]
# Day 2: [0, 0, 0, 0, 1, 1, 1, 0]
# Day 3: [0, 1, 1, 0, 0, 1, 0, 0]
# Day 4: [0, 0, 0, 0, 0, 1, 0, 0]
# Day 5: [0, 1, 1, 1, 0, 1, 0, 0]
# Day 6: [0, 0, 1, 0, 1, 1, 0, 0]
# Day 7: [0, 0, 1, 1, 0, 0, 0, 0]

# Example 2:
# Input: cells = [1,0,0,1,0,0,1,0], N = 1000000000
# Output: [0,0,1,1,1,1,1,0]


###Time Limit Exceeded (TLE)
# def prison_after_n_days(cells, n)
#   a=*(1..n).each do |int|
#     #p int
#     hash = Hash[(0...cells.size).zip cells]
#     hash[-1] = nil
#     hash[cells.size] = nil
#     cells.each.with_index do |cell, i|
#       #p "#{hash[i-1]}|#{cell}|#{hash[i+1]}"
#       hash[i-1] == hash[i+1] ? cells[i] = 1 : cells[i] = 0
#     end
#     #p cells
#   end
#   return cells    
# end

def prison_after_n_days(cells, n)
  tmp = cells.dup
  n = (n - 1) % 14 + 1
  p n
  n.times do
    cells.each_with_index do |num, i|
        # Check first and last
        if i == 0 || i == cells.length - 1
          tmp[i] = 0
          next
        end
        if (cells[i-1] == 0 && cells[i+1] == 0) || (cells[i-1] == 1 && cells[i+1] == 1)
          tmp[i] = 1
        else
          tmp[i] = 0
        end
    end
    cells = tmp.dup
  end
  cells = tmp.dup
end

class TestPrison < Test::Unit::TestCase
  def test_simple
    assert_equal([0, 1, 1, 0, 0, 0, 0, 0], prison_after_n_days([0,1,0,1,1,0,0,1],1))
    assert_equal([0, 0, 0, 0, 1, 1, 1, 0], prison_after_n_days([0,1,0,1,1,0,0,1],2))
    assert_equal([0, 1, 1, 0, 0, 1, 0, 0], prison_after_n_days([0,1,0,1,1,0,0,1],3))
  end 
end

