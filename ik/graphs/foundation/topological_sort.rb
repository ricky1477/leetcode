require 'test/unit'
require 'byebug'
require 'set'

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def traverse(n, adj_list)
  visited = Hash.new
  captured = Hash.new  
  in_degrees = Hash.new{0}

  adj_list.keys.map{|wrd| visited[wrd] = 0}
  adj_list.keys.map{|wrd| captured[wrd] = 0}
  adj_list.keys.map{|wrd| in_degrees[wrd] = 0}

  in_degrees = get_in_degrees(adj_list, in_degrees)
  start_node = in_degrees.select{|k,v| v == 0}.keys.first
  p in_degrees
  p '-----'

  bfs(adj_list, start_node, visited, captured, in_degrees)
  visited
end

def bfs(adj_list, source, visited, captured, in_degrees)
  captured[source] = 1
  visited[source] = 1
  # p visited
  # p source

  result = Set.new()
  result.add(source)

  q = Array.new()
  q.push(source)
  stack = Array.new()

  p q

  while(!q.empty?) # capture next vertex
    vertex = q.pop
    p q
    captured[vertex] = 1
    # decrement in-degree
    in_degrees = decrement_in_degree(in_degrees, vertex, adj_list) 
    # p vertex
    # p captured[vertex]
    for w in adj_list[vertex]
      # p w
      visited[w] = 1
      stack.push(w)
      # p visited
      p "cap#{captured}"
      # p w
      result.add(w)
      # q.push(w) # if in_degrees[w] == 0
      # p w
      # p in_degrees
      q.push(w) # if in_degrees[w] == 0
      p q
    end
  end
  result.to_a
end

def decrement_in_degree(in_degrees, vertex, adj_list)
  p "vertex: #{vertex}"
  adj_list.select{ |k, v| v.include?(vertex) }
    .keys.each {|k| in_degrees[k] -= 1 if in_degrees[k] > 0 }
  p in_degrees
  p '----'
  in_degrees
end

def get_in_degrees(adj_list, in_degrees)
  adj_list.each do |src, dest|
    dest.each {|node| in_degrees[node] += 1}
    # p in_degrees
  end
  in_degrees
end

class TestClass < Test::Unit::TestCase
  def test_simple
    # assert_equal({"hat"=>1, "bat"=>1, "cat"=>1, "bad"=>1, "had"=>1}, traverse(5, 
    #   {"hat"=>["had"],
    #    "bat"=>["cat", "hat", "bad"], 
    #    "cat"=>[],
    #    "bad"=>[],
    #    "had"=>[]}
    #    )
    #   )

    assert_equal( {'a'=>1, 'b'=>1, 'c'=>1, 'd'=>1, 'e'=>1, 'f'=>1}, 
      traverse(4,{'b'=>['d', 'a', 'e', 'f'], 'd'=>['a'], 'a'=>['c'], 'c'=>[], 'e'=>['d'], 'f'=>['a']}) )
  end
end
