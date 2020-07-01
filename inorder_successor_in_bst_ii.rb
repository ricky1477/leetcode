require "test/unit"

# https://leetcode.com/problems/inorder-successor-in-bst-ii/

# 510. Inorder Successor in BST II
# Medium

# Given a node in a binary search tree, find the in-order successor of that node in the BST.

# If that node has no in-order successor, return null.

# The successor of a node is the node with the smallest key greater than node.val.

# You will have direct access to the node but not to the root of the tree. Each node will have a reference to its parent node. Below is the definition for Node:

# class Node {
#     public int val;
#     public Node left;
#     public Node right;
#     public Node parent;
# }
 

# Follow up:

# Could you solve it without looking up any of the node's values?

 

# Example 1:


# Input: tree = [2,1,3], node = 1
# Output: 2
# Explanation: 1's in-order successor node is 2. Note that both the node and the return value is of Node type.
# Example 2:


# Input: tree = [5,3,6,2,4,null,null,1], node = 6
# Output: null
# Explanation: There is no in-order successor of the current node, so the answer is null.
# Example 3:


# Input: tree = [15,6,18,3,7,17,20,2,4,null,13,null,null,null,null,null,null,null,null,9], node = 15
# Output: 17
# Example 4:


# Input: tree = [15,6,18,3,7,17,20,2,4,null,13,null,null,null,null,null,null,null,null,9], node = 13
# Output: 15
# Example 5:

# Input: tree = [0], node = 0
# Output: null
 

# Constraints:

# -10^5 <= Node.val <= 10^5
# 1 <= Number of Nodes <= 10^4
# All Nodes will have unique values.


# Definition for a Node.
# class Node
#     attr_accessor :val, :left, :right, :parent
#     def initialize(val=0)
#         @val = val
#         @left, @right, parent = nil, nil, nil
#     end
# end

# @param {Node} root
# @return {Node}
def inorderSuccessor(node)
  return nil unless node
  
  # Sucessor is lower right subtree (node has a right node)
  # Traverse to the left most leaf of the right sub-tree
  if (node.right)
    node = node.right
    while(node.left)
      node = node.left
    end
    return node
  end
  
  # Sucessor is upper in the tree
  # Parent has a parent on the left side (has no right node)
  while(node.parent && node.parent.right)
    node = node.parent
  end
  return node.parent
  
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







