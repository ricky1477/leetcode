require "test/unit"

# https://leetcode.com/problems/flatten-binary-tree-to-linked-list/

# 114. Flatten Binary Tree to Linked List

# Given a binary tree, flatten it to a linked list in-place.

# For example, given the following tree:

#     1
#    / \
#   2   5
#  / \   \
# 3   4   6
# The flattened tree should look like:

# 1
#  \
#   2
#    \
#     3
#      \
#       4
#        \
#         5
#          \
#           6



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
# @return {Void} Do not return anything, modify root in-place instead.
def flatten_tree(root)
  return nil unless root

  # Leaf node
  return root if (root.left.nil? && root.right.nil?)

  # Recursively flatten left and right subtree
  lt = flatten_tree(root.left)
  rt = flatten_tree(root.right)

  # Shuffle 
  if (lt)
    # Left Tail.right points to right subtree
    lt.right = root.right
    # Root.right points to previous Root.left
    root.right = root.left
    # Empty Root.left
    root.left = nil
  end

  return (rt.nil?) ? lt : rt
end

def flatten(root)
  flatten_tree(root)
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







