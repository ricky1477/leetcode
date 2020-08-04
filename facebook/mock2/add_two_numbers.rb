require "test/unit"

# https://leetcode.com/problems/add-two-numbers/
# Medium

# You are given two non-empty linked lists representing two non-negative integers.
#  The digits are stored in reverse order and each of their nodes contain a single 
#  digit. Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number
#   0 itself.

# Example:

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)

  return nil unless (l1 && l2)
  carry = 0
  res = nil
  @output = nil

  while(l1 || l2)
    p "#{l1&.val}|#{l2&.val}"

    res = ((zero_if_nil(l1&.val) + zero_if_nil(l2&.val)) % 10) + carry
    insert_node(@output, res)

    carry = (zero_if_nil(l1&.val) + zero_if_nil(l2&.val)) / 10
    p "#{res}|#{carry}"
    p '---'

    p @output
    p '---'

    l1 = l1&.next
    l2 = l2&.next
  end

  if carry > 0
    insert_node(@output, carry)
  end

  @output
end

def zero_if_nil(val)
  val.nil? ? 0 : val
end

def insert_node(head, insert_val)
  unless head
    @output = ListNode.new(insert_val, nil) 
    return
  end

  while(head.next)
    head = head.next
  end

  head.next = ListNode.new(insert_val, nil)
end

# p '****'
# @output = nil
# insert_node(@output, 1)
# p @output
# insert_node(@output, 2)
# p @output
# insert_node(@output, 3)
# p @output


class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    # input1 = ListNode.new(2, ListNode.new(4, ListNode.new(3, nil)))
    # input2 = ListNode.new(5, ListNode.new(6, ListNode.new(4, nil)))
    # output = ListNode.new(7, ListNode.new(0, ListNode.new(8, nil)))
    # assert_equal(output, add_two_numbers(input1, input2))

    # input1 = ListNode.new(5, nil)
    # input2 = ListNode.new(5, nil)
    # output = ListNode.new(0, ListNode.new(1, nil))
    # assert_equal(output, add_two_numbers(input1, input2))

    # input1 = ListNode.new(1, nil)
    # input2 = ListNode.new(8, nil)
    # output = ListNode.new(9, nil)
    # assert_equal(output, add_two_numbers(input1, input2))

    input1 = ListNode.new(1, ListNode.new(8, nil))
    input2 = ListNode.new(0, nil)
    output = ListNode.new(1, ListNode.new(8, nil))
    assert_equal(output, add_two_numbers(input1, input2))
  end 
end