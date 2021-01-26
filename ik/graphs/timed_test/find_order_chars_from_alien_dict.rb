require 'test/unit'
require 'byebug'
require 'set'

# https://uplevel.interviewkickstart.com/resource/rc-codingproblem-5682-42330-56-343

# Find Order Of Characters From Alien Dictionary
# Given a sorted dictionary of an alien language, find the order of characters in the alphabet.

# Example One
# Input: ["baa", "abcd", "abca", "cab", "cad"]
# Output: "bdac"


# Example Two
# Input: words = ["caa", "aaa", "aab"]
# Output: "cab"

# Notes
# Input Parameters: Function has one argument, array of strings, the dictionary 
# sorted in the lexicographical order of the alien language.

# Output: Return a string consisting of all the characters of the alien alphabet, in order.

# Constraints:

#     1 <= characters in all the words in the dictionary <= 10^5
#     Input will consist of lowercase latin characters only.
#     Input will be such that it is possible to determine the alphabet order uniquely.
#     The dictionary may contain duplicate words.


# Custom Input

# Input Format: The first line of input should contain an integer n, denoting 
# ize of input array words. In next n lines, i-th line should contain a string 
# words[i], denoting a value at index i of words.

# If n = 5 and words = ["baa", "abcd", "abca", "cab", "cad"], then input should be:
# 5
# baa
# abcd
# abca
# cab
# cad

# Output Format: There will be only one line of output, containing a string ordered,
# denoting the result returned by solution function. For input n = 5 and 
# words = ["baa", "abcd", "abca", "cab", "cad"], output will be: bdac

# Complete the find_order function below.
def find_order(words)
  edges = []
  adj_list = []
  words.each_with_index do |word, idx|
    # next if idx == words.length-1
    break if idx == words.length-1
    nxt_word = words[idx + 1]
    edges << compare_words(word, nxt_word)
  end
  # Remove non array elements
  edges.select!{|e| e.is_a?(Array)}
  # p edges
  if (edges.empty?)
    # p words[0]
    return words[0].chars.first
  else
    adj_list = adj_list(edges.uniq)
    # p adj_list
    return topological_sort(adj_list)
  end
end

# Find first lexicographical difference that will become graph edge
def compare_words(word1, word2)
  word1.each_char.with_index do |ch, idx|
    return [word1[idx],word2[idx]] if word1[idx] != word2[idx]
  end
end

def adj_list(edges)
  adj_list = Hash.new { |h, k| h[k] = [] }
  edges.each do |src, dst|
    adj_list[src] << dst
    # For undirected graphs
    # adj_list[dst] << src
  end
  adj_list
end

def topological_sort(adj_list)
  in_degrees = Hash.new{0}
  adj_list.keys.map{|wrd| in_degrees[wrd] = 0}
  indegree = get_in_degrees(adj_list, in_degrees)

  q = Array.new()
  topsort = Array.new()

  # Find nodes where in_degree == 0
  for i in indegree
    q.push(i[0]) if i[1] == 0
  end

  # Loop through the entire list until the in-degrees of all nodes become zero 
  while (!q.empty?)
    current = q.pop
    topsort.push(current)

    adj_list[current[0]].each do |neighbor|
      indegree[neighbor] -= 1
      if indegree[neighbor] == 0
        q.push(neighbor[0]) if neighbor
      end
    end
  end

  topsort.join
end

def get_in_degrees(adj_list, in_degrees)
  adj_list.each do |src, dest|
    dest.each {|node| in_degrees[node] += 1}
  end
  in_degrees
end

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal('bdac', find_order(["baa", "abcd", "abca", "cab", "cad"]))
    assert_equal('cab', find_order(["caa", "aaa", "aab"]))
    assert_equal('a', find_order(["a"]))
    assert_equal('e', find_order(["eeeeeeeeeeee"]))
    assert_equal('g', find_order(['g', 'g', 'g', 'g']))
    assert_equal('vhc', find_order(['vvvv', 'vvvc', 'hhhhvv', 'hhhcv', 'ccc', 'ccc']))
  end
end 