

require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/480/

# First Unique Character in a String
# Solution
# Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.

# Examples:

# s = "leetcode"
# return 0.

# s = "loveleetcode",
# return 2.
# Note: You may assume the string contain only lowercase letters.



def first_uniq_char(s)
    
end
  
  
class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(0, first_uniq_char('leetcode'))
    assert_equal(2, first_uniq_char('loveleetcode'))
  end 
end