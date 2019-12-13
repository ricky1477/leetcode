require 'test/unit'
require 'byebug'

# https://leetcode.com/problems/partition-labels/

# 763. Partition Labels
# Medium

# A string S of lowercase letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.

# Example 1:
# Input: S = "ababcbacadefegdehijhklij"
# Output: [9,7,8]
# Explanation:
# The partition is "ababcbaca", "defegde", "hijhklij".
# This is a partition so that each letter appears in at most one part.
# A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits S into less parts.
# Note:

# S will have length in range [1, 500].
# S will consist of lowercase letters ('a' to 'z') only.


def partition_labels(s)
  partitions = []
  hash = Hash.new
  for i in (0...s.size) do
    ch = s[i]
    hash[ch] = hash[ch].to_i + 1
  end
  # p hash
  current_hash = Hash.new
  len = 0
  for i in (0...s.size) do
    is_valid = true
    ch = s[i]
    current_hash[ch] = current_hash[ch].to_i + 1
    # p current_hash
    current_hash.each_key do |key|
      is_valid = is_valid && (current_hash[key].to_i == hash[key].to_i)
    end
    if is_valid
      current_hash = Hash.new
      partitions << len+1
      # p partitions
      len = 0
    else
      len += 1
    end
  end
  return partitions
end

class TestPartitionLabels < Test::Unit::TestCase
  def test_simple
    assert_equal([9,7,8], partition_labels('ababcbacadefegdehijhklij'))
  end 
end