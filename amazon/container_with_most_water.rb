
require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/2963/


# Container With Most Water
# Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). 
# n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, 
# such that the container contains the most water.

# Note: You may not slant the container and n is at least 2.

# The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

# Example:

# Input: [1,8,6,2,5,4,8,3,7]
# Output: 49
# Hint #1
# The aim is to maximize the area formed between the vertical lines. The area of any container is calculated using the shorter line as length and the distance 
# between the lines as the width of the rectangle.
# Area = length of shorter vertical line * distance between lines
# We can definitely get the maximum width container as the outermost lines have the maximum distance between them. However, this container might not be the 
# maximum in size as one of the vertical lines of this container could be really short.
# Hint#2

# Start with the maximum width container and go to a shorter width container if there is a vertical line longer than the current containers shorter line. 
# This way we are compromising on the width but we are looking forward to a longer length container.

def max_area(height)
  left = 0 
  right = height.length - 1
  maxArea = 0    
  while (left < right)
    maxArea = [[height[left], height[right]].min * (right - left), maxArea].max
    # p [height[left]]
    # p [height[right]]
    # p [[height[left], height[right]].min * (right - left), maxArea]
    # p [[height[left], height[right]].min * (right - left), maxArea].max
    # p '---'
    height[left] > height[right] ? right -= 1 : left += 1
  end
  maxArea
end


class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(49, max_area([1,8,6,2,5,4,8,3,7]))
  end 
end