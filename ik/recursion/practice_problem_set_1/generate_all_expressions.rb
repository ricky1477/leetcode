require 'test/unit'
require 'byebug'
require 'set'

# https://uplevel.interviewkickstart.com/resource/rc-codingproblem-5666-34712-34-236

# Generate All Possible Expressions That Evaluate To The Given Target Value

# Given a string s that consists of digits (“0”..”9”) and target, a non-negative integer,
#  find all expressions that can be built from string s that evaluate to the target.

# When building expressions, you have to insert one of the following operators 
# between each pair of consecutive characters in s: “join” or “*” or “+”. For 
# example, by inserting different operators between the two characters of string 
# “12” we can get either 12 (1 joined with 2) or 2 (1*2) or 3 (1+2).

# Other operators such as “-” or “÷” are NOT supported.

# Expressions that evaluate to the target but only utilize a part of s do not
#    count: entire s has to be consumed.

# Precedence of the operators is conventional: “join” has the highest 
# precedence, “*” – medium and “+” has the lowest precedence. For example, 
# 1+2*34=(1+(2*(34)))=1+68=69.

# You have to return ALL expressions that can be built from string s and 
# evaluate to the target.

# Example One

# Input:
# s="222", target=24.

# Output:
# ["22+2", "2+22"] and ["2+22", "22+2"] are both correct outputs.
#     22+2=24: we inserted the “join” operator between the first two characters 
#     and the “+” operator between the last two characters of s.
#     2+22=24: we inserted the “+” operator between the first two characters 
#     and the “join” operator between the last two characters of s.

# Example Two
# Input: s="1234", target=11.

# Output: ["1+2*3+4"]

# Example Three
# Input:
# s="99", target=1.

# Output:
# []

# Notes
# Input Format: Function has two arguments: s and target.
# Output: Function must return an array of strings where each 
# string is an expression built from s evaluating exactly to the target.

# ALL such possible expressions have to be returned.
# Expressions can appear in the array in any order. For example, 
# both [“22+2”, “2+22”] and [“2+22”, “22+2”] will be accepted for s="222" 
# and target=24. Returned strings must not contain spaces or any 
# characters other than “0”..”9”, “*”, “+”. All returned strings must 
# start and end with a digit.

# Constraints:
#     1 <= length of s <= 13
#     0 <= target < 10^13

# Custom Input 
# Custom Input Format:
# First line of input contains string s.
# Second line of input contains integer target.
# If s=“222” and target=24 then custom input would be:
# 222
# 24

# Custom Output Format:
# Valid output consists of zero or more lines each containing an expression. For the sample input described above, one correct output is:
# 2+22
# 22+2
# another correct output is:
# 22+2
# 2+22

# Complete the generate_all_expressions function below.
def generate_all_expressions(s, target)
  result = Set.new
  slate = Array.new
  helper(s, 0, 0, result, slate, target)
  return result.to_a
end

def helper(string, idx, evaluated, result, slate, target)
  # Base case / recurrence relation
  if (idx == string.length)
    p "#{slate.join}:#{evaluated}"
    # expr = slate.join().sub(/\+0\d/, '+').sub(/\*0/, '*').sub(/^0/,'').sub(/\*0$/,'').sub(/\*$/,'').sub(/\+$/,'')
    # p expr
    # p '----'
    begin
      evaluation = eval(slate.join)
    rescue SyntaxError => e
      p '--yoooooo--'
      p slate.join().gsub(/\*0/, '*')
      p slate.join().gsub(/\*0/, '*').sub(/\+0/, '+')
      p slate.join().gsub(/\*0/, '*').sub(/\+0/, '+').sub(/\*0$/,'')
      p slate.join().gsub(/\*0/, '*').sub(/\+0/, '+').sub(/\*0$/,'').sub(/\+0$/,'')

      evaluation = eval(slate.join().sub(/\*0$/,'').sub(/\+0$/,'').gsub(/\*0/, '*').gsub(/\+0/, '+'))
    end
    result.add(slate.join()) if evaluation == target
    return
  end

  # p evaluated
  # p string[idx].to_i
  # p '----'
  
  # Join
  slate.push(string[idx])
  helper(string, idx+1, ([evaluated]+[string[idx].to_i]).join.to_i, result, slate, target)
  slate.pop

  # Multiply
  slate.empty? ? slate.push(string[idx]) : slate.push("*#{string[idx]}")
  evaluated = evaluated.zero? ? 1: evaluated
  helper(string, idx+1, evaluated*string[idx].to_i, result, slate, target)
  slate.pop

  # Add
  slate.empty? ? slate.push(string[idx]) : slate.push("+#{string[idx]}")
  helper(string, idx+1, evaluated+string[idx].to_i, result, slate, target)
  slate.pop
end


class TestClass < Test::Unit::TestCase
  def test_simple
    # assert_equal(['22+2', '2+22'], generate_all_expressions('222', 24))
    # assert_equal(['2*2', '2+2'], generate_all_expressions('22', 4))
    # assert_equal([], generate_all_expressions('65708450', 87688))
    # assert_equal([], generate_all_expressions('58100', 6587410))
    assert_equal([], generate_all_expressions('9909059799853', 764))
  end
end 
