require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/explore/learn/card/recursion-i/250/principle-of-recursion/1440/

# Reverse String
# Write a function that reverses a string. The input string 
# is given as an array of characters char[].

# Do not allocate extra space for another array, you must 
# do this by modifying the input array in-place with O(1) 
# extra memory.

# You may assume all the characters consist of printable 
# ascii characters.

# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
  helper(s, 0)
  return s
end

def helper(s, idx)
  if (idx>s.length/2-1)
      return
  end
  s[idx], s[s.length-1-idx] = s[s.length-1-idx], s[idx]
  helper(s, idx+1)
end


class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(["o","l","l","e","h"], reverse_string(["h","e","l","l","o"]))
    assert_equal(["h","a","n","n","a","H"], reverse_string(["H","a","n","n","a","h"]))
    assert_equal(['d','c','b','a'], reverse_string(['a','b','c','d']))
  end
end 