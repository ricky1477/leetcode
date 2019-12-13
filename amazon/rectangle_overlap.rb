
# https://leetcode.com/problems/rectangle-overlap/


# 836. Rectangle Overlap
# Easy

# A rectangle is represented as a list [x1, y1, x2, y2], where (x1, y1) are the coordinates of its bottom-left corner, and (x2, y2) are the coordinates of its top-right corner.
# Two rectangles overlap if the area of their intersection is positive.  To be clear, two rectangles that only touch at the corner or edges do not overlap.
# Given two (axis-aligned) rectangles, return whether they overlap.

# Example 1:
# Input: rec1 = [0,0,2,2], rec2 = [1,1,3,3]
# Output: true

# Example 2:
# Input: rec1 = [0,0,1,1], rec2 = [1,0,2,1]
# Output: false
# Notes:

# Both rectangles rec1 and rec2 are lists of 4 integers.
# All coordinates in rectangles will be between -10^9 and 10^9.

def is_rectangle_overlap(rec1, rec2)
  # if rec1 right edge < rec2 left edge or vice versa
  if rec1[2] <= rec2[0] || rec2[2] <= rec1[0]
      return false
  # if rec1 top edge < rec2 bottom edge or vice versa
  elsif rec1[3] <= rec2[1] || rec2[3] <= rec1[1]
      return false
  end
  true
end