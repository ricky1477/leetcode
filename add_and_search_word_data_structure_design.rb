require 'test/unit'
require 'byebug'

# https://leetcode.com/problems/add-and-search-word-data-structure-design/

# 211. Add and Search Word - Data structure design
# Medium

# Design a data structure that supports the following two operations:

# void addWord(word)
# bool search(word)
# search(word) can search a literal word or a regular expression string containing 
# only letters a-z or .. A . means it can represent any one letter.

# Example:

# addWord("bad")
# addWord("dad")
# addWord("mad")
# search("pad") -> false
# search("bad") -> true
# search(".ad") -> true
# search("b..") -> true
# Note:
# You may assume that all words are consist of lowercase letters a-z.

# trie Data structure


class TrieNode
  attr_accessor :children, :finish
  
  def initialize()
    @children = Hash.new
    @finish = false
  end
  
end

class WordDictionary
  attr_accessor :root

  # Initialize your data structure here.
  def initialize()
    @root = TrieNode.new
  end
  
  
  # Adds a word into the data structure.
  # :type word: String
  # :rtype: Void
  def add_word(word)
    cur = @root
    
    word.each_char do |ch|
      #if cur.children[ch]&.key?
      if cur.children.key?(ch)
        cur = cur.children[ch]
      else
        cur.children[ch] = TrieNode.new
        cur = cur.children[ch]
      end
      # p @root
      # p '----'
    end
    
    cur.finish = true
  end
  
  
  # Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter.
  # :type word: String
  # :rtype: Boolean
  # def search(word, node=nil)
  #   cur ||= @root
    
  #   word.each_char.with_index do |ch, i|
  #     # p ch
  #     # p cur.children[ch]
  #     if ch == '.'
  #       p "#{ch}--"
  #       #p c
  #       cur.children.keys.each do |char| 
  #         #byebug
  #         p char
  #         p "--"
  #         p cur
  #         # p "--"
  #         # p cur.children.keys
  #         p "--"
  #         p cur.children[char]
  #         #p cur.children[ch]
  #         search(word[i+1..word.length-1], cur.children[char])
  #         p '-()()-'
  #       end
  #     elsif cur.children.key?(ch)
  #       cur = cur.children[ch]
  #     else
  #       false
  #     end
      
  #     return true if cur.finish
  #   end
  #   return false
  # end

  def search(word, node=nil)
    node ||= @root
    return node.finish if word.length == 0
    if word[0] == '.'
      p node.children
      results = node.children.map do |k,v|
        search(word[1..-1],v)
      end
      #p results
      return results.any?
    else
      return false if node.children[word[0]].nil?
      return search(word[1..-1],node.children[word[0]])
    end
end
  
end
  
# Your WordDictionary object will be instantiated and called as such:
obj = WordDictionary.new()
obj.add_word('bad')
obj.add_word('dad')
obj.add_word('mad')

# p obj
# p obj.root
# p obj.root.children
# p '--'
# p obj.root.children['b']
# p obj.root.children.keys


# p '***'

p obj.search('pad')
p obj.search('bad')
p obj.search('.ad')
p obj.search('b..')
# p obj.search('.a.')


# https://coderpad.io/JKD4M66R
# https://app.slack.com/client/TA4657GMC/CA6DT4UGP


class TestClass < Test::Unit::TestCase
  def test_simple
    # assert_equal(true, can_three_parts_equal_sum([0,2,1,-6,6,-7,9,1,2,0,1]))
    # assert_equal(false, can_three_parts_equal_sum([0,2,1,-6,6,7,9,-1,2,0,1]))
    # assert_equal(true, can_three_parts_equal_sum([3,3,6,5,-2,2,5,1,-9,4]))
    # assert_equal(true, can_three_parts_equal_sum([10,-10,10,-10,10,-10,10,-10]))
  end 
end
