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


def longest_palindrome(s)
  r_s = s.reverse
  c_lists = {}
  index = 0
  answer = ''
  s.each_char do |c|
      c_lists[c] ||= []
      c_lists[c] << index
      c_lists[c].each do |i|
          if s[i..index] == r_s[(-index - 1)..(-i -1)] && answer.size < index - i + 1
              answer = s[i..index]
              break
          end
      end
      index += 1
  end
  return answer
end