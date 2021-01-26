require 'test/unit'
require 'byebug'
require 'set'

# 261
# https://leetcode.com/problems/graph-valid-tree/

# A graph is a valid tree if there no cycles
# We detect cycles by checking the parent which can detect a cross edge (BFS)
# and back edge (DFS).  Presence of back/cross adge detects cycles.

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Boolean}
def valid_tree(n, edges)
  adjacency_list = adj_list(edges)
  visited = Array.new(n, -1)

  no_cycles = dfs(edges, 0, -1, visited, adjacency_list)

  p '---'
  p !visited.include?(-1)
  p no_cycles
  return !visited.include?(-1) && no_cycles
end

def dfs(edges, source, parent, visited, adjacency_list)
  return false if visited[source] == 1
  visited[source] = 1
  p visited
  adjacency_list[source].each do |neighbor|
    if parent != neighbor
      result = dfs(edges, neighbor, source, visited, adjacency_list) 
      return false unless result
    end
  end
  return true
end

def adj_list(edges)
  adj_list = Hash.new { |h, k| h[k] = [] }
  edges.each do |src, dst|
    adj_list[src] << dst
    # For undirected graphs
    adj_list[dst] << src
  end
  adj_list
end

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(false, valid_tree(5, [[0, 1], [1, 2], [3, 4]]))
    assert_equal(true, valid_tree(5, [[0,1], [0,2], [0,3], [1,4]]))
    assert_equal(false, valid_tree(5, [[0,1], [1,2], [2,3], [1,3], [1,4]]))
  end
end 