require "test/unit"

# https://leetcode.com/problems/intersection-of-three-sorted-arrays/
# Easy 

# Given three integer arrays arr1, arr2 and arr3 sorted in strictly 
# increasing order, return a sorted array of only the integers that
#  appeared in all three arrays.

# Example 1:
# Input: arr1 = [1,2,3,4,5], arr2 = [1,2,5,7,9], arr3 = [1,3,4,5,8]
# Output: [1,5]
# Explanation: Only 1 and 5 appeared in the three arrays.
 

# Constraints:

# 1 <= arr1.length, arr2.length, arr3.length <= 1000
# 1 <= arr1[i], arr2[i], arr3[i] <= 2000


# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @param {Integer[]} arr3
# @return {Integer[]}
def arrays_intersection(arr1, arr2, arr3)
  hash_counters = {}

  arr1.each_with_index do |v, idx|
    hash_counters.has_key?(arr1[idx]) ? hash_counters[arr1[idx]]+=1 : hash_counters[arr1[idx]] = 1
    hash_counters.has_key?(arr2[idx]) ? hash_counters[arr2[idx]]+=1 : hash_counters[arr2[idx]] = 1
    hash_counters.has_key?(arr3[idx]) ? hash_counters[arr3[idx]]+=1 : hash_counters[arr3[idx]] = 1
  end

  hash_counters.map { |k, v| v == 3 ? k : nil }.compact
end

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal([1,5], arrays_intersection([1,2,3,4,5], [1,2,5,7,9], [1,3,4,5,8]))
  end 
end