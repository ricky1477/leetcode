# https://leetcode.com/problems/roman-to-integer/
# Easy

# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
# For example, two is written as II in Roman numeral, just two one's added together. 
# Twelve is written as, XII, which is simply X + II. The number twenty seven is written
#  as XXVII, which is XX + V + II.

# Roman numerals are usually written largest to smallest from left to right. However, 
# the numeral for four is not IIII. Instead, the number four is written as IV. Because 
# the one is before the five we subtract it making four. The same principle applies to 
# the number nine, which is written as IX. There are six instances where subtraction is used:

# I can be placed before V (5) and X (10) to make 4 and 9. 
# X can be placed before L (50) and C (100) to make 40 and 90. 
# C can be placed before D (500) and M (1000) to make 400 and 900.
# Given a roman numeral, convert it to an integer. Input is guaranteed to be within 
# the range from 1 to 3999.

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


# @param {String} s
# @return {Integer}
def roman_to_int(s)
  sum = 0
  last_ch = nil
  rear_index = s.length-1
  # Loop from end to beginning
  s.each_char.with_index do |c, idx|
    last_ch == 'V' || last_ch == 'X' ? sum -= 1 : sum += 1 if s[rear_index] == 'I'
    sum += 5 if s[rear_index] == 'V'
    last_ch == 'L' || last_ch == 'C' ? sum -= 10 : sum += 10 if s[rear_index] == 'X'
    sum += 50 if s[rear_index] == 'L'
    last_ch == 'D' || last_ch == 'M' ? sum -= 100 : sum += 100 if s[rear_index] == 'C'
    sum += 500 if s[rear_index] == 'D'
    sum += 1000 if s[rear_index] == 'M'

    last_ch = s[rear_index]
    rear_index -= 1
  end
  
  sum
end