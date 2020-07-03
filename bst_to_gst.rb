require "test/unit"

# https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/
# 1038. Binary Search Tree to Greater Sum Tree
# Medium

# Given the root of a binary search tree with distinct values, modify it so that 
# every node has a new value equal to the sum of the values of the original tree that 
# are greater than or equal to node.val.

# As a reminder, a binary search tree is a tree that satisfies these constraints:

# The left subtree of a node contains only nodes with keys less than the node's key.
# The right subtree of a node contains only nodes with keys greater than the node's key.
# Both the left and right subtrees must also be binary search trees.
 

# Example 1:

# Input: [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
# Output: [30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]
 

# Constraints:

# The number of nodes in the tree is between 1 and 100.
# Each node will have value between 0 and 100.
# The given tree is a binary search tree.
# Note: This question is the same as 538: https://leetcode.com/problems/convert-bst-to-greater-tree/


# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# @param {TreeNode} root
# @return {TreeNode}
def bst_to_gst(root)
  @sum = 0
  rev_in_order_traverse(root)
  root
end

# Reverse in-order traversal
def rev_in_order_traverse(root)
  return nil if root.nil?
  
  rev_in_order_traverse(root.right)
  
  # Update leaf with sum
  @sum += root.val
  root.val = @sum
  
  rev_in_order_traverse(root.left)
end

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    root_init = TreeNode.new(4, TreeNode.new(1), TreeNode.new(6))
    # Left tree
    left = root_init.left
    right = root_init.right
    left.left = TreeNode.new(0)
    left.right = TreeNode.new(2)
    left.right.right = TreeNode.new(3)

    # Right tree
    right.left = TreeNode.new(5)
    right.right = TreeNode.new(7)
    right.right.right = TreeNode.new(8)


    root_end = TreeNode.new(30, TreeNode.new(36), TreeNode.new(21))
    # Left tree
    left = root_end.left
    right = root_end.right
    left.left = TreeNode.new(36)
    left.right = TreeNode.new(35)
    left.right.right = TreeNode.new(33)

    # Right tree
    right.left = TreeNode.new(26)
    right.right = TreeNode.new(15)
    right.right.right = TreeNode.new(8)

    assert_equal(breadthFirstWithEmptyNode(root_end), breadthFirstWithEmptyNode(bst_to_gst(root_init)))
  end
end


def breadthFirstWithEmptyNode(node)
  queue=[];  #first in, first out
  output=[]; #to store the output
  queue.push(node); #store the first node, which is root into queue
  while(!allNodeEmppty?(queue)) # when the queue is not empty
    current = queue.shift; # get the first element of the queue
  if(current != 'nil') #this node is not an empty node
  if(current.left) then queue.push(current.left) # from left
  else queue.push('nil') end #add an empty node
  if(current.right) then queue.push(current.right) #to right
   else queue.push('nil') end #add an empty node
  output.push(current.val) #store value to output
  else # this node is an empty node
   output.push('nil')
   queue.push('nil') # each empty node has 2 empty childern
   queue.push('nil')
  end
  end
  # puts "Breadth-first traversal with empty node:" #print the output
  # puts output.join(" ")
  return output
end

def allNodeEmppty?(array)
  isEmpty= true;
  array.each{ |e| if(e!='nil') then  isEmpty = false end}
  return isEmpty;
end






