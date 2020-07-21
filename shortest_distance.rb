require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/shortest-word-distance/
# 243. Shortest Word Distance
# Easy
# Given a list of words and two words word1 and word2, return the
#  shortest distance between these two words in the list.

# Example:
# Assume that words = ["practice", "makes", "perfect", "coding", "makes"].

# Input: word1 = “coding”, word2 = “practice”
# Output: 3
# Input: word1 = "makes", word2 = "coding"
# Output: 1
# Note:
# You may assume that word1 does not equal to word2, and word1 and word2 are both in the list.

# @param {String[]} words
# @param {String} word1
# @param {String} word2
# @return {Integer}
def shortest_distance(words, word1, word2)
  shortest_distance = int_min=(2**31) # INT_MAX (2^31)
  # Create new hash with empty array as default value
  words_hash = Hash.new { |h, k| h[k] = [] }
  words.each_with_index do |word, idx|
    words_hash[word] << idx
  end

  words_hash[word1].each do |i|
    words_hash[word2].each do |j|
      shortest_distance = (i-j).abs if (i-j).abs < shortest_distance
    end
  end

  return shortest_distance
end

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    words = ["practice", "makes", "perfect", "coding", "makes"]
    assert_equal(3, shortest_distance(words, 'coding', 'practice'))
    assert_equal(1, shortest_distance(words, 'makes', 'coding'))
  end
end
