require 'test/unit'
require 'byebug'
require 'set'

# 785
# https://leetcode.com/problems/is-graph-bipartite/

# A graph is bipartite if we can split its set of nodes into two
# independent subsets A and B, such that every edge in the graph
# has one node in A and another node in B.

# @param {Integer[][]} graph
# @return {Boolean}
def is_bipartite(graph)
  adjacency_list = adj_list(graph)
  visited = Array.new(graph.length, -1)
  # False represent white and black true or any other color values
  color_stack = Array.new(graph.length, false)
  # Set initial to true
  color_stack[0] = true
  result = false

  (0..graph.length).each do |vertex|
    # Do DFS if vertex has not yet been visited
    result = dfs(graph, vertex, visited, adjacency_list, color_stack) # if visited[vertex] == -1
  end
  # p color_stack

  return result
end

def dfs(edges, source, visited, adjacency_list, color_stack)
  visited[source] = 1
  adjacency_list[source].each do |neighbor|
    color_stack[neighbor] = !color_stack[source]
    p color_stack
    return false if color_stack[neighbor] == color_stack[source]
    result = dfs(edges, neighbor, visited, adjacency_list, color_stack) if visited[neighbor] == -1
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
    # assert_equal(true, is_bipartite([[1,3],[0,2],[1,3],[0,2]]))
    # assert_equal(true, is_bipartite([[0,1],[0,3],[1,2],[2,3]]))
    assert_equal(false, is_bipartite([[0,1],[0,3],[0,2],[1,2],[2,3]]))
  end
end 