def kth_smallest_element(root, k)
  in_order = []
  helper(root, in_order)
  in_order[k-1]
end

def helper(root, in_order)
  return unless root
  helper(root.left_ptr, in_order)
  in_order << root.val
  helper(root.right_ptr, in_order)
end