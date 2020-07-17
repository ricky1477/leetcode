
# https://leetcode.com/explore/learn/card/binary-search/138/background/1038/

# Binary Search

# Given a sorted (in ascending order) integer array nums of n elements
# and a target value, write a function to search target in nums. 
# If target exists, then return its index, otherwise return -1.

# Example 1:

# Input: nums = [-1,0,3,5,9,12], target = 9
# Output: 4
# Explanation: 9 exists in nums and its index is 4

# Example 2:

# Input: nums = [-1,0,3,5,9,12], target = 2
# Output: -1
# Explanation: 2 does not exist in nums so return -1
 

# Note:
# You may assume that all elements in nums are unique.
# n will be in the range [1, 10000].
# The value of each element in nums will be in the range [-9999, 9999].

def search(nums, target)
  # p nums
  return -1 if nums.empty?
  left, right = 0, nums.length - 1
  while(right >= left)
    middle = left + ((right - left) / 2)
    # p "#{left}|#{middle}|#{right}"
    if nums[middle] == target
      return middle
    elsif nums[middle] > target
      right = middle - 1
    else 
      left = middle + 1
    end
  end
  return -1
end



search([-10,-5,0,3,7], 7)
# assert_equal(0, fixed_point([0,2,5,8,17]))
# assert_equal(-1, fixed_point([-10,-5,3,4,7,9]))
# assert_equal(4, fixed_point([-10,-5,-2,0,4,5,6,7,8,9,10]))
# assert_equal(0, fixed_point([0,1,2,3,4]))
