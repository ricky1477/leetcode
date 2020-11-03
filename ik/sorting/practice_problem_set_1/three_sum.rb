require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/3sum/

# With debug statements

# def three_sum(nums)
#   p nums
#   p nums.sort!
#   idx = 0
#   results = []

#   while(idx < nums.length)
#     sub_array = nums[idx+1..nums.length-1]
#     p sub_array
#     left = 0
#     right = sub_array.length-1
#     target = -nums[idx]
#     sub_idx = 0
#     while(left<right)
#       rhs = sub_array[left] + sub_array[right]
#       p rhs
#       p "#{left}|#{right}"
#       if rhs == target
#         p 'found one'
#         results << [nums[idx],sub_array[left],sub_array[right]]
#         break
#       elsif rhs < target
#         left += 1
#       elsif rhs > target
#         right -= 1
#       end
#     end
#     p target
#     p sub_array
#     idx += 1
#   end
#   p results
# end


# O(n^2)
def three_sum(nums)
  nums.sort!
  idx = 0
  results = []

  while(idx < nums.length)
    sub_array = nums[idx+1..nums.length-1]
    left = 0
    right = sub_array.length-1
    target = -nums[idx]
    next if idx > 0 && 
    sub_idx = 0
    while(left<right)
      rhs = sub_array[left] + sub_array[right]
      if rhs == target
        # results << [nums[idx],sub_array[left],sub_array[right]]
        results << ["#{nums[idx]},#{sub_array[left]},#{sub_array[right]}"]
        left += 1
        right -= 1
      elsif rhs < target
        left += 1
      elsif rhs > target
        right -= 1
      end
    end
    idx += 1
  end
  results.uniq
end

class TestClass < Test::Unit::TestCase
  def test_simple
    # assert_equal(['10,-4,-6', '3,-4,1'], three_sum([10, 3, -4, 1, -6, 9]))
    assert_equal([[-6,-4,10], [-4,1,3]], three_sum([10, 3, -4, 1, -6, 9]))
    assert_equal([[-1,-1,2],[-1,0,1]], three_sum([-1,0,1,2,-1,-4]))
    assert_equal([], three_sum([]))
    assert_equal([], three_sum([0]))  
    assert_equal([[0,0,0]], three_sum([0,0,0,0]))
    assert_equal([[-2, 0, 2], [-2, 1, 1]], three_sum([-2,0,1,1,2]))
  end
end                                                                                                                                                                                                                                                                                                                                                                           