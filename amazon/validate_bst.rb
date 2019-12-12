require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/78/trees-and-graphs/514/

# Validate Binary Search Tree
# Given a binary tree, determine if it is a valid binary search tree (BST).

# Assume a BST is defined as follows:

# The left subtree of a node contains only nodes with keys less than the node's key.
# The right subtree of a node contains only nodes with keys greater than the node's key.
# Both the left and right subtrees must also be binary search trees.
 

# Example 1:

#     2
#    / \
#   1   3

# Input: [2,1,3]
# Output: true
# Example 2:

#     5
#    / \
#   1   4
#      / \
#     3   6

# Input: [5,1,4,null,null,3,6]
# Output: false
# Explanation: The root node's value is 5 but its right child's value is 4.

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Boolean}
# def is_valid_bst(root, min = -Float::INFINITY, max = Float::INFINITY)
#   return true unless root
#   if root.val <= min || root.val >= max
#     return false
#   else
#     is_valid_bst(root.left, min, root.val) && is_valid_bst(root.right, root.val, max)
#   end
# end

def is_valid_bst(root, min=nil, max=nil)
  if !root.left && !root.right 
    # base case (leaf node)
    return false if min && root.val < min
    return false if max && root.val >= max
    true # otherwise
  else
    return false if root.left && !is_valid_bst(root.left, min, root.val)
    return false if root.right && !is_valid_bst(root.right, root.val, max)
    true # otherwise
  end
end

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    #assert_equal(true, is_valid_bst([2,1,3]))
    root = TreeNode.new(2)
    left = TreeNode.new(1)
    right = TreeNode.new(3)
    root.left = left
    root.right = right
    #p root
    assert_equal(true, is_valid_bst(root))

    #assert_equal(false, is_valid_bst([5,1,4,null,null,3,6]))
    root = TreeNode.new(5)
    left = TreeNode.new(1)
    right = TreeNode.new(4)
    root.left = left
    root.right = right
    one = TreeNode.new(3)
    two = TreeNode.new(6)
    right.right = two
    right.left = one
    #p root
    assert_equal(false, is_valid_bst(root))
  end 
end