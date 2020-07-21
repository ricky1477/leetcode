require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/partition-list/

# 86. Partition List
# Medium

# Given a linked list and a value x, partition it such that all nodes less 
# than x come before nodes greater than or equal to x.

# You should preserve the original relative order of the nodes in each of the two partitions.

# Example:

# Input: head = 1->4->3->2->5->2, x = 3
# Output: 1->2->2->4->3->5


# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}

# def partition(head, x)
#   int_min=-(2**31) # INT_MIN (−2^31)
#   sentinel = ListNode.new(int_min, head)
#   p sentinel

#   cur = sentinel
#   prev = cur
#   insert = cur.next
#   found_insert = false

#   p '----'
#   p cur.val
#   p '----'
#   p insert.val
#   p '----'
#   while(cur)
#     p "#{cur.val}|#{insert.val}"
#     p print_linked_list(sentinel)
#     p print_linked_list(cur)


#     if insert.val >= x
#       p 'found'
#       found_insert = true
#       insert = cur
#       # cur = cur.next
#     elsif cur.val < x && found_insert
#       p 'needs shift'
#       # pointer so we go to next item the next iteration
#       save = cur.next if cur.next
#       prev.next = nil
#       p save.val

#       # re-position node
#       next_node = insert.next
#       insert.next = cur
#       cur.next = next_node
#       cur = save
#       # byebug
#       next
#     end
    
#     prev = cur
#     insert = cur.next.next unless found_insert
#     cur = cur.next
#     # byebug
#   end
#   p '**'
#   p insert.val

#   p print_linked_list(sentinel)
#   p print_linked_list(prev)

#   # Combine two lists
#   ptr = sentinel
#   while(ptr.next)
#     ptr = ptr.next
#   end

#   p ptr

#   ptr.next = prev if prev
#   p print_linked_list(sentinel)

#   return sentinel.next
# end


# https://leetcode.com/submissions/detail/368534392/
# Time limit exceeded

def partition(head, x)
  return head unless head && head.next
  int_min=-(2**31) # INT_MIN (−2^31)
  sentinel = ListNode.new(int_min, head)

  cur = sentinel
  prev = cur
  insert = cur.next
  found_insert = false

  while(cur)
    if insert.val >= x
      found_insert = true
      insert = cur
      # cur = cur.next
    elsif cur.val < x && found_insert
      # pointer so we go to next item the next iteration
      save = cur.next if cur.next
      prev.next = nil

      # re-position node
      next_node = insert.next
      insert.next = cur
      cur.next = next_node
      cur = save
      next
    end
    
    prev = cur
    insert = cur.next.next unless found_insert
    cur = cur.next
  end

  # Combine two lists
  ptr = sentinel
  while(ptr.next)
    ptr = ptr.next
  end

  ptr.next = prev if prev

  return sentinel.next
end

def print_linked_list(head)
  arr = []
  while(head)
    arr << head.val
    head = head.next
  end
  arr
end

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    input = ListNode.new(1, 
              ListNode.new(4,
                ListNode.new(3,
                  ListNode.new(2,
                    ListNode.new(5,
                      ListNode.new(2, nil))))))
    output = ListNode.new(1, 
              ListNode.new(2,
                ListNode.new(2,
                  ListNode.new(4,
                    ListNode.new(3,
                      ListNode.new(5, nil))))))

    # assert_equal(print_linked_list(output), print_linked_list(partition(input, 3)) )
    # partition(nil, 0)
    # assert_equal(print_linked_list([]), print_linked_list(partition(nil, 0)) )

  end
end