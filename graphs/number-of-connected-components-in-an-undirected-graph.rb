require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/


# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def count_components(n, edges)
  adj_list = adj_list(edges)
  visited = Array.new(n, -1)

  components = 0
  (0..n).each do |vertex|
    # Do DFS if vertex has not yet been visited and we have found a component
    if visited[vertex] == -1
      components += 1
      dfs(edges, vertex, visited)
    end
  end
  return components
end


def dfs(edges, source, visited)
  visited[source] = 1
  p visited
  adj_list(edges)[source].each do |neighbor|
    # p neighbor
    dfs(edges, neighbor, visited) if visited[neighbor] == -1
  end
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

p dfs([[0, 1], [1, 2], [3, 4], [1,3]], 0, [-1,-1,-1,-1,-1])


class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal({0=>[1], 1=>[0, 2, 3], 2=>[1], 3=>[4, 1], 4=>[3]}, adj_list([[0, 1], [1, 2], [3, 4], [1,3]]))
    assert_equal(2, count_components(5, [[0, 1], [1, 2], [3, 4]]))
  end
end 