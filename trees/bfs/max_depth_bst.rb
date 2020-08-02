

# https://leetcode.com/explore/learn/card/data-structure-tree/17/solve-problems-recursively/535/
# Maximum Depth of Binary Tree

# Solution
# Given a binary tree, find its maximum depth.
  
# The maximum depth is the number of nodes along the 
# longest path from the root node down to the farthest leaf node.
  
# Note: A leaf is a node with no children.
  
# Example:
  
# Given binary tree [3,9,20,null,null,15,7],
  
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its depth = 3.


# Level Order Traversal with getting length of values array
def max_depth(root)
    
  return 0 if root.nil?
  queue = [[root, 0]]
  res = []
  until queue.empty?
    node, level = queue.pop
    res[level] ||= []
    res[level] << node.val
    queue << [node.right, level + 1] if node.right
    queue << [node.left, level + 1] if node.left
  end
  res.length
end