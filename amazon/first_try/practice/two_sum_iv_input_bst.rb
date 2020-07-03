require "test/unit"

# https://leetcode.com/problems/two-sum-iv-input-is-a-bst/

# 653. Two Sum IV - Input is a BST
# Easy
# Given a Binary Search Tree and a target number, return true if there exist two elements in the BST such that their sum is equal to the given target.

# Example 1:
# Input: 
#     5
#    / \
#   3   6
#  / \   \
# 2   4   7
# Target = 9
# Output: True

# Example 2:
# Input: 
#     5
#    / \
#   3   6
#  / \   \
# 2   4   7
# Target = 28
# Output: False

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @param {Integer} k
# @return {Boolean}
def find_target(root, k)
  return false if root.nil?
  list = []
  preorder(root, list)
  #p list
  i, j = 0, list.length-1
  while(i < j)
    sum = list[i] + list[j]
    #p "#{list[i]}+#{list[j]}=#{sum}"
    if sum > k
      j -= 1
    elsif sum < k
      i += 1
    else
      return true
    end
  end
  false
end

def preorder(node, list)
  return if node.nil?
  preorder(node.left, list)
  list << node.val
  preorder(node.right, list)
end

class TestSumIsTarget < Test::Unit::TestCase
  def test_simple

    # Example 1:
# Input: 
#     5
#    / \
#   3   6
#  / \   \
# 2   4   7
# Target = 9
# Output: True
    root = TreeNode.new(5)
    left_one = TreeNode.new(3)
    right_one = TreeNode.new(6)
    root.left = left_one
    root.right = right_one
    left_two = TreeNode.new(2)
    right_two = TreeNode.new(4)
    left_one.left = left_two
    left_one.right = right_two
    right_three = TreeNode.new(7)
    right_one.right = right_three
    p root
    assert_equal(true, find_target(root, 9))
  end 
end