require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/explore/learn/card/recursion-i/250/principle-of-recursion/1681/

# Swap Nodes in Pairs

# Given a linked list, swap every two adjacent nodes and return its head.

# Example 1:
# Input: head = [1,2,3,4]
# Output: [2,1,4,3]

# Example 2:
# Input: head = []
# Output: []
# Example 3:

# Input: head = [1]
# Output: [1]
 
# Constraints:

# The number of nodes in the list is in the range [0, 100].
# 0 <= Node.val <= 100

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  p head
end

class TestClass < Test::Unit::TestCase
  def test_simple
    head = ListNode.new(2, ListNode.new(1, ListNode.new(4, ListNode.new(3, nil))))
    head.next = ListNode.new(1)
    head.next.next = ListNode.new(4)
    head.next.next.next = ListNode.new(3)
    assert_equal(nil, swap_pairs(head))
  end
end 