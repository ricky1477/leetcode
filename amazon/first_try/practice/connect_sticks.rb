require 'test/unit'
require 'byebug'

# https://leetcode.com/problems/minimum-cost-to-connect-sticks/

# 1167. Minimum Cost to Connect Sticks
# Medium

# You have some sticks with positive integer lengths.

# You can connect any two sticks of lengths X and Y into one stick by paying a cost of X + Y.  You perform this action until there is one stick remaining.

# Return the minimum cost of connecting all the given sticks into one stick in this way.

# Example 1:
# Input: sticks = [2,4,3]
# Output: 14

# Example 2:
# Input: sticks = [1,8,3,5]
# Output: 30

# Constraints:
# 1 <= sticks.length <= 10^4
# 1 <= sticks[i] <= 10^4

def connect_sticks(sticks)
  cost = 0
  while sticks.length > 1
    # p "#{sticks}|#{cost}"
    # p '----'
    sticks, cost = connect(sticks, cost)
  end
  # p "#{sticks}|#{cost}"
  return cost
end

def connect(arr, cost)
  arr.sort!
  arr[1] = arr[0]+arr[1]
  cost += arr[1]
  return [arr[1]]+arr[2..arr.length-1], cost
end

class TestTopKfrequent < Test::Unit::TestCase
  def test_simple
    assert_equal(14, connect_sticks([2,4,3]))
    assert_equal(30, connect_sticks([1,8,3,5]))
    assert_equal(58, connect_sticks([8, 4, 6, 12]))
    assert_equal(54, connect_sticks([20, 4, 8, 2]))
    assert_equal(224, connect_sticks([1, 2, 5, 10, 35, 89]))
    assert_equal(20, connect_sticks([2, 2, 3, 3]))
  end 
end


# public static int minCost(List<Integer> ropes) {
#     Queue<Integer> pq = new PriorityQueue<>(ropes);
#     int totalCost = 0;
#     while (pq.size() > 1) {
#         int cost = pq.poll() + pq.poll();
#         pq.add(cost);
#         totalCost += cost;
#     }
#     return totalCost;
# }