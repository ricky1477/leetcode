require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/481/


# Integer to English Words
# Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.

# Example 1:
# Input: 123
# Output: "One Hundred Twenty Three"

# Example 2:
# Input: 12345
# Output: "Twelve Thousand Three Hundred Forty Five"

# Example 3:
# Input: 1234567
# Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"

# Example 4:
# Input: 1234567891
# Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"

#    Hide Hint #1  
# Did you see a pattern in dividing the number into chunk of words? For example, 123 and 123000.
#    Hide Hint #2  
# Group the number by thousands (3 digits). You can write a helper function that takes a number less than 1000 and convert just that chunk to words.
#    Hide Hint #3  
# There are many edge cases. What are some good test cases? Does your code work with input such as 0? Or 1000010? (middle chunk is zero and should not be printed out)

LESS_THAN_20 = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight",
  "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
TENS = ["", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
THOUSANDS = ["", "Thousand", "Million", "Billion"]

def number_to_words(num)
  return "Zero" if num ==0
  words = ""
  i = 0
   while (num > 0)
      if (num % 1000 != 0)
        words = helper(num % 1000) +THOUSANDS[i] + " " + words
      end
    num /= 1000
    i+=1
  end
  words.strip!
end

def helper(num)
  return '' if num == 0
  if (num < 20)
    return LESS_THAN_20[num] + " "
  elsif (num < 100)
    return TENS[num / 10] + " " + helper(num % 10)
  else
    return LESS_THAN_20[num / 100] + " Hundred " + helper(num % 100)
  end
end
    
    
class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal('One Hundred Twenty Three', number_to_words(123))
    assert_equal('Twelve Thousand Three Hundred Forty Five', number_to_words(12345))
    assert_equal('One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven', number_to_words(1234567))
    assert_equal('One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One', number_to_words(1234567891))
  end 
end