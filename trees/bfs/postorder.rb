# https://leetcode.com/problems/n-ary-tree-postorder-traversal/submissions/

# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[int]}
def postorder(root)
  @answer = []
  dfs(root)
  @answer
end

def dfs(x)
  return if x.nil?
  x.children.each do |y|
    dfs(y)
  end
  @answer.push(x.val)
end