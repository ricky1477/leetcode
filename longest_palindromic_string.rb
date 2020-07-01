require 'test/unit'

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
# def longest_palindrome(s)
#   return '' if (s.nil? || s.length < 1)
  
#   _start = 0
#   _end = 0
  
#   p s
#   s.each_char.with_index do |ch, i|
#     p "--#{ch}--"
#     # p i
#     # p i+1
#     len1 = expand(s, i, i) # Odd length palindrome
#     len2 = expand(s, i, i+1) # Even length palindrome
#     len = [len1, len2].max
#     p "#{len1}|#{len2}"
#     # p len
#     # Found longer substring
#     if (len > (_end - _start))
#       _start = i - (len-1) / 2
#       _end = i + len / 2
#       p _start
#       p _end
#       p s[_start.._end]
#     end
#   end
#   return s[_start.._end]
# end

# def expand(str, left, right)

#   while( left >= 0 && right < str.length && (str[left]==str[right]) )
#     left -= 1
#     right += 1
#   end
  
#   p right - left - 1
#   return right - left - 1
# end


def longest_palindrome(s)
  return '' if (s.nil? || s.length < 1)
  i = 0
  j = 0
  
  s.each_char.with_index do |ch, idx|
    odd = expand(s, idx, idx)
    even = expand(s, idx, idx+1)
    len = [odd,even].max
    
    # Found longer substring
    if (len > (j-i))
      i = idx - (len-1) / 2
      j = idx + len / 2
    end 
  end
  return s[i..j]
end

def expand(str, left, right)
  
  while( left >= 0 && right < str.length && (str[left]==str[right]))
    left -= 1
    right += 1
  end
  
  # return indexes of longest palindrome around the character
  return right-left-1
end

# ** Expand around the center
# &
# Memoization

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP


class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal('aba', longest_palindrome('aba'))
    assert_equal('aba', longest_palindrome('babad'))
    assert_equal('aaaa', longest_palindrome('aaaab'))
    assert_equal('aaaaaa', longest_palindrome('aaaaaab'))
    assert_equal('babab', longest_palindrome('babab'))
  end 
end