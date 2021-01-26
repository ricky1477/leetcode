require 'test/unit'
require 'byebug'
require 'set'

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def traverse(n, adj_list)
  visited = Hash.new
  captured = Hash.new
  adj_list.keys.map{|wrd| visited[wrd] = 0}
  adj_list.keys.map{|wrd| captured[wrd] = 0}

  bfs(adj_list, 'bat', visited, captured)
  visited
end

def bfs(adj_list, source, visited, captured)
  captured[source] = 1
  visited[source] = 1
  p visited

  result = Set.new()
  result.add(source)

  q = Array.new()
  q.push(source)

  while(!q.empty?) # capture next vertex
    vertex = q.pop
    captured[vertex] = 1
    for w in adj_list[vertex]
      visited[w] = 1
      p visited
      result.add(w)
      q.push(w)
    end
  end
  result.to_a
end

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal({"hat"=>1, "bat"=>1, "cat"=>1, "bad"=>1, "had"=>1}, traverse(5, 
      {"hat"=>["had"],
       "bat"=>["cat", "hat", "bad"], 
       "cat"=>[],
       "bad"=>[],
       "had"=>[]}
       )
      )
  end
end
