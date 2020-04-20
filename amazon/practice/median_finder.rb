require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/81/design/495/

# Find Median from Data Stream
# Median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value. So the median is the mean of the two middle value.

# For example,
# [2,3,4], the median is 3

# [2,3], the median is (2 + 3) / 2 = 2.5

# Design a data structure that supports the following two operations:

# void addNum(int num) - Add a integer number from the data stream to the data structure.
# double findMedian() - Return the median of all elements so far.
 

# Example:

# addNum(1)
# addNum(2)
# findMedian() -> 1.5
# addNum(3) 
# findMedian() -> 2
 

# Follow up:

# If all integer numbers from the stream are between 0 and 100, how would you optimize it?
# If 99% of all integer numbers from the stream are between 0 and 100, how would you optimize it?


class MedianFinder
  # initialize your data structure here.
  def initialize  
    @state = []    
  end
    
  # :type num: Integer
  # :rtype: Void
  def add_num(num)
    @state.push(num)
  end
    
  # :rtype: Float
  def find_median()
    if @state.length.even?
      ( ( @state.at(@state.length/2-1).to_f + @state.at(@state.length/2).to_f ) / 2).round(1)
    else
      (@state.at(@state.length/2).to_f).round(1)
    end
  end
end

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    obj = MedianFinder.new()
    obj.add_num(1)
    obj.add_num(2)
    assert_equal(1.5, obj.find_median)
    obj.add_num(3)
    assert_equal(2, obj.find_median)
  end
  def test_two
    obj = MedianFinder.new()
    obj.add_num(6)
    assert_equal(6, obj.find_median)
    obj.add_num(10)
    assert_equal(8, obj.find_median)
    obj.add_num(2)
    assert_equal(10, obj.find_median)
    obj.add_num(6)
    assert_equal(6, obj.find_median)
    obj.add_num(5)
    assert_equal(2, obj.find_median)
    obj.add_num(0)
    assert_equal(4, obj.find_median)

    obj.add_num(6)
    assert_equal(6, obj.find_median)

    obj.add_num(3)
    assert_equal(5.5, obj.find_median)

    obj.add_num(1)
    assert_equal(5, obj.find_median)

    obj.add_num(0)
    assert_equal(2.5, obj.find_median)

    obj.add_num(0)
    assert_equal(0, obj.find_median)
  end 
end
    
# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder.new()
# obj.add_num(num)
# param_2 = obj.find_median()