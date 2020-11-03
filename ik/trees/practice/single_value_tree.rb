# class TreeNode
#    attr_accessor :val
#    attr_accessor :left_ptr
#    attr_accessor :right_ptr
# end

# Complete the function below
def findSingleValueTrees(root)
  @uval_count = 0 
  return @uval_count unless root
  dfs(root)
  return @uval_count
end

def dfs(root)
  am_i_unival = true
  is_left_unival = true
  is_right_unival = true
  

  # Base case: Leaf Node
  if (root.left_ptr.nil? && root.right_ptr.nil?)
      @uval_count += 1
      return true
  end
  
  # Recursive case
  if (root.left_ptr)
      is_left_unival = dfs(root.left_ptr)
      am_i_unival = am_i_unival && (root.val == root.left_ptr.val)
  end
  
  if (root.right_ptr)
      is_right_unival = dfs(root.right_ptr)
      am_i_unival = am_i_unival && (root.val == root.right_ptr.val)
  end
  
  am_i_unival = (is_left_unival && is_right_unival && am_i_unival)
  @uval_count += 1 if am_i_unival
  
  
  return am_i_unival
end