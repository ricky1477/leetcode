require "test/unit"

# You are given two arrays (without duplicates) nums1 and nums2 where 
# nums1’s elements are subset of nums2. Find all the next greater 
# numbers for nums1's elements in the corresponding places of nums2.

# # The Next Greater Number of a number x in nums1 is the first greater
#  number to its right in nums2. If it does not exist, output -1 for this number.

# # Example 1:
# # Input: nums1 = [4,1,2], nums2 = [1,3,4,2].
# # Output: [-1,3,-1]
# # Explanation:
# #     For number 4 in the first array, you cannot find the next 
# greater number for it in the second array, so output -1.
# #     For number 1 in the first array, the next greater number 
# for it in the second array is 3.
# #     For number 2 in the first array, there is no next greater 
# number for it in the second array, so output -1.
# # Example 2:
# # Input: nums1 = [2,4], nums2 = [1,2,3,4].
# # Output: [3,-1]
# # Explanation:
# #     For number 2 in the first array, the next greater number 
# for it in the second array is 3.
# #     For number 4 in the first array, there is no next greater
#  number for it in the second array, so output -1.
# # Note:
# # All elements in nums1 and nums2 are unique.
# # The length of both nums1 and nums2 would not exceed 1000.


# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def next_greater_element(nums1, nums2)
  hash_values = Hash.new { |h, k| h[k] = -1 }

  nums2.each_with_index do |val, idx|
    hash_values[val] = -1
    p val
    nums2[idx+1..nums2.length-1].each do |x| 
      if x>val 
        hash_values[val] = x
        break
      end
    end unless idx == nums2.length-1

    p '----'
  end

  p hash_values

  return nums1.map{|v| hash_values[v]}
end


class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal([-1,3,-1], next_greater_element([4,1,2], [1,3,4,2]))
    assert_equal([3,-1], next_greater_element([2,4], [1,2,3,4]))
    assert_equal([7,7,7,7,7], next_greater_element([1,3,5,2,4], [6,5,4,3,2,1,7]))
  end 
end