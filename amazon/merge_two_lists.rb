require 'test/unit'
require 'byebug'

# https://leetcode.com/problems/merge-two-sorted-lists/

# 21. Merge Two Sorted Lists
# Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

# Example:

# Input: 1->2->4, 1->3->4
# Output: 1->1->2->3->4->4

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def merge_two_lists(l1, l2)
  return l1 if l2.nil?
  return l2 if l1.nil?
  
  if l1.val < l2.val
    l1.next = merge_two_lists(l1.next, l2)
    return l1
  else
    l2.next = merge_two_lists(l1, l2.next)
    return l2
  end
end


class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    head = ListNode.new(1)
    node1 = ListNode.new(2)
    node2 = ListNode.new(4)
    head.next = node1
    node1.next = node2
    p head
    head2 = ListNode.new(1)
    node3 = ListNode.new(3)
    node4 = ListNode.new(4)
    head2.next = node3
    node3.next = node4
    p '---'
    p head2
    p '---'
    p merge_two_lists(head, head2).val
    #assert_equal([1,1,2,3,4,4], merge_two_lists(head, head2))
  end 
end
