require 'test/unit'
require 'byebug'

# https://leetcode.com/problems/longest-substring-without-repeating-characters/
# 3. Longest Substring Without Repeating Characters
# Medium
# Given a string, find the length of the longest substring without repeating characters.

# Example 1:

# Input: "abcabcbb"
# Output: 3 
# Explanation: The answer is "abc", with the length of 3. 
# Example 2:

# Input: "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.
# Example 3:

# Input: "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3. 
#              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.


# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  start_pointer = 0
  longest_substr = 0
  map = {}
  s.each_char.with_index do |ch, idx|
    if map.key?(ch)
      # Choose between previous and current start_pointer
      # In case of adjacent repeated characters
      start_pointer = [map[ch], start_pointer].max      
    end
    len_substr = idx - start_pointer + 1
    longest_substr = len_substr if len_substr > longest_substr
    map[ch] = idx+1
  end
  return longest_substr
end


# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(3, length_of_longest_substring('abcabcbb'))
    assert_equal(1, length_of_longest_substring('bbbbb'))
    assert_equal(3, length_of_longest_substring('pwwkew'))
    assert_equal(9, length_of_longest_substring('rickdabosric'))
    assert_equal(0, length_of_longest_substring(''))
    assert_equal(1, length_of_longest_substring(' '))
    assert_equal(3, length_of_longest_substring('abcabcbb'))
    assert_equal(4, length_of_longest_substring('abcbte'))
    assert_equal(3, length_of_longest_substring('dvdf'))
    assert_equal(5, length_of_longest_substring('anviaj'))
    assert_equal(6, length_of_longest_substring('asjrgapa')) 
    assert_equal(2, length_of_longest_substring('abba')) 
  end 
end
