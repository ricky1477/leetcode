# Complete the build_balanced_bst function below.
def build_balanced_bst(a)
  return helper(a, 0, a.length-1)
end

def helper(a, left, right)
  return nil if left > right
  
  mid = (left+right)/2

  # Pre-order traversal N-L-R
  root = TreeNode.new(a[mid])
  root.left_ptr = helper(a, left, mid-1)
  root.right_ptr = helper(a, mid+1, right)
  return root
end