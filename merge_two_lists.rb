require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/merge-two-sorted-lists/

# 21. Merge Two Sorted Lists
# Easy
# Merge two sorted linked lists and return it as a new sorted list. 
# The new list should be made by splicing together the nodes of the first two lists.

# Example:

# Input: 1->2->4, 1->3->4
# Output: 1->1->2->3->4->4

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  return l1 unless l2
  return l2 unless l1
  # Set head
  if (l1.val <= l2.val)
    new_list = ListNode.new(l1.val, nil)
    l1 = l1.next
  else
    new_list = ListNode.new(l2.val, nil)
    l2 = l2.next
  end
  cur = new_list
  
  while(l1 || l2)
    if (l2.nil? || (l1 && l1&.val <= l2&.val))
      cur.next = ListNode.new(l1.val, nil)
      cur = cur.next
      l1 = l1.next
    else
      cur.next = ListNode.new(l2.val, nil)
      cur = cur.next
      l2 = l2.next
    end
  end
  new_list    
end

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(nil, merge_two_lists(nil, nil))
  end
end

