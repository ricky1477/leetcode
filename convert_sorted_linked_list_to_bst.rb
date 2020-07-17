require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
# Medium

# Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

# For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

# Example:

# Given the sorted linked list: [-10,-3,0,5,9],

# One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

#       0
#      / \
#    -3   9
#    /   /
#  -10  5


# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end
# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end
# @param {ListNode} head
# @return {TreeNode}
def find_mid_point(head)
  p '--find_mid_point--'
  slow_pointer = head
  fast_pointer = head.next
  
  while(fast_pointer.next)
    slow_pointer = slow_pointer.next
    fast_pointer = fast_pointer.next.next
    midpoint = slow_pointer
    p fast_pointer
  end
  
  p midpoint
  
  # -10 -3 0 5 9
  # midpoint = 0
  # slow_pointer = -3
  # fast_pointer = 9

  return midpoint
    
end

def sorted_list_to_bst(head)
  return nil unless head
    
  p head
  mid = find_mid_point(head)
    
  TreeNode root = TreeNode.new(mid.val)
    
  # Base case when there is only one element in linked list
  if (head == mid)
    return root
  end

  # prev = find_prev_to_middle(head)
  # if !prev.next.nil?
  #     root = TreeNode.new(prev.next.val)
  #     root.right = sorted_list_to_bst(prev.next.next)
  #     prev.next = nil
  #     root.left = sorted_list_to_bst(head)
  # else # one node case
  #     root = TreeNode.new(prev.val)
  #     root.left = nil
  #     root.right = nil
  # end
  # root
    
  root.left = sorted_list_to_bst(head)
  root.right = sorted_list_to_bst(root.next)
  return root  
end


class TestClass < Test::Unit::TestCase
  def test_simple
    head = 
      ListNode.new(-10, 
        ListNode.new(-3, 
          ListNode.new(0,
            ListNode.new(5,
              ListNode.new(9, nil)
            )
          )
        )
      )
      # new_list = ListNode.new(1, nil)
      # cur = new_list
      # cur.next = ListNode.new(2, nil)
      # cur = cur.next
      # cur.next = ListNode.new(3, nil)
      # cur = cur.next
      # p new_list
      # p '****'
    assert_equal(3, sorted_list_to_bst(head))
  end 
end
