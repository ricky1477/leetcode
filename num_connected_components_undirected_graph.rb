require 'test/unit'
require 'byebug'

# https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/
# 323. Number of Connected Components in an Undirected Graph
# Medium

# Given n nodes labeled from 0 to n - 1 and a list of undirected edges 
# (each edge is a pair of nodes), write a function to find the number of 
# connected components in an undirected graph.

# Example 1:

# Input: n = 5 and edges = [[0, 1], [1, 2], [3, 4]]

#      0          3
#      |          |
#      1 --- 2    4 

# Output: 2
# Example 2:

# Input: n = 5 and edges = [[0, 1], [1, 2], [2, 3], [3, 4]]

#      0           4
#      |           |
#      1 --- 2 --- 3

# Output:  1
# Note:
# You can assume that no duplicate edges will appear in edges. Since all
#  edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.


# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def count_components(n, edges)
  # Union find for undirected graphs
  parents = (0..n-1).to_a
  num_parents = n

  # Find how many parents there are
  edges.each do |i, j|
    a, b = find_final_parent(i,parents), find_final_parent(j,parents)
    # p "#{a}:#{b}"
    # Update parent
    parents[a] = b
    # If parents not same, it is same graph
    num_parents -= 1 if a != b
    # p '---' if a != b
  end
  
  return num_parents
end

def find_final_parent(edge, parents)
  if parents[edge] == edge
    edge
  else
    parents[edge] = find_final_parent(parents[edge], parents)
  end
end


# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(2, count_components(5, [[0, 1], [1, 2], [3, 4]]))
    assert_equal(1, count_components(5, [[0, 1], [1, 2], [2, 3], [3, 4]]))
  end 
end