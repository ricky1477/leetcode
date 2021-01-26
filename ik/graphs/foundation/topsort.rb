require 'test/unit'
require 'byebug'
require 'set'

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}

# Kahns algorithm
# https://medium.com/insider-inc-engineering/the-wrath-of-kahns-algorithm-68081cf2fc55
def traverse(adj_list)
  in_degrees = Hash.new{0}
  adj_list.keys.map{|wrd| in_degrees[wrd] = 0}
  indegree = get_in_degrees(adj_list, in_degrees)

  q = Array.new()
  topsort = Array.new()

  # Find nodes where in_degree == 0
  for i in indegree
    q.push(i[0]) if i[1] == 0
  end

  # Loop through the entire list until the in-degrees of all nodes become zero 
  while (!q.empty?)
    current = q.pop
    topsort.push(current)

    adj_list[current[0]].each do |neighbor|
      indegree[neighbor] -= 1
      q.push(neighbor[0]) if indegree[neighbor] == 0
    end
  end

  topsort
end

def get_in_degrees(adj_list, in_degrees)
  adj_list.each do |src, dest|
    dest.each {|node| in_degrees[node] += 1}
  end
  in_degrees
end

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(["b", "f", "e", "d", "a", "c"], 
      traverse({'b'=>['d', 'a', 'e', 'f'], 'd'=>['a'], 'a'=>['c'], 'c'=>[], 'e'=>['d'], 'f'=>['a']}) )
  end
end
