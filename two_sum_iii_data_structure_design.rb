require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/two-sum-iii-data-structure-design/
# 170. Two Sum III - Data structure design
# Easy
# Design and implement a TwoSum class. It should support the following operations: add and find.

# add - Add the number to an internal data structure.
# find - Find if there exists any pair of numbers which sum is equal to the value.

# Example 1:

# add(1); add(3); add(5);
# find(4) -> true
# find(7) -> false
# Example 2:

# add(3); add(1); add(2);
# find(3) -> true
# find(6) -> false

class TwoSum
  # Initialize your data structure here.
  def initialize()
    @values = {}
  end
  
  # Add the number to an internal data structure..
  # :type number: Integer
  # :rtype: Void
  # O(1)
  def add(number)
    @values.key?(number) ? @values[number] += 1 : @values[number] = 1
  end
  
  # Find if there exists any pair of numbers which sum is equal to the value.
  # :type value: Integer
  # :rtype: Boolean

  # O(n)
  def find(value)
    @values.each do |k, v|
      complement = value - k
      if complement != k
        return true if @values.key?(complement)
      else
        return true if v > 1
      end
    end
    false
  end
end
  
  # Your TwoSum object will be instantiated and called as such:
  # obj = TwoSum.new()
  # obj.add(number)
  # param_2 = obj.find(value)

# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP

class TestClass < Test::Unit::TestCase
  def test_simple
    obj = TwoSum.new()
    obj.add(1)
    obj.add(3)
    obj.add(5)
    assert_equal(true, obj.find(4))
    assert_equal(false, obj.find(7))

    obj = TwoSum.new()
    obj.add(0)
    assert_equal(false, obj.find(0))

    obj = TwoSum.new()
    obj.add(0)
    obj.add(-1)
    obj.add(1)
    assert_equal(true, obj.find(0))

    obj = TwoSum.new()
    obj.add(3)
    obj.add(2)
    obj.add(1)
    assert_equal(false, obj.find(2))
    assert_equal(true, obj.find(3))
    assert_equal(true, obj.find(4))
    assert_equal(true, obj.find(5))
    assert_equal(false, obj.find(6))
  end
end






