
require "test/unit"

# https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/3009/

# MEDIUM

#   String to Integer (atoi)
#   Implement atoi which converts a string to an integer.
  
#   The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, 
#   takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
  
#   The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
  
#   If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains 
#   only whitespace characters, no conversion is performed.
  
#   If no valid conversion could be performed, a zero value is returned.
  
#   Note:
  
#   Only the space character ' ' is considered as whitespace character.
#   Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
#   Example 1:
  
#   Input: "42"
#   Output: 42
#   Example 2:
  
#   Input: "   -42"
#   Output: -42
#   Explanation: The first non-whitespace character is '-', which is the minus sign.
#                Then take as many numerical digits as possible, which gets 42.
#   Example 3:
  
#   Input: "4193 with words"
#   Output: 4193
#   Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
#   Example 4:
  
#   Input: "words and 987"
#   Output: 0
#   Explanation: The first non-whitespace character is 'w', which is not a numerical 
#                digit or a +/- sign. Therefore no valid conversion could be performed.
#   Example 5:
  
#   Input: "-91283472332"
#   Output: -2147483648
#   Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
#                Thefore INT_MIN (−231) is returned.

# def my_atoi(str)
#   int_max = 2147483647
#   int_min = -2147483648
#   result = str.to_i
#   return int_max if result > int_max
#   return int_min if result < int_min
#   result
# end

def my_atoi(str)
  int_max=(2**31)-1 # INT_MAX (231 − 1)
  int_min=-(2**31) # INT_MIN (−231)
  negative=nil
  digits=""
  str.chars.each do |char|
    if digits == "" && negative.nil?
      next if char == ' '
      if char == '-'
        negative = true
        next
      elsif char == '+'
        negative = false
        next
      elsif char =~ /[0-9]/
        negative = false
      end
    end
    break unless char =~ /[0-9]/
    digits << char
  end
   
  number=0
  digits.chars.reverse.each_with_index do |num, position|
    if negative
      # Convert string to number
      # '3'.ord-48 => 3
      # ord -> Returns the codepoint of the first character of the string, 
      # assuming a single-byte character encoding
      # https://apidock.com/rails/String/ord
      # https://en.wikipedia.org/wiki/Code_point
      number-=(num.ord-48)*10**position
    else
      number+=(num.ord-48)*10**position
    end
  end
   
  return int_max if number >= int_max
  return int_min if number <= int_min
  return number
end

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(42, my_atoi('42'))
    assert_equal(-42, my_atoi('    -42'))
    assert_equal(4193, my_atoi('4193 with words'))
    assert_equal(0, my_atoi('words and 987'))
    assert_equal(-2147483648, my_atoi('-91283472332'))
  end 
end