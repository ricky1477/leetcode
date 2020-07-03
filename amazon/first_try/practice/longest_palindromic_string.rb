require 'test/unit'
require 'byebug'

#5. Longest Palindromic Substring
# Medium

# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

# Example 1:

# Input: "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
# Example 2:

# Input: "cbbd"
# Output: "bb"

# def longest_palindrome(s)
#   r_s = s.reverse
#   c_lists = {}
#   index = 0
#   answer = ''
#   s.each_char do |c|
#     c_lists[c] ||= []
#     c_lists[c] << index
#     c_lists[c].each do |i|
#       if s[i..index] == r_s[(-index - 1)..(-i -1)] && answer.size < index - i + 1
#         answer = s[i..index]
#         break
#       end
#     end
#     index += 1
#   end
#   return answer
# end

# @param {String} s
# @return {String}
def longest_palindrome(s)
  return '' if (s.nil? || s.length < 1)
  
  _start = 0
  _end = 0
  
  s.each_char.with_index do |ch, i|
    p "-#{i}-"
    len1 = expand(s, i, i)
    len2 = expand(s, i, i+1)
    len = [len1, len2].max
    #p len
    if (len > (_end - _start))
      _start = i - (len-1) / 2
      _end = i + len / 2
    end
  end
  p '--'
  p s[_start.._end+1]
  return s[_start.._end+1]
end

def expand(str, left, right)
  #p str[left..right]
  p "#{left}|#{right}"
  p "#{str[left]}|#{str[right]}"
  while( left >= 0 && right < str.length && (str[left]==str[right]) )
    left -= 1
    right += 1
    #p str[left..right]
  end
  
  return right - left - 1
end

# Expand around the center
# &
# Memoization

# public String longestPalindrome(String s) {
#   if (s == null || s.length() < 1) return "";
#   int start = 0, end = 0;
#   for (int i = 0; i < s.length(); i++) {
#       int len1 = expandAroundCenter(s, i, i);
#       int len2 = expandAroundCenter(s, i, i + 1);
#       int len = Math.max(len1, len2);
#       if (len > end - start) {
#           start = i - (len - 1) / 2;
#           end = i + len / 2;
#       }
#   }
#   return s.substring(start, end + 1);
# }

# private int expandAroundCenter(String s, int left, int right) {
#   int L = left, R = right;
#   while (L >= 0 && R < s.length() && s.charAt(L) == s.charAt(R)) {
#       L--;
#       R++;
#   }
#   return R - L - 1;
# }

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP


class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal('bab', longest_palindrome('babad'))
    # assert_equal("world! hello", reverse_words("  hello world!  "))
    # assert_equal("example good a", reverse_words("a good   example"))
  end 
end