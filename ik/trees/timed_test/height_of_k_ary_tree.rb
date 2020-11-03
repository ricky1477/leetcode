# Complete the find_height function below.
def find_height(root)
  return [] if root.nil?
  queue = [[root, 0]]
  res = []
  
  until queue.empty?
    p res
    p queue
    node, level = queue.pop
    p level
    
    res[level] ||= []
    res[level] << node
    node.children.each {|c| queue << c}
    # queue << [node.right, level + 1] if node.right
    # queue << [node.left, level + 1] if node.left
  end
  p res
end