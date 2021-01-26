require 'test/unit'
require 'byebug'
require 'set'

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def traverse(n, edges)
  adj_list = adj_list(edges)
  visited = Array.new(n, -1)

  (0..n).each do |vertex|
    # Do DFS if vertex has not yet been visited and we have found a component
    if visited[vertex] == -1
      dfs(edges, vertex, visited)
    end
  end
  return visited
end


def dfs(edges, source, visited)
  visited[source] = 1
  # p visited
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


class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal({0=>[1], 1=>[0, 2, 3], 2=>[1], 3=>[4, 1], 4=>[3]}, adj_list([[0, 1], [1, 2], [3, 4], [1,3]]))
    assert_equal([1, 1, 1, 1, 1], traverse(5, [[0, 1], [1, 2], [3, 4]]))
  end
end
