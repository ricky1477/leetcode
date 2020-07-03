require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/palindrome-permutation/
# 266. Palindrome Permutation
# Easy

# Given a string, determine if a permutation of the 
# string could form a palindrome.

# Example 1:

# Input: "code"
# Output: false
# Example 2:

# Input: "aab"
# Output: true
# Example 3:

# Input: "carerac"
# Output: true


# @param {String} s
# @return {Boolean}
def can_permute_palindrome(s)
  # return true if s == s.reverse

  ch_count = Hash.new()

  s.each_char do |ch|
    #p ch
    ch_count.key?(ch) ? ch_count[ch] += 1 : ch_count[ch] = 1
    #p ch_count
  end

  # p ch_count
  # p odd_occurrences(ch_count)
  return odd_occurrences(ch_count) > 1 ? false : true
end

def odd_occurrences(hash)
  return hash.count{|k,v| v.odd?}
end

# O(n)

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(false, can_permute_palindrome('code'))
    assert_equal(true, can_permute_palindrome('aab'))
    assert_equal(true, can_permute_palindrome('carerac'))
  end 
end

