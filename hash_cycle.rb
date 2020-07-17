require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/linked-list-cycle/

# 141. Linked List Cycle
# Easy

# Given a linked list, determine if it has a cycle in it.

# To represent a cycle in the given linked list, we use an integer pos which represents
#  the position (0-indexed) in the linked list where tail connects to. If pos is -1, 
#  then there is no cycle in the linked list.

# Example 1:

# Input: head = [3,2,0,-4], pos = 1
# Output: true
# Explanation: There is a cycle in the linked list, where tail connects to the second node.


# Example 2:

# Input: head = [1,2], pos = 0
# Output: true
# Explanation: There is a cycle in the linked list, where tail connects to the first node.


# Example 3:

# Input: head = [1], pos = -1
# Output: false
# Explanation: There is no cycle in the linked list.


# Follow up:

# Can you solve it using O(1) (i.e. constant) memory?
# (Two pointers)

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  slower, faster = head, head

  while !slower.nil? && !faster.nil? && !faster.next.nil?
    slower = slower.next
    faster = faster.next.next

    return true if slower == faster
  end

  return false
end

# O (n) no cycle
# O(nLog(n)) worst




