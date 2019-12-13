require "test/unit"

# 347. Top K Frequent Elements
# Medium

# Given a non-empty array of integers, return the k most frequent elements.

# Example 1:
# Input: nums = [1,1,1,2,2,3], k = 2
# Output: [1,2]

# Example 2:
# Input: nums = [1], k = 1
# Output: [1]
# Note:

# You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
# Your algorithm's time complexity must be better than O(n log n), where n is the array's size.

def top_k_frequent(nums, k)
  # p nums.group_by{ |x| x }.values
  # => [[1, 1, 1], [2, 2], [3]]
  # p nums.sort.group_by(&:itself).values
  # p nums.group_by(&:itself).values
  # p nums.group_by(&:itself).values.sort_by{|x| x.size }.reverse 
  # p nums.group_by(&:itself).values.sort_by{|x| x.size }.reverse[0..k-1].map{|a| a[0]}
  return nums.group_by(&:itself).values.sort_by{|x| x.size }.reverse[0..k-1].map{|a| a[0]}
end


class TestTopKfrequent < Test::Unit::TestCase
  def test_simple
    assert_equal([1,2], top_k_frequent([1,1,1,2,2,3], 2))
    assert_equal([1], top_k_frequent([1], 1))
    assert_equal([2,-1], top_k_frequent([4,1,-1,2,-1,2,3], 2))
  end 
end



# 692. Top K Frequent Words
# Medium
# Given a non-empty list of words, return the k most frequent elements.

# Your answer should be sorted by frequency from highest to lowest. If two words have the same frequency, then the word with the lower alphabetical order comes first.

# Example 1:
# Input: ["i", "love", "leetcode", "i", "love", "coding"], k = 2
# Output: ["i", "love"]
# Explanation: "i" and "love" are the two most frequent words.
#     Note that "i" comes before "love" due to a lower alphabetical order.
# Example 2:
# Input: ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], k = 4
# Output: ["the", "is", "sunny", "day"]
# Explanation: "the", "is", "sunny" and "day" are the four most frequent words,
#     with the number of occurrence being 4, 3, 2 and 1 respectively.
# Note:
# You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
# Input words contain only lowercase letters.
# Follow up:
# Try to solve it in O(n log k) time and O(n) extra space.

# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent(words, k)
  return words.group_by(&:itself).values.sort_by{|x| x.size }.reverse[0..k-1].sort.map{|a| a[0]}
end