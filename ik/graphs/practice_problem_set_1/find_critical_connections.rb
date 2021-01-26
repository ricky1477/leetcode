require 'test/unit'
require 'byebug'
require 'set'

# https://uplevel.interviewkickstart.com/resource/rc-codingproblem-5681-40770-54-337


#
# Complete the function findCriticalConnections
# The function takes integers noOfServers, noOfConnections and 2D integer array as parameters.
# Returns a 2D integer array.
#

# def find_critical_connections(number_of_servers, connections)
#   # adj_list = adj_list(connections)
#   visited = Array.new(number_of_servers, -1)
#   critical_connections = Array.new

#   # p connections
#   # Brute force approach for removing a connection and seeinng if graph becomes disconnected (more than one component)
#   connections.each do |cnx|
#     visited = Array.new(number_of_servers, -1)
#     # p cnx
#     cnxs = connections - [cnx]
#     adj_list = adj_list(cnxs)
#     # p cnxs
#     components = 0
#     (0..number_of_servers).each do |vertex|
#       # p '----'
#       # p vertex
#       # Do DFS if vertex has not yet been visited and we have found a component
#       if visited[vertex] == -1
#         components += 1
#         dfs(cnxs, vertex, visited)
#       end
#     end
#     # p "num_comps:#{components}"
#     critical_connections << cnx if components > 1
#   end
#   critical_connections.length.positive? ? critical_connections : [[-1,-1]]
# end


# Finding nodes with in_degree of 1 does not handle all edge cases
def find_critical_connections(number_of_servers, connections)
  adj_list = adj_list(connections)
  in_degrees = Hash.new{0}
  adj_list.keys.map{|wrd| in_degrees[wrd] = 0}
  indegree = get_in_degrees(adj_list, in_degrees)
  critical_connections = Array.new

  # p adj_list
  # p indegree
  # p connections

  node_degree_one = get_nodes_with_indegree_of_one(indegree)
  critical_connections = get_current_critical_connections(connections, node_degree_one)
  # p critical_connections

  # ----
  indegree_left = decrement_in_degree(indegree, critical_connections)
  # p indegree_left
  connections_left = connections - critical_connections
  # byebug
    # p connections_left

    # ---
    node_degree_one_left = get_nodes_with_indegree_of_one(indegree_left)
    #p node_degree_one_left
  if !node_degree_one_left.empty?
    #p 'yoo'
    critical_connections << get_current_critical_connections(connections_left, node_degree_one_left).flatten
    # p critical_connections
  end

  p critical_connections
  critical_connections.length.positive? ? critical_connections.select{|x,y| !x.nil? && !y.nil?} : [[-1,-1]]
end

def decrement_in_degree(indegree, critical_connections)
  indegree.each {|k,v| indegree[k] = v-1 if critical_connections.flatten.include?(k)}
end

def get_nodes_with_indegree_of_one(indegree)
  indegree.select{|node, node_degree| node_degree == 1}.keys
end

def get_current_critical_connections(connections, node_degree_one)
  critical_connections = connections.select{|x,y| node_degree_one.include?(x) || node_degree_one.include?(y)}
end

def get_in_degrees(adj_list, in_degrees)
  adj_list.each do |src, dest|
    dest.each {|node| in_degrees[node] += 1}
  end
  in_degrees
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

# def dfs(edges, source, visited)
#   visited[source] = 1
#   # p visited
#   adj_list(edges)[source].each do |neighbor|
#     # p neighbor
#     dfs(edges, neighbor, visited) if visited[neighbor] == -1
#   end
# end

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal([[0,4],[1,3]], find_critical_connections(5, [[0, 1],[0, 2],[0, 4],[1, 2], [1, 3]] ))
    assert_equal([[-1,-1]], find_critical_connections(4, [[0, 1],[0, 2],[0, 3],[1, 2], [2, 3]] ))
    assert_equal([[3,2],[1,2]], find_critical_connections(5, [[4,0],[0,1],[1,4],[1,2],[3,2]] ))
    assert_equal([[2,0],[0,1]], find_critical_connections(3, [[2,0],[0,1]] ))

  end
end 