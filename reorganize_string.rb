require 'test/unit'
require 'byebug'

# https://leetcode.com/problems/reorganize-string/
# 767. Reorganize String
# Medium
# Given a string S, check if the letters can be rearranged so that two characters that are adjacent to each other are not the same.

# If possible, output any possible result.  If not possible, return the empty string.

# Example 1:

# Input: S = "aab"
# Output: "aba"
# Example 2:

# Input: S = "aaab"
# Output: ""
# Note:

# S will consist of lowercase letters and have length in range [1, 500].


# @param {String} s
# @return {String}
def reorganize_string(s)
  return s if s.length < 2
  max_pq = MaxPriorityQueue.new
  new_str = ''

  # Count chars and add to PQ
  ch_count = {}
  s.each_char do |ch|
    # p "#{ch}:#{ch_count[ch]}"
    ch_count[ch] = ch_count[ch].nil? ? 1: (ch_count[ch] += 1)
  end
  ch_count.each {|k,v| max_pq.push(item: k, priority: v)}
  # p max_pq
  # p max_pq.stack

  #p 'Lets loop'
  while(max_pq.stack.length > 0)
    elem = max_pq.pop
    next_elem = max_pq.pop
    # p "elem: #{elem}"
    # p "next_elem: #{next_elem}"
    new_str << elem[:item]
    new_str << next_elem[:item] if next_elem
    # Only one element with more than one priority
    unless next_elem
      return '' if elem[:priority] > 1
    end
    # p "new_str: #{new_str}"
    if (next_elem && elem[:priority] == next_elem[:priority])
      max_pq.push(item: next_elem[:item], priority: next_elem[:priority]-1) if next_elem && next_elem[:priority] > 1
      max_pq.push(item: elem[:item], priority: elem[:priority]-1) if elem[:priority] > 1
    else
      max_pq.push(item: elem[:item], priority: elem[:priority]-1) if elem[:priority] > 1
      max_pq.push(item: next_elem[:item], priority: next_elem[:priority]-1) if next_elem && next_elem[:priority] > 1
    end

    # p max_pq
    # p '----'
  end
  # p 'Done loop'
  # p new_str

  return new_str
end


class MaxPriorityQueue
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(item:, priority:)
    fail StandardError unless priority.is_a?(Integer) || priority.is_a?(Float)
    @stack.push(item: item, priority: priority)
  end

  def pop
    # Max PriorityQueue
    # In a max priority queue, elements are inserted in the order in
    # which they arrive the queue and the maximum value is always
    # removed first from the queue
    @stack.sort! {|x, y| x[:priority] <=> y[:priority] }
    @stack.pop
  end
end
 

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP


class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal('aba', reorganize_string('aab'))
    assert_equal('', reorganize_string('aaab'))
    assert_equal('gegepvymq', reorganize_string('eqmeyggvp'))
  end 
end
