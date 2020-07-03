# https://leetcode.com/problems/cut-off-trees-for-golf-event/

# 675. Cut Off Trees for Golf Event
# Hard
# You are asked to cut off trees in a forest for a golf event. The forest is represented as a non-negative 2D map, in this map:

# 0 represents the obstacle can't be reached.
# 1 represents the ground can be walked through.
# The place with number bigger than 1 represents a tree can be walked through, and this positive number represents the tree's height.
 

# You are asked to cut off all the trees in this forest in the order of tree's height - always cut off the tree with lowest height first. And after cutting, the original place has the tree will become a grass (value 1).

# You will start from the point (0, 0) and you should output the minimum steps you need to walk to cut off all the trees. If you can't cut off all the trees, output -1 in that situation.

# You are guaranteed that no two trees have the same height and there is at least one tree needs to be cut off.

# Example 1:

# Input: 
# [
#  [1,2,3],
#  [0,0,4],
#  [7,6,5]
# ]
# Output: 6
 

# Example 2:

# Input: 
# [
#  [1,2,3],
#  [0,0,0],
#  [7,6,5]
# ]
# Output: -1
 

# Example 3:

# Input: 
# [
#  [2,3,4],
#  [0,0,5],
#  [8,7,6]
# ]
# Output: 6
# Explanation: You started from the point (0,0) and you can cut off the tree in (0,0) directly without walking.


DIRS = [
  [1, 0],
  [-1, 0],
  [0, 1],
  [0, -1],
]

Tree = Struct.new(:i, :j, :height)

class MinHeap
  def initialize(&blk)
    @blk = blk
    @items = []
  end

  def peek
    items.first
  end

  def pop
    return items.pop if items.size == 1
    item = items.first
    items[0] = items.pop
    heapify_down
    item
  end

  def push(item)
    items.push(item)
    heapify_up
  end

  def size
    @items.size
  end

  private

  attr_reader :items, :blk

  def heapify_up
    index = items.size - 1
    while has_parent(index) && gt?(parent(index), items[index])
      swap(get_parent_index(index), index)
      index = get_parent_index(index)
    end
  end

  def heapify_down
    index = 0
    while has_left_child(index)
      smaller_child_index = get_left_child_index(index)
      if has_right_child(index) && lt?(right_child(index), left_child(index))
        smaller_child_index = get_right_child_index(index)
      end
      if lt?(items[index], items[smaller_child_index])
        break
      else
        swap(index, smaller_child_index)
      end
      index = smaller_child_index
    end
  end

  def lt?(a, b)
    blk[a] < blk[b]
  end

  def lteq?(a, b)
    blk[a] <= blk[b]
  end
  
  def gteq?(a, b)
    blk[a] >= blk[b]
  end

  def gt?(a, b)
    blk[a] > blk[b]
  end

  def get_left_child_index(i)
    2 * i + 1
  end

  def get_right_child_index(i)
    2 * i + 2
  end

  def get_parent_index(i)
    (i - 1) / 2
  end

  def has_left_child(i)
    get_left_child_index(i) < items.size
  end

  def has_right_child(i)
    get_right_child_index(i) < items.size
  end

  def has_parent(i)
    get_parent_index(i) >= 0
  end

  def left_child(i)
    items[get_left_child_index(i)]
  end

  def right_child(i)
    items[get_right_child_index(i)]    
  end

  def parent(i)
    items[get_parent_index(i)]
  end

  def swap(index_one, index_two)
    items[index_one], items[index_two] = items[index_two], items[index_one]
  end
end

def cut_off_tree(forest)
  heap = MinHeap.new { |tree| tree.height }
  for i in 0...forest.size
    for j in 0...forest.first.size
      if forest[i][j] > 1
        heap.push(Tree.new(i, j, forest[i][j]))
      end
    end
  end
  unless heap.peek.i == 0 && heap.peek.j == 0
    heap.push(Tree.new(0, 0, heap.peek.height - 1))
  end
  result = 0
  until heap.size == 1
    tree = heap.pop
    target_height = heap.peek.height
    distance = bfs(forest, tree, target_height)
    return -1 if distance == -1
    result += distance
  end
  result
end

def bfs(forest, tree, target_height)
  visited = Array.new(forest.size) { Array.new(forest.first.size, false) }
  for i in 0...forest.size
    for j in 0...forest.first.size
      visited[i][j] = true if forest[i][j] == 0
    end
  end
  visited[tree.i][tree.j] = true
  distance = 1
  queue = next_locations_for(tree.i, tree.j, forest, visited)
  
  until queue.empty?
    next_queue = []
    until queue.empty?
      i, j = *queue.shift
      return distance if forest[i][j] == target_height
      visited[i][j] = true
      next_queue.concat(next_locations_for(i, j, forest, visited))
    end
    queue = next_queue
    distance += 1
  end
  -1
end

def next_locations_for(i, j, forest, visited)
  result = []
  DIRS.each do |(di, dj)|
    ii = i + di
    jj = j + dj
    if in_bounds?(forest, ii, jj) && !visited[ii][jj]
      result.push([ii, jj])
    end
  end
  result
end

def in_bounds?(forest, i, j)
  i > -1 && i < forest.size && j > -1 && j < forest.first.size
end