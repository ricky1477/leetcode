require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/closest-binary-search-tree-value/

# 270. Closest Binary Search Tree Value
# Easy

# Given a non-empty binary search tree and a target value, find the value in the BST that is closest to the target.

# Note:

# Given target value is a floating point.
# You are guaranteed to have only one unique value in the BST that is closest to the target.
# Example:

# Input: root = [4,2,5,1,3], target = 3.714286

#     4
#    / \
#   2   5
#  / \
# 1   3

# Output: 4

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Float} target
# @return {Integer}
def closest_value(root, target)
  val, closest = root.val, root.val

  while(root)
    val = root.val
    # Find closest to target
    closest = (val - target).abs < (closest - target).abs ? val : closest
    # Go left if target is less than root.val, go right otherwise 
    root = target < root.val ? root.left : root.right
  end
  return closest
end