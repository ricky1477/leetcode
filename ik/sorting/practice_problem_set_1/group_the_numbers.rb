require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/sort-array-by-parity/

# def solve(arr)
#   left = 0
#   right = arr.length - 1
#   p arr
#   p '----'
#   while(left < right)
#     p "#{left}|#{right}"
#     if (arr[left].odd? && arr[right].even?)
#       p 'swap'
#       arr[left], arr[right] = arr[right], arr[left]
#       left += 1
#       right -= 1
#     elsif arr[left].even?
#       p 'move left up'
#       left += 1
#     elsif arr[right].odd?
#       p 'move right down'
#       right -= 1
#       p "#{left}|#{right}"
#     end
#   end
#   arr
# end

# O(n)
def solve(arr)
  left = 0
  right = arr.length - 1
  while(left < right)
    if (arr[left].odd? && arr[right].even?)
      arr[left], arr[right] = arr[right], arr[left]
      left += 1
      right -= 1
    elsif arr[left].even?
      left += 1
    elsif arr[right].odd?
      right -= 1
    end
  end
  arr
end


class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal([4, 2, 1, 3], solve([3, 1, 2, 4]))
    assert_equal([4, 2, 3, 1], solve([1, 2, 3, 4]))
    assert_equal([0,1,3], solve([1,0,3]))
  end
end   


# Leetcode version:
def sort_array_by_parity(a)
  left = 0
  right = a.length - 1
  while(left < right)
    if (a[left].odd? && a[right].even?)
      a[left], a[right] = a[right], a[left]
      left += 1
      right -= 1
    elsif a[left].even?
      left += 1
    elsif a[right].odd?
      right -= 1
    end
  end
  a
end