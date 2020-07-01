require "test/unit"

# https://leetcode.com/problems/distribute-coins-in-binary-tree/

# 979. Distribute Coins in Binary Tree
# Medium

# Given the root of a binary tree with N nodes, each node in the tree has node.val coins, and there are N coins total.

# In one move, we may choose two adjacent nodes and move one coin from one node to another.  (The move may be from parent to child, or from child to parent.)

# Return the number of moves required to make every node have exactly one coin.

# Example 1:

# Input: [3,0,0]
# Output: 2
# Explanation: From the root of the tree, we move one coin to its left child, and one coin to its right child.

# Example 2:

# Input: [0,3,0]
# Output: 3
# Explanation: From the left child of the root, we move two coins to the root [taking two moves].  Then, we move one coin from the root of the tree to the right child.

# Example 3:

# Input: [1,0,2]
# Output: 2
# Example 4:

# Input: [1,0,0,null,3]
# Output: 4


# Note:

# 1<= N <= 100
# 0 <= node.val <= N


# Definition for a Node.
# class Node
#     attr_accessor :val, :left, :right, :parent
#     def initialize(val=0)
#         @val = val
#         @left, @right, parent = nil, nil, nil
#     end
# end

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
# @return {Integer}
def distribute_coins(root)
    
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







