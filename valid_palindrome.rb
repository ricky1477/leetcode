require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/valid-palindrome/

# 125. Valid Palindrome
# Easy

# Given a string, determine if it is a palindrome, considering
# only alphanumeric characters and ignoring cases.

# Note: For the purpose of this problem, we define empty string
# as valid palindrome.

# Example 1:
# Input: "A man, a plan, a canal: Panama"
# Output: true

# Example 2:
# Input: "race a car"
# Output: false

# Constraints:
# s consists only of printable ASCII characters.

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  # Remove non-alphanumeric characters
  s = s.strip.gsub(/[^0-9a-z ]/i, '')
  s = s.downcase.gsub(' ', '')
  # p s
  s.each_char.with_index do |c, idx|
    # p "#{c}:#{s[idx]}"
    # p "#{idx}:#{s.length-1-idx}"

    return false if c != s[s.length-1-idx]
  end
  # s.each_char
  true
end

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(true, is_palindrome("A man, a plan, a canal: Panama"))
    assert_equal(false, is_palindrome("race a car"))
  end
end
