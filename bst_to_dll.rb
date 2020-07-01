
require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list
# 426. Convert Binary Search Tree to Sorted Doubly Linked List
# Medium

# Convert a Binary Search Tree to a sorted Circular Doubly-Linked List in place.

# You can think of the left and right pointers as synonymous to the predecessor 
# and successor pointers in a doubly-linked list. For a circular doubly linked 
# list, the predecessor of the first element is the last element, and the 
# successor of the last element is the first element.

# We want to do the transformation in place. After the transformation, the 
#   left pointer of the tree node should point to its predecessor, and the 
#   right pointer should point to its successor. You should return the pointer
#    to the smallest element of the linked list.

 

# Example 1:

# Input: root = [4,2,5,1,3]


# Output: [1,2,3,4,5]

# Explanation: The figure below shows the transformed BST. The solid line indicates the successor relationship, while the dashed line means the predecessor relationship.

# Example 2:

# Input: root = [2,1,3]
# Output: [1,2,3]
# Example 3:

# Input: root = []
# Output: []
# Explanation: Input is an empty tree. Output is also an empty Linked List.
# Example 4:

# Input: root = [1]
# Output: [1]

# Definition for a Node.
# class Node
#     attr_accessor :val, :left, :right
#     def initialize(val=0)
#         @val = val
#         @left, @right = nil, nil
#     end
# end


# @param {Node} root
# @return {Node}
def treeToDoublyList(root)
  
  @head = nil
  @tail = nil

  return nil unless (root)
  
  traverse(root)
  
  # Close DLL
  @tail.right = @head
  @head.left = @tail
      
  return @head
end

# In order traversal (L N R)
def traverse(node)

  if (node)
    traverse(node.left)
    
    # Visiting
    unless(@head)
      @head = node
      @tail = node
    else
      @tail.right = node
      node.left = @tail;
      @tail = node;
    end
    
    traverse(node.right)
  end
end

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    # assert_equal(true, treeToDoublyList( [[1,1],[-1,1]] ))
  end 
end

