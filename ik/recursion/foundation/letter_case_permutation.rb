require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/letter-case-permutation/

# 784. Letter Case Permutation
# Medium
# Given a string S, we can transform every letter individually to be 
# lowercase or uppercase to create another string.

# Return a list of all possible strings we could create. You can return 
# the output in any order.

# Example 1:
# Input: S = "a1b2"
# Output: ["a1b2","a1B2","A1b2","A1B2"]

# Example 2:
# Input: S = "3z4"
# Output: ["3z4","3Z4"]

# Example 3:
# Input: S = "12345"
# Output: ["12345"]

# Example 4:
# Input: S = "0"
# Output: ["0"]
 
# Constraints:

# S will be a string with length between 1 and 12.
# S will consist only of letters or digits.

# @param {String} s
# @return {String[]}
def letter_case_permutation(s)
  result = Array.new
  res = Array.new
  helper(s, 0, result, res)
  res
end

def helper(input, i, result, res)
  # Base case/recurrence relation
  if (i == input.length)
    res << result.join
    return res
  end

  if(input[i].match?(/[[:digit:]]/))
    result.push(input[i])
    helper(input, i+1, result, res)
    result.pop
  else
    # Left branch lower case
    result.push(input[i].downcase)
    helper(input, i+1, result, res)
    result.pop

    # Right branch upper case
    result.push(input[i].upcase)
    helper(input, i+1, result, res)
    result.pop
  end
end


class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(['a1b2','a1B2','A1b2','A1B2'], letter_case_permutation('a1b2'))
    assert_equal(['3z4','3Z4'], letter_case_permutation('3z4'))
    assert_equal(['12345'], letter_case_permutation('12345'))
    assert_equal(['0'], letter_case_permutation('0'))
  end
end 