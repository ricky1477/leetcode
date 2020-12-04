# https://uplevel.interviewkickstart.com/resource/rc-codingproblem-5659-29811-4-88

require 'test/unit'
require 'byebug'
require 'set'

# T(n) = O(n)
# S(n) = O(n) -> one hash of same size of input array
# Lexicographical Order
def solve(arr)
  lex_hash = Hash.new
  arr.each do |string|
    key, value = string.split
    if lex_hash.has_key?(key)
      # Increment count
      subkey = lex_hash[key].keys.first + 1
      # Lexicographically greater
      subvalue = lex_hash[key].values.first > value ? lex_hash[key].values.first : value
      # Build subhash
      tmp_hash = {subkey => subvalue}
      lex_hash[key] = tmp_hash
    else
      lex_hash[key] = {1 => value}
    end
  end
  return lex_hash.map{|k, v| "#{k}:#{v.keys.first},#{v.values.first}"}
end



class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(["key1:3,hello", "key2:1,zzz", "key3:1,world"], solve(["key1 abcd", "key2 zzz", "key1 hello", "key3 world", "key1 hello"]))
  end
end 