require 'test/unit'
require 'byebug'
require 'set'

# A - Transform and conquer strategy O(n*logn)
  # 1) sort array
  # 2) 2 pointers to
  # Sorting first is fine if we just want to find
  # whether there is a two sum.  However, if we
  # sort the array we loose the indices.
# B - Use hash table O(n)


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# def two_sum(nums, target)
#   indexes = Hash.new
#   nums.each_with_index { |num, idx| indexes[num] = idx }
#   p indexes
#   byebug
#   indexes.each do |key, idx|
#     p 
#     return [idx, indexes[target-key]] if indexes[idx] + indexes[target-key] == target
#   end
#   return -1
#   # p complements
# end


# O(n) using only array
# Actually should use hash here since index and include will be O(n)
def two_sum(nums, target)
  idx = 0
  complement = nil
  while (idx < nums.length-1)
    complement = target - nums[idx]
    if nums[idx+1..nums.length-1].include?(complement)
      return [idx, nums[idx+1..nums.length-1].index(complement)+idx+1]
    end
    idx += 1
  end
  return -1
end

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal([0, 1], two_sum([2, 7, 11, 15], 9))
    assert_equal([1, 2], two_sum([3, 2, 4], 6))
    assert_equal([0, 1], two_sum([3, 3], 6))
    assert_equal([0, 2], two_sum([-3, 4, 3, 90], 0))    
  end
end