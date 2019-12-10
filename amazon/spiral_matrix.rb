require "test/unit"

# https://leetcode.com/problems/spiral-matrix/


# 54. Spiral Matrix
# Medium

# Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

# Example 1:

# Input:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# Output: [1,2,3,6,9,8,7,4,5]
# Example 2:

# Input:
# [
#   [1, 2, 3, 4],
#   [5, 6, 7, 8],
#   [9,10,11,12]
# ]
# Output: [1,2,3,4,8,12,11,10,9,5,6,7]

def spiral_order(n)
    spiralMatrix = Array.new(n) { Array.new(n) }
    return spiralMatrix if n == 0

    left=0
    right=spiralMatrix[0].length-1
    top=0
    bottom=spiralMatrix.length-1
    direction=0
    k=1
    while(left <= right && top <= bottom)
        if(direction == 0)
            left.upto(right) do |i|
                spiralMatrix[top][i]=k
                k += 1
            end
            top += 1
        elsif(direction == 1)
            top.upto(bottom) do |i|
                spiralMatrix[i][right]=k
                k += 1
            end
            right-=1
        elsif(direction == 2)
             right.downto(left) do |i|
                spiralMatrix[bottom][i]=k
                k+=1
             end
            bottom-=1
        elsif(direction == 3)
            bottom.downto(top) do |i|
                spiralMatrix[i][left]=k
                k+=1
            end
            left+=1
        end
        direction=(direction+1) % 4
    end
    return spiralMatrix
end

## FAILS!!

## DON'T USE ME

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal([1,2,3,6,9,8,7,4,5], spiral_order([[1,2,3],[4,5,6],[7,8,9]]))
  end 
end