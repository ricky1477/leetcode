require "test/unit"

#https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/2965/

# Roman to Integer
# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
# For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. 
# The number twenty seven is written as XXVII, which is XX + V + II.

# Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number 
# four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which 
# is written as IX. There are six instances where subtraction is used:

# I can be placed before V (5) and X (10) to make 4 and 9. 
# X can be placed before L (50) and C (100) to make 40 and 90. 
# C can be placed before D (500) and M (1000) to make 400 and 900.
# Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.

# Example 1:

# Input: "III"
# Output: 3
# Example 2:

# Input: "IV"
# Output: 4
# Example 3:

# Input: "IX"
# Output: 9
# Example 4:

# Input: "LVIII"
# Output: 58
# Explanation: L = 50, V= 5, III = 3.
# Example 5:

# Input: "MCMXCIV"
# Output: 1994
# Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

def roman_to_int(s)
  sum = 0
  last_char = nil
  s.reverse.each_char do |c|
      sum += 
          case c
          when 'I' then (last_char == 'V' || last_char == 'X' ) ? -1 : 1
          when 'V' then 5
          when 'X' then (last_char == 'L' || last_char == 'C' ) ? -10 : 10 
          when 'L' then 50
          when 'C' then (last_char == 'D' || last_char == 'M' ) ? -100 : 100 
          when 'D' then 500
          when 'M' then 1000
          end
      last_char = c
  end           
  sum
end


class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(3, int_to_roman('III'))
    assert_equal(4, int_to_roman('IV'))
    assert_equal(58, int_to_roman('LVIII'))
    assert_equal(1994, int_to_roman('MCMXCIV'))
  end 
end