require "test/unit"

# The greatest common divisor (GCD), also called highest common factor (HCF) of N numbers is the largest positive integer that divides all numbers without giving a remainder.
# Write an algorithm to determine the GCD of N positive integers.

# INPUT
# The input to the function/method consists of two arguments - 
# num - an integer representing the number of positive integers (N). 
# arr - a list of positive integers.

# OUTPUT
# Return an integer representing the GCD of the given positive integers.

def generalizedGCD(num, arr)
  # WRITE YOUR CODE HERE
  sorted = arr.sort
  min = arr.sort.first
  max = arr.sort.last
  gcd = 1
  a=*(2..min).each do |int|
    divides = 0
    sorted.each do |num|
      #p "#{num}/#{int}=#{num%int}"
      divides += 1 if num%int == 0
    end
    gcd = int if divides == num
  end
  return gcd
end


class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(1, generalizedGCD(5,[2,3,4,5,6]))
    assert_equal(2, generalizedGCD(5,[2,4,6,8,10]))
    assert_equal(6, generalizedGCD(2,[54,24]))
    assert_equal(3, generalizedGCD(4,[3,6,9,12]))
  end 
end
