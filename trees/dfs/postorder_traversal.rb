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
def postorder_traversal(root, values = [])
  return [] if root.nil?
  postorder_traversal(root.left, values) if root.left
  postorder_traversal(root.right, values) if root.right
  values << root.val
end

# Left Right Node