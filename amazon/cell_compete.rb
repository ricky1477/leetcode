require "test/unit"

# Eight houses, represented as cells, are arranged in a straight line. Each day every cell competes with its adjacent cells (neighbors).
#  An integer value of 1 represents an active cell and a value of 0 represents an inactive cell. 
#  If the neighbors on both the sides of a cell are either active or inactive, the cell becomes inactive on the next day;
#   otherwise the cell becomes active. The two cells on each end have a single adjacent cell, 
#   so assume that the unoccupied space on the opposite side is an inactive cell. Even after updating the cell state, consider its previous 
#   state when updating the state of other cells. The state information of all cells should be updated simultaneously.


def cellCompete(states, days)
  # WRITE YOUR CODE HERE
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
    assert_equal([0,1,0,0,1,0,1,0], cellCompete([1,0,0,0,0,1,0,0],1))
    assert_equal([0,0,0,0,0,1,1,0], cellCompete([1,1,1,0,1,1,1,1],2))
    assert_equal([0,0,0,0,1,1,1,1], cellCompete([1,1,1,0,1,1,1,1],3))
  end 
end