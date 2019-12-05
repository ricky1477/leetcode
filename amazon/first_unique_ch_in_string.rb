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



# def first_uniq_char(s)
#   s.each_char.with_index do |ch, i|
#     return i if s.count(ch) == 1
#   end
#   return -1
# end

def first_uniq_char(s)
  return -1 if s.empty?
  countHash = Hash.new(0)
  s.each_char do |letter|
    countHash[letter] += 1 
  end
  found = s.index(countHash.key(1)) if countHash.has_value?(1)
  found ? found : -1  
end
  
  
class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(0, first_uniq_char('leetcode'))
    assert_equal(2, first_uniq_char('loveleetcode'))
    assert_equal(-1, first_uniq_char(''))
    assert_equal(-1, first_uniq_char('cc'))
  end 
end