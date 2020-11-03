# Welcome to Facebook!

# This is just a simple shared plaintext pad, with no execution capabilities.

# When you know what language you would like to use for your interview,
# simply choose it from the dropdown in the top bar.

# Enjoy your interview!


# Mon Aug 3, 2020 5pm - 6pm (EDT) 


# Heap - MaxPriorityQueue

N, k

    nums            k      result
1. [5, 3, 2, 1, 4]  0        5
2. [5, 3, 2, 1, 4]  1        4
3. [5, 3, 2, 1, 4]  2        3

k = 1
# max = (2**-31)
max_heap = []
k_max = []
nums.each_with_index do |num, idx|
  if k_max.length < k
    k_max << num
  elsif greather_than(k_max, num)
    k_max[greather_than(k_max, num)], k_max[idx] = k_max[idx], max[greather_than(k_max, num)]
  end

  
end




def greather_than(arr, val)
  arr.sort.reverse.each_with_index do |elem, idx|
    return idx if val > elem
  end
  -1
end

# heap

# nums.each_with_index do |num|
#   max_heap.insert(num)
# end



# N

Example k = 10. Tree has such 2 nodes 4 and 6. Note 8 and 2 is not a solution.
                                                        (12)                         
                               +-------------------------+---------+                 
                              (2)                                 (8)               
                           +----+---------+                   +----+----+            
                         (3)             (7)                 (4)        (6)          
                     +----+         +----+---------+                                
                   (0)             (7)            (6)
You can assume binary tree is given by

class Node {
  int value;
  Node* left;
  Node* right;
};

complements = Hash.new {-2 => 12, 8 => 2}
BFS

  
complement = k - 0 = 
#[[12], [2,8], [3,0,4,9, 6], [0,3]]
  
levels = [3,0,4,6]
  
# m = height of tree
  

  
  hash = {12:1, 2:2}
  
  elem = {12:1}
  if hash.key?(complement(elem)) && elem.val != complement(val)
     return elem & complement
    
    
  


