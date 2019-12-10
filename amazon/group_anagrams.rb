
require "test/unit"
require 'byebug'
# https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/2970/

# Group Anagrams
# Given an array of strings, group anagrams together.

# Example:

# Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
# Output:
# [
#   ["ate","eat","tea"],
#   ["nat","tan"],
#   ["bat"]
# ]
# Note:

# All inputs will be in lowercase.
# The order of your output does not matter.

### The big idea is that all anagrams are identical when sorted.

def group_anagrams(strs)
  strs.sort.group_by { |s| s.chars.sort }.values
end

# def group_anagrams(strs)
#   output = Array.new
#   output << [strs[0]]
#   #p output
#   strs[1..strs.length-1].each do |str|
#     #byebug
#     #p str
#     if anagrams_uniq(output).flatten.include?(str.chars.sort.join)
#       # p '--include--'
#       # p anagrams_uniq(output)
#       # p anagrams_uniq(output).flatten.index(str.chars.sort.join)
#       output[anagrams_uniq(output).flatten.index(str.chars.sort.join)] << str
#     else
#       output << [str]
#     end
#     #p output
#   end
#   return output
# end

# def anagrams_uniq(arr)
#   arr.map{|row| row.map{|s| s.chars.sort.join}.uniq}
# end



class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal([["eat","tea","ate"],["tan","nat"],["bat"]], group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
  end 
end