require 'test/unit'
require 'byebug'

# https://leetcode.com/problems/reverse-string-ii/

# 541. Reverse String II
# Easy

# Given a string and an integer k, you need to reverse the first k characters for every 2k characters counting from the start of the string.
# If there are less than k characters left, reverse all of them. If there are less than 2k but greater than or equal to k characters, 
# then reverse the first k characters and left the other as original.

# Example:
# Input: s = "abcdefg", k = 2
# Output: "bacdfeg"
# Restrictions:
# The string consists of lower English letters only.
# Length of the given string and k will in the range [1, 10000]

def reverse_str(s, k)
  subs = s.chars.each_slice(2*k).map{|e| e.join}
  # p subs
  subs.each {|e| e[0..k-1] = e[0..k-1].reverse }
  # p subs
  subs.join('')
end

class TestReverseStr < Test::Unit::TestCase
  def test_simple
    assert_equal('bacdfeg', reverse_str('abcdefg', 2))
    assert_equal('cbadefihgjk', reverse_str('abcdefghijk', 3))
  end
end
