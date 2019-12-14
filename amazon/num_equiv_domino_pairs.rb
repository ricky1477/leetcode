require 'test/unit'
require 'byebug'

# https://leetcode.com/problems/number-of-equivalent-domino-pairs/

# 1128. Number of Equivalent Domino Pairs
# Easy
# Given a list of dominoes, dominoes[i] = [a, b] is equivalent to dominoes[j] = [c, d] if and only if either (a==c and b==d), or (a==d and b==c) - that is, one domino can be rotated to be equal to another domino.

# Return the number of pairs (i, j) for which 0 <= i < j < dominoes.length, and dominoes[i] is equivalent to dominoes[j].

# Example 1:
# Input: dominoes = [[1,2],[2,1],[3,4],[5,6]]
# Output: 1
 

# Constraints:

# 1 <= dominoes.length <= 40000
# 1 <= dominoes[i][j] <= 9

# @param {Integer[][]} dominoes
# @return {Integer}
def num_equiv_domino_pairs(dominoes)
  pairs = 0
  # p dominoes
  dominoes.each.with_index do |domino, i|
    # p '---'
    tmp = dominoes.dup
    tmp.delete_at(i)
    # p "tmp: #{tmp}"
    tmp.each.with_index do |domino_two, j|
      # p "#{domino}:#{domino_two}"
      # p is_equiv?(domino, domino_two)
      pairs += 1 if is_equiv?(domino, domino_two)
    end
  end
  return pairs / 2
end

def is_equiv?(dom1, dom2)
  (dom1[0] == dom2[0] and dom1[1] == dom2[1]) || (dom1[0] == dom2[1] and dom1[1] == dom2[0]) ? true : false
end

### Ruby is LTE


# JS solution

# var numEquivDominoPairs = function(dominoes) {
#   let count = 0;
#   let record = {};
  
#   for(let i = 0; i < dominoes.length; i += 1) {
#     if(dominoes[i][0] > dominoes[i][1]) {
#       const temp = dominoes[i][0];
#       dominoes[i][0] = dominoes[i][1];
#       dominoes[i][1] = temp;
#     }
#     const key = dominoes[i].join(',');
#     if(!record[key]) {
#       record[key] = 1;
#     } else {
#       count += record[key];
#       record[key] += 1;
#     }
#   }
#   return count;
# };


class Test3SumClosest < Test::Unit::TestCase
  def test_simple
    assert_equal(1, num_equiv_domino_pairs([[1,2],[2,1],[3,4],[5,6]]))
    assert_equal(0, num_equiv_domino_pairs([[1,2],[2,2],[3,4],[5,6]]))
    assert_equal(2, num_equiv_domino_pairs([[1,2],[2,1],[3,4],[3,4]]))
  end 
end
