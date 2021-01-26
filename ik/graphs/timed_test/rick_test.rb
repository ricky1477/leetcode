require 'test/unit'
require 'byebug'
require 'set'

# https://uplevel.interviewkickstart.com/resource/rc-codingproblem-5682-42330-56-344

# Given A Graph Build A New One With Reversed Edges

# Given a strongly connected directed graph, build a new graph with the same number of nodes
#  but every edge reversed. This is also called transposing a graph.


# Example

# Input: Any node of this graph:
# Output: Any node of the new:


# Notes
# Input Parameters: Function has one argument pointing to a node of the given graph.
# Output: Return any node of the new graph.

# Constraints:

#     1 <= number of nodes <= 315
#     Value in any node will be a unique integer between 1 and number of nodes, inclusive.
#     No multiple edges (connecting any pair of nodes in one direction) or self loops 
#     (edges connecting a node with itself) in the input graph.
#     You are not allowed to modify the given graph. Return a newly built graph. 


# Custom Input

# Input Format: The first line of input contains two space separated integers n and m, denoting number 
# of nodes and number of edges in the input graph, respectively. Next m lines contain two space 
# separated integers each: fromNode and toNode, denoting that there is an edge from fromNode to toNode in G.

# For example, if n = 3, m = 3 and edges = [(1 -> 2), (2 -> 3), (3 -> 1)], then input would be:

# 3 3

# 1 2

# 2 3

# 3 1

# Output Format: There will be one line of output, containing a string "Wrong Answer!" OR "Correct Answer!",
#  depending on the evaluation of your solution’s output. For input n = 3, m = 3 and 
#  edges = [(1 -> 2), (2 -> 3), (3 -> 1)], if your solution is correct, output will be:
# Correct Answer!

# For your reference:
#
class Node
    attr_accessor :val, :neighbours

    def initialize node_val
        @val = node_val
        @neighbours = []
    end
end

$reversed_graph = Hash.new

def dfs(node) 
    # First create new node. 
    temp_node = Node.new node.val
    $reversed_graph[node.val] = temp_node        
    n = node.neighbours.length
    # Visit all the neighbours.
    for i in 0...n
        # If node is not visited then first visit it.
        if ! $reversed_graph.key?(node.neighbours[i].val)
            dfs(node.neighbours[i])
        end
        # Add the reverse edge. 
        $reversed_graph[node.neighbours[i].val].neighbours.push($reversed_graph[node.val])
    end
end

def build_other_graph(node)
    # Build the graph.
    dfs(node)
    # Return any node of the new graph.
    p $reversed_graph
    return $reversed_graph[1]
end


class TestClass < Test::Unit::TestCase
  def test_simple
    graph = Node.new(1)
    p graph
    graph.neighbours = [Node.new(2)]
    p graph
    # byebug
    graph.neighbours.first.neighbours = [Node.new(3)]
    # graph.neighbours.neighbours = [Node.new(3)]
    p graph
    assert_equal('bdac', build_other_graph(graph))
  end
end 