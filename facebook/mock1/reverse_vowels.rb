require 'test/unit'
require 'byebug'
require 'set'

# https://leetcode.com/problems/reverse-vowels-of-a-string/
# 345. Reverse Vowels of a String
# Easy

# Write a function that takes a string as input and reverse 
# only the vowels of a string.

# Example 1:

# Input: "hello"
# Output: "holle"
# Example 2:

# Input: "leetcode"
# Output: "leotcede"
# Note:
# The vowels does not include the letter "y".

# -----
# def reverse_vowels(s)
#   return s if s.length < 2

#   rear_index = s.length-1
#   vowels = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
#   front_vowel_idx = []
#   back_vowel_idx = []
#   swapped = []
#   s[0..(s.length/2)].each_char.with_index do |ch, idx|

#     front_vowel_idx << idx if vowels.include?(ch)
#     back_vowel_idx << rear_index if vowels.include?(s[rear_index])

#     # Swap values if there's vowels to be swapped
#     if !front_vowel_idx.empty? && !back_vowel_idx.empty?
#       p '-swap-'
#       p "#{front_vowel_idx}|#{back_vowel_idx}"
#       # Don't swap values that were already swapped
#       unless swapped.include?(front_vowel_idx.first) || swapped.include?(back_vowel_idx.first)
#         swapped << front_vowel_idx.first
#         swapped << back_vowel_idx.first
#         s[front_vowel_idx.first], s[back_vowel_idx.first] = s[back_vowel_idx.first], s[front_vowel_idx.first]
#       end
#       p swapped
#       front_vowel_idx.shift
#       back_vowel_idx.shift
#     end

#     p "#{ch}|#{s[rear_index]}"
#     p "#{front_vowel_idx}|#{back_vowel_idx}"

#     rear_index -= 1
#     p s
#   end

#   s
# end

# @param {String} s
# @return {String}
def reverse_vowels(s)
  vowels = ['a', 'i', 'e', 'o', 'u', 'A', "I", "E", "O", "U" ]
  
  stack = [] 
  indices = []
  
  i = 0 
  while i < s.size 
    if vowels.include?(s[i])
      stack.push(s[i])
      indices.push(i)
    end
      
    i += 1
  end
  
  while stack.size > 0 
    letter = stack.pop 
    idx = indices.shift 
    s[idx] = letter
  end
  
  s
end


class TestClass < Test::Unit::TestCase
  def test_simple
    # assert_equal('holle', reverse_vowels('hello') )
    # assert_equal('leotcede', reverse_vowels('leetcode') )
    # assert_equal('euston saw I was not SuE.', reverse_vowels('Euston saw I was not Sue.') )
    # assert_equal("Marge, let's \"went.\" i awaIt news telegram.", reverse_vowels("Marge, let's \"went.\" I await news telegram.") )
    # assert_equal('ai', reverse_vowels('ia') )
    assert_equal(" ipG0A4mAas::si0m4a0Gp0", reverse_vowels(" apG0i4maAs::sA0m4i0Gp0"))
  end
end