# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def preorder_traversal(root, values = [])
  return [] if root.nil?
  values << root.val
  preorder_traversal(root.left, values) if root.left
  preorder_traversal(root.right, values) if root.right
  values
end

# Node Left Right