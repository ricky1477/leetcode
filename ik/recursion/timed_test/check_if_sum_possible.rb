# Complete the check_if_sum_possible function below.
# Complete the check_if_sum_possible function below.
def check_if_sum_possible(arr, k)
  #   p arr
  #   p '----'
    result = []
    helper(arr, k, 0, [], 0, result)
  #   p 'done'
  #   p result
    return result.length > 0 ? true : false
  end
  
  def helper(nums, k, idx, slate, sum_so_far, result)
  #   p 'slate'
  #   p slate
  #   p 'result'
  #   p result
    
    return if (sum_so_far > k)
        
    if sum_so_far == k
        result.append(slate.dup)
        # result = true
        # p 'found match'
        # p slate
        return
    end
    
    return if idx == nums.length
    
    # Include case
    slate.append(nums[idx])
    # p slate
    helper(nums, k, idx+1, slate, sum_so_far+nums[idx], result)
    slate.delete_at(slate.length-1)
    # Exclude case
    helper(nums, k, idx+1, slate, sum_so_far, result)
  end
  
  1
  1
  0
  
  1 should be 0
  
  -----
  2
  10
  20
  0
  
  1 should be 0
  -----
  
  2
  -5
  -10
  -15
  
  0 should be 1
  -----
  4
  -3
  -3
  -3
  -3
  -12
  
  0 should be 1
  
  ------
  3
  -2
  -3
  1
  -4
  
  0 should be 1
  
  
  
  ------
  7
  -10000000000
  -10000000000
  -80000000000
  -30000000000
  -180000000000
  110000000000
  60000000000
  -90000000000
  
  
  0 should be 1
  
  
  