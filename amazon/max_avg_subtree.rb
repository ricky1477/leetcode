# 1120. Maximum Average Subtree
# Medium
# Given the root of a binary tree, find the maximum average value of any subtree of that tree.

# (A subtree of a tree is any node of that tree plus all its descendants. The average value of a tree is the sum of its values, divided by the number of nodes.)

# Example 1:
# Input: [5,6,1]
# Output: 6.00000
# Explanation: 
# For the node with value = 5 we have an average of (5 + 6 + 1) / 3 = 4.
# For the node with value = 6 we have an average of 6 / 1 = 6.
# For the node with value = 1 we have an average of 1 / 1 = 1.
# So the answer is 6 which is the maximum.
 
# Note:
# The number of nodes in the tree is between 1 and 5000.
# Each node will have a value between 0 and 100000.
# Answers will be accepted as correct if they are within 10^-5 of the correct answer.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Float}
def maximum_average_subtree(root)
  return 0 if root.nil?

  sum(root, 0)[2]
end

# @param {TreeNode} node
# @return {[Integer, Float, Float]} [sum of all the nodes, count of the nodes, max average so far]
def sum(node, max_avg)
  return [0, 0, max_avg] if node.nil?

  left, left_nodes, left_avg = sum(node.left, max_avg)
  right, right_nodes, right_avg = sum(node.right, max_avg)

  sum_nodes = left + right + node.val
  num_nodes = left_nodes + right_nodes + 1.0
  max_avg = [sum_nodes / num_nodes, left_avg, right_avg].max

  [sum_nodes, num_nodes, max_avg]
end

# EXPXLANATION
# https://leetcode.com/problems/maximum-average-subtree/discuss/357415/Ruby-Recursion

# The maximum average is either the avg of current tree, the max avg of the left child tree or the max avg of the right child tree.
# In order to get the avg of current tree, we need to return the total sum of both left and right child tree, and the number of nodes in both left and right child tree.
# And also return the max avg so far, since I do not want to maintain a global value...

# Time Complexity: O(N)
# Space Complexity: O(h)