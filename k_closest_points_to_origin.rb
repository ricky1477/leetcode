require 'test/unit'
require 'byebug'

# https://leetcode.com/problems/k-closest-points-to-origin/
# 973. K Closest Points to Origin
# Medium

# We have a list of points on the plane.  Find the K closest points to the origin (0, 0).

# (Here, the distance between two points on a plane is the Euclidean distance.)

# You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)

 

# Example 1:

# Input: points = [[1,3],[-2,2]], K = 1
# Output: [[-2,2]]
# Explanation: 
# The distance between (1, 3) and the origin is sqrt(10).
# The distance between (-2, 2) and the origin is sqrt(8).
# Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
# We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].
# Example 2:

# Input: points = [[3,3],[5,-1],[-2,4]], K = 2
# Output: [[3,3],[-2,4]]
# (The answer [[-2,4],[3,3]] would also be accepted.)
 

# Note:

# 1 <= K <= points.length <= 10000
# -10000 < points[i][0] < 10000
# -10000 < points[i][1] < 10000



# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
def k_closest(points, k)
  q = PriorityQueue.new
  points_hash = {}
  res = []
  points.each do |point|
    points_hash[point] = distance(point)
    q << distance(point)
  end
  closest = q.elements[1..-1].last(k)
  # p closest
  closest.each do |c| 
    res << points_hash.key(c)
    points_hash.delete(points_hash.key(c))
  end

  return res
end

def distance(point)
  Math.sqrt(point[0]**2 + point[1]**2)
end

class PriorityQueue
  attr_accessor :elements

  def initialize
    @elements = [nil]
  end

  def <<(element)
    @elements << element
    # bubble up the element that we just added
    bubble_up(@elements.size - 1)
  end
  
  def bubble_up(index)
    parent_index = (index / 2)

    # return if we reach the root element
    return if index <= 1

    # or if the parent is already greater than the child
    return if @elements[parent_index] <= @elements[index]

    # otherwise we exchange the child with the parent
    exchange(index, parent_index)

    # and keep bubbling up
    bubble_up(parent_index)
  end

  def exchange(source, target)
    @elements[source], @elements[target] = @elements[target], @elements[source]
  end
end


# q = PriorityQueue.new
# q << 2
# q << 3
# q << 1
# p q

# p q2

# p k_closest([[1,3],[-2,2]],1)
# p k_closest([[3,3],[5,-1],[-2,4]],2)
 

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP


class TestClass < Test::Unit::TestCase
  def test_simple
    # assert_equal([[-2,2]], k_closest([[1,3],[-2,2]],1))
    # assert_equal([[3,3],[-2,4]], k_closest([[3,3],[5,-1],[-2,4]],2))
    # assert_equal([[0,1],[1,0]], k_closest([[0,1],[1,0]],2))
    assert_equal([[2,31],[-27,-38],[-55,-39],[-57,-67],[34,-84]], k_closest([[68,97],[34,-84],[60,100],[2,31],[-27,-38],[-73,-74],[-55,-39],[62,91],[62,92],[-57,-67]],5))

  end 
end
