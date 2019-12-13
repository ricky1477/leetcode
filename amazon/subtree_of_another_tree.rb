# https://leetcode.com/problems/subtree-of-another-tree/

# 572. Subtree of Another Tree
# Easy

# Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.

# Example 1:
# Given tree s:

#      3
#     / \
#    4   5
#   / \
#  1   2
# Given tree t:
#    4 
#   / \
#  1   2
# Return true, because t has the same structure and node values with a subtree of s.
# Example 2:
# Given tree s:

#      3
#     / \
#    4   5
#   / \
#  1   2
#     /
#    0
# Given tree t:
#    4
#   / \
#  1   2
# Return false.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} s
# @param {TreeNode} t
# @return {Boolean}
def is_subtree(s, t)
  return false if t.nil? or s.nil?
  nodes = []
  find_node(s, t.val, nodes)
  
  nodes.each { |node|
    return true if same_tree?(node, t)
  }
  false
end

def find_node(root, x, nodes)
  return if root.nil?
  nodes << root if x == root.val
  find_node(root.left, x, nodes) 
  find_node(root.right, x, nodes)
end

def same_tree?(s,t)
  return true if !s && !t
  return false if !s or !t
  s.val == t.val && same_tree?(s.left,t.left) && same_tree?(s.right,t.right)
end