# class TreeNode
#    attr_accessor :val
#    attr_accessor :left_ptr
#    attr_accessor :right_ptr
# end

# Complete the function below

def isBST(root)
  stack = []
  prev_val = -Float::INFINITY

  while(!stack.empty? || root)
    while(root)
      stack.push(root)
      root = root.left_ptr
    end
    root = stack.pop
    return false if root.val <= prev_val
    prev_val = root.val
    root = root.right_ptr
  end
  return true
end


# def isBST(root)
#   return helper(root, -Float::INFINITY, Float::INFINITY)
# end

# def helper(root, lower_bound, upper_bound)
#   # Base case - leaf node
#   return true unless root
  
#   # Recursive case
#   # Keep lower and upper bounds for each node
#   # Left subtree will have node.val as upper bound
#   # Right subtree will have node.val as lower bound
#   if (root.val <= lower_bound || root.val >= upper_bound)
#      return false
#   else
#      helper(root.left_ptr, lower_bound, root.val) && helper(root.right_ptr, root.val, upper_bound)
#   end
  
# end