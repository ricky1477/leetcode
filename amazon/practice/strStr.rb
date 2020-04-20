
require "test/unit"
#https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/2968/

# Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

# Example 1:

# Input: haystack = "hello", needle = "ll"
# Output: 2
# Example 2:

# Input: haystack = "aaaaa", needle = "bba"
# Output: -1
# Clarification:

# What should we return when needle is an empty string? This is a great question to ask during an interview.

# For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

def str_str(haystack, needle)
  index = haystack.index(needle)
  return index ? index : -1 
end


class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(2, str_str("hello", "ll"))
    assert_equal(-1, str_str("aaaaa", 'bba'))
    assert_equal(0, str_str("", ''))
    assert_equal(0, str_str("a", ''))
  end 
end