# https://uplevel.interviewkickstart.com/resource/rc-codingproblem-5660-31446-7-99

# Merge One Sorted Array Into Another
# Merge One Sorted Array Into Another


# Given two arrays:

# 1) arr1 of size n, which contains n positive integers sorted in the ascending order.

# 2) arr2 of size (2*n) (twice the size of first), which contains n positive integers 
# sorted in the ascending order in its first half. Second half of this array arr2 is empty.
# (Empty elements are marked by 0).

# Write a function that takes these two arrays, and merges the first one into second one,
# resulting in an increasingly sorted array of (2*n) positive integers. 


# Example

# Input:

# n = 3

# arr1 = [1 3 5]

# arr2 = [2 4 6 0 0 0]


# Output: arr2 = [1 2 3 4 5 6]


# Notes

# Input Parameters: There are two arguments. First one is an integer array denoting
# arr1 and second one is also an integer array denoting arr2.


# Output: You don't have to return anything. You just need to modify the given array arr2.


# Constraints:

# 1 <= n <= 10^5
# 1 <= arr1[i] <= 2 * 10^9
# 1 <= arr2[i] <= 2 * 10^9 (for the first half)
# arr2[i] = 0 (for the second half)
# You can use only constant extra space.
# 0 denotes an empty space.


# Custom Input

# Input Format: The first line of input should contain an integer n, denoting size 
# of input array arr1. In next n lines, ith line should contain an integer arr1[i], denoting value at index i of arr1. 

# In next line, there should be an integer (2*n), denoting size of input array arr2.
# In next (2*n) lines, ith line should contain an integer arr2[i], denoting value at index i of arr2.

# If n = 3, arr1 = [1, 3, 5] and arr2 = [2, 4, 6, 0, 0, 0], then input should be:

# 3

# 1

# 3

# 5

# 6

# 2

# 4

# 6

# 0

# 0

# 0


# Output Format: There will (2*n) lines of output, where ith line contains an integer arr2[i], denoting value at index i of arr2. For input n = 3, arr1 = [1, 3, 5] and arr2 = [2, 4, 6, 0, 0, 0], output will be:

# 1

# 2

# 3

# 4

# 5

# 6

# Complete the merger_first_into_second function below.
def merger_first_into_second(arr1, arr2)
  i = arr1.length - 1 
  j = i
  k = arr2.length - 1
  # p i
  # p j
  # p k
  # p '---'
  
  while (i >= 0 && j >= 0)
      #p arr1[i]
      #p arr2[j]
      
      if arr2[j] > arr1[i]
          arr2[k] = arr2[j]
          j -= 1
      else
          arr2[k] = arr1[i]
          i -= 1  
      end
      
      k -= 1 
      # p "#{i}|#{j}"
      # p arr2
  end
  
  arr2[0] = (i==0 ? arr1[i] : arr2[j])
  # p arr2
  # p '****'
end
