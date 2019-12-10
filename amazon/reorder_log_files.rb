require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/2974/

# Reorder Log Files
# You have an array of logs.  Each log is a space delimited string of words.

# For each log, the first word in each log is an alphanumeric identifier.  Then, either:

# Each word after the identifier will consist only of lowercase letters, or;
# Each word after the identifier will consist only of digits.
# We will call these two varieties of logs letter-logs and digit-logs.  It is guaranteed that each log has at least one word after its identifier.

# Reorder the logs so that all of the letter-logs come before any digit-log.  The letter-logs are ordered lexicographically ignoring identifier,
#  with the identifier used in case of ties.  The digit-logs should be put in their original order.

# Return the final order of the logs.

# Example 1:

# Input: logs = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]
# Output: ["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"]
 

# Constraints:

# 0 <= logs.length <= 100
# 3 <= logs[i].length <= 100
# logs[i] is guaranteed to have an identifier, and a word after the identifier.

def reorder_log_files(logs)
  let, dig = [], []
  logs.each do |log|
    if ( log.split(' ')[1..log.length-1].join(' ') ) =~ /\d+/
      dig << log 
    else
      let << log
    end
  end
  # p let
  # p dig
  # p let.sort_by {|log| log.split(' ')[1..log.length-1]}
  # p let.sort_by {|log| [ log.split(' ')[1..log.length-1] , log.split(' ')[0] ] }
              # Sort first          lexicographically then with identifier (if ties)
  sorted_let = let.sort_by {|log| [ log.split(' ')[1..log.length-1] , log.split(' ')[0] ] }
  return sorted_let+dig
end

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"], reorder_log_files(["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]))
    assert_equal(["g1 act car","a8 act zoo","ab1 off key dog","a1 9 2 3 1","zo4 4 7"], reorder_log_files(["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo"]))
    assert_equal(["a2 act car","g1 act car","a8 act zoo","ab1 off key dog","a1 9 2 3 1","zo4 4 7"], reorder_log_files(["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo","a2 act car"]))
    #assert_equal([], reorder_log_files([]))
  end 
end