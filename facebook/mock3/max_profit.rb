
require "test/unit"

# Say you have an array for which the ith element is the 
# price of a given stock on day i.

# If you were only permitted to complete at most one 
# transaction (i.e., buy one and sell one share of the stock),
#  design an algorithm to find the maximum profit.

# Note that you cannot sell a stock before you buy one.

# Example 1:

# Input: [7,1,5,3,6,4]
# Output: 5
# Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
#              Not 7-1 = 6, as selling price needs to be larger than buying price.
# Example 2:

# Input: [7,6,4,3,1]
# Output: 0
# Explanation: In this case, no transaction is done, i.e. max profit = 0.


# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.length < 2

  min = (2**31)
  profits = []
  prices.each_with_index do |price, index|
    profits << price - min
    min = price if price < min
    # p min
    # p price
    # p profits
  end
  max = profits.max
  max > 0 ? max : 0
end

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(5, max_profit([7,1,5,3,6,4]))
    assert_equal(0, max_profit([7,6,4,3,1]))
  end 
end