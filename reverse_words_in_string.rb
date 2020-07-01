require "test/unit"

# https://leetcode.com/problems/reverse-words-in-a-string/
# Medium

# Given an input string, reverse the string word by word.

# Example 1:

# Input: "the sky is blue"
# Output: "blue is sky the"
# Example 2:

# Input: "  hello world!  "
# Output: "world! hello"
# Explanation: Your reversed string should not contain leading or trailing spaces.
# Example 3:

# Input: "a good   example"
# Output: "example good a"
# Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.



# @param {String} s
# @return {String}
def reverse_words(s)
  s = s.strip.reverse.gsub(/ +/, " ")
  pointer = 0
  
  s.each_char.with_index do |ch, i|
    if (ch == ' ')
      res = reverse(s[pointer..i-1])
      s[pointer..i-1] = res
      pointer = i + 1
    elsif (i == s.length-1)
      res = reverse(s[pointer..i])
      s[pointer..i] = res
    end
  end
  return s
end

# Reverse a string in place
def reverse(string)
 reversed_string = ''
 i = 0 
 while i < string.length 
  reversed_string = string[i] + reversed_string
  i += 1 
 end
 
 return reversed_string
end

# https://coderpad.io/JKD4M66R

# https://join.slack.com/t/sdeinterviewhelp/shared_invite/zt-90ewrmvp-MfIdXzpBMMmDuUqNdcPlwA

# https://app.slack.com/client/TA4657GMC/CA6DT4UGP


class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal("blue is sky the", reverse_words("the sky is blue"))
    assert_equal("world! hello", reverse_words("  hello world!  "))
    assert_equal("example good a", reverse_words("a good   example"))
  end 
end