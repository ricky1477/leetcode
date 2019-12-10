require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/2972/

# Valid Parentheses
# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
# Note that an empty string is also considered valid.

# Example 1:

# Input: "()"
# Output: true
# Example 2:

# Input: "()[]{}"
# Output: true
# Example 3:

# Input: "(]"
# Output: false
# Example 4:

# Input: "([)]"
# Output: false
# Example 5:

# Input: "{[]}"
# Output: true
#    Hide Hint #1  
# An interesting property about a valid parenthesis expression is that a sub-expression of a valid expression should also be a valid expression. 
# (Not every sub-expression) e.g.
# { { } [ ] [ [ [ ] ] ] } is VALID expression
#           [ [ [ ] ] ]    is VALID sub-expression
#   { } [ ]                is VALID sub-expression
# Can we exploit this recursive structure somehow?
#    Hide Hint #2  
# What if whenever we encounter a matching pair of parenthesis in the expression, we simply remove it from the expression? This would keep on 
# shortening the expression. e.g.
# { { ( { } ) } }
#       |_|

# { { (      ) } }
#     |______|

# { {          } }
#   |__________|

# {                }
# |________________|

# VALID EXPRESSION!
#    Hide Hint #3  
# The stack data structure can come in handy here in representing this recursive structure of the problem. We can't really process this from the
#  inside out because we don't have an idea about the overall structure. But, the stack can help us process this recursively i.e. from outside to inwards.


def is_valid(s)
    
end

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(2, is_valid([-1,2,1,-4], 1))
  end 
end