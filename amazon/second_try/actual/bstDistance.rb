require 'test/unit'
require 'byebug'
require 'set'

# Description


# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil, parent = nil)
    @val = val
    @left = left
    @right = right
  end
end

def bstDistance(num, values, node1, node2)
  # WRITE YOUR CODE HERE

  # Construct BST
  bst = nil
  values.each do |val| 
    bst = insert_into_bst(bst, val)
  end
  @distance = 0
  search_bst_distance(bst, node1)
  rt_to_nide_1 = @distance

  search_bst_distance(bst, node2)
  rt_to_nide_2 = @distance
  rt_to_nide_2 - rt_to_nide_1
end

def insert_into_bst(root, val)
  return TreeNode.new(val) if root.nil?
   
  if val < root.val
    root.left = insert_into_bst(root.left, val)
  else
    root.right = insert_into_bst(root.right, val)
  end
  root
end

def search_bst_distance(root, val)
  return nil if root.nil?
  @distance += 1
  return root if root.val == val
  if val > root.val
      return search_bst_distance(root.right, val)
  end
  search_bst_distance(root.left,val)
end

class TestClass < Test::Unit::TestCase
  def test_simple
    assert_equal(3, bstDistance(6, [5,6,3,1,2,4], 2, 4))
  end 
end


