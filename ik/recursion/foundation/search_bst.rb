require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/search-in-a-binary-search-tree/

# 700. Search in a Binary Search Tree
# Easy

# You are given the root of a binary search tree (BST) and an integer val.

# Find the node in the BST that the node's value equals val and return the 
# subtree rooted with that node. If such a node does not exist, return null.

# Example 1:
# Input: root = [4,2,7,1,3], val = 2
# Output: [2,1,3]

# Example 2:
# Input: root = [4,2,7,1,3], val = 5
# Output: []

# Constraints:
# The number of nodes in the tree is in the range [1, 5000].
# 1 <= Node.val <= 107
# root is a binary search tree.
# 1 <= val <= 107

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
# @param {Integer} val
# @return {TreeNode}
def search_bst(root, val)
  return root unless root

  if val < root.val
    search_bst(root.left, val)
  elsif val > root.val
    search_bst(root.right, val)
  else
    return root
  end
end


class TestClass < Test::Unit::TestCase
  def test_simple
    root = TreeNode.new(4)
    root.left = TreeNode.new(2)
    root.right = TreeNode.new(7)
    root.left.left = TreeNode.new(1)
    root.left.right = TreeNode.new(3)
    # p root
    # p search_bst(root, 2)
    node = search_bst(root, 2)
    assert_equal(2, node.val)

    node = search_bst(root, 5)
    assert_equal(nil, node)
  end
end 