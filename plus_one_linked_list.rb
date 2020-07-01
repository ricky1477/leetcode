
require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/plus-one-linked-list/
# 369. Plus One Linked List
# Medium

# Given a non-negative integer represented as non-empty a singly linked list of digits, plus one to the integer.

# You may assume the integer do not contain any leading zero, except the number 0 itself.

# The digits are stored such that the most significant digit is at the head of the list.

# Example :

# Input: [1,2,3]
# Output: [1,2,4]

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end


# @param {ListNode} head
# @return {ListNode}
def plus_one(head)
  reversed_list = reverse_list(head)  
  cur = reversed_list

  # Add one to reverse LL on the left
  if cur.val == 9
    cur.val = 0
    carry = 1
  else
    cur.val += 1
    carry = 0
  end
    
  traverse_list(reversed_list, carry)
  reverse_list(reversed_list)
end

def traverse_list(cur, carry)
  trail = cur
  cur = cur.next
  # Return list if only one node
  unless cur
    trail.next = ListNode.new(1) if carry == 1
    return trail
  end

  while(cur)
    if carry == 1
      if cur.val == 9
        cur.val = 0
        carry = 1
      else
        cur.val = cur.val + 1
        carry = 0
      end
    end
    trail = cur
    cur = cur.next
  end

  # Add node if carry == 1
  trail.next = ListNode.new(1) if carry == 1
  cur
end

def reverse_list(list, previous=nil)
  current_head = list.next
  list.next = previous
  if current_head
    reverse_list(current_head, list)
  else
    list
  end
end

# Helper for testing
def get_values(list)
  cur = list
  vals = []
  while(cur)
    vals << cur.val
    cur = cur.next
  end
  vals
end

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    list = ListNode.new(1, ListNode.new(2, ListNode.new(3)))
    assert_equal([1,2,4], get_values(plus_one(list)))
    list = ListNode.new(9, ListNode.new(2, ListNode.new(3)))
    assert_equal([9,2,4], get_values(plus_one(list)))
    list = ListNode.new(1, ListNode.new(2, ListNode.new(9)))
    assert_equal([1,3,0], get_values(plus_one(list)))
    list = ListNode.new(9, ListNode.new(9, ListNode.new(9)))
    assert_equal([1,0,0,0], get_values(plus_one(list)))
    list = ListNode.new(0)
    assert_equal([1], get_values(plus_one(list)))
    list = ListNode.new(9)
    assert_equal([1,0], get_values(plus_one(list)))
  end 
end

