require 'test/unit'
require 'byebug'
require 'set'

# https://uplevel.interviewkickstart.com/resource/rc-codingproblem-5681-40770-54-336

# Course Schedule

# There are n courses to take, they are referred to by numbers from 0 to n-1.
# Some of them have prerequisites, e.g. courses A and B must be completed
# before course C can be taken (in other words, course C depends on A and B).

# Find and return an ordering in which all the given courses can be taken
# while satisfying all the prerequisites. If there exists more than one such
# ordering, any one of them would be a correct answer. If no such ordering
# exists, return a special value: [-1].

# @param {int} n
# @param {Array[Array[int]]} prerequisites
# @return {Array[int]}
# def course_schedule(n, prerequisites)
#   # Write your code here.
#   adj_list = adj_list(prerequisites)
#   visited = Array.new(n, -1)
#   captured = Array.new(n, -1)

#   p adj_list

#   output = bfs(prerequisites, adj_list.keys.first, visited, captured, adj_list)

#   output.each {|o| p o}
# end

# def bfs(edges, source, visited, captured, adj_list)
#   captured[source] = 1
#   visited[source] = 1
#   p visited
#   result = Set.new()
#   result.add(source)

#   q = Array.new()
#   q.push(source)

#   while(!q.empty?) # capture next vertex
#     vertex = q.pop
#     captured[vertex] = 1
#     # p captured
#     for w in adj_list[vertex]
#       visited[w] = 1
#       p "VISTED: #{w}:#{vertex}"
#       result.add(w)
#       p visited
#       q.push(w)
#     end
#   end
#   result.to_a
# end


# def adj_list(edges)
#   adj_list = Hash.new { |h, k| h[k] = [] }
#   edges.each do |src, dst|
#     adj_list[dst] << src
#   end
#   adj_list
# end

require 'set'
# @param {int} n
# @param {Array[Array[int]]} prerequisites
# @return {Array[int]}
def course_schedule(n, prerequisites)
  graph, in_deg = Hash.new { |h, k| h[k] = Set.new }, Hash.new(0)
  visited, q = [], []
   
  prerequisites.each do |course, prereq|
    graph[course].add(prereq)
    in_deg[prereq] += 1
  end
  n.times { |course| q.push(course) if in_deg[course].zero? }
   
  while !q.empty?                                     
    course = q.shift()
    visited.unshift(course)                               
    graph[course].each do |prereq|
      in_deg[prereq] -= 1                            
      q.push(prereq) if in_deg[prereq].zero?
    end
  end
  visited.size == n ? visited : [-1]
end

class TestClass < Test::Unit::TestCase
  def test_simple
    # assert_equal({0=>[1, 2], 1=>[3], 2=>[3]}, adj_list([[1, 0], [2, 0], [3, 1], [3, 2]]))
    assert_equal([0,2,1,3], course_schedule(4, [[1, 0], [2, 0], [3, 1], [3, 2]]))
    assert_equal([1, 0], course_schedule(2, [[0, 1]]))

    # assert_equal(true, valid_tree(5, [[0,1], [0,2], [0,3], [1,4]]))
    # assert_equal(false, valid_tree(5, [[0,1], [1,2], [2,3], [1,3], [1,4]]))
  end
end 