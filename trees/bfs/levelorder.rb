# https://leetcode.com/articles/binary-tree-level-order-traversal/
# https://leetcode.com/problems/binary-tree-level-order-traversal/
# Medium


def level_order(root)
  return [] if root.nil?
  queue = [[root, 0]]
  res = []
  until queue.empty?
    # p res
    # p queue
    node, level = queue.pop
    res[level] ||= []
    res[level] << node.val
    queue << [node.right, level + 1] if node.right
    queue << [node.left, level + 1] if node.left
  end
  res
end