require 'test/unit'
require 'byebug'

# https://topher6345.github.io/priority-queue-in-ruby/

class MinPriorityQueue
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(item:, priority:)
    fail StandardError unless priority.is_a?(Integer) || priority.is_a?(Float)
    @stack.push(item: item, priority: priority)
  end

  def pop
    @stack.sort! {|x, y| y[:priority] <=> x[:priority]}
    @stack.pop
  end

  def peek
    # Find min
    # TODO
  end
end

class MaxPriorityQueue
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(item:, priority:)
    fail StandardError unless priority.is_a?(Integer) || priority.is_a?(Float)
    @stack.push(item: item, priority: priority)
  end

  def pop
    # Max PriorityQueue
    # In a max priority queue, elements are inserted in the order in
    # which they arrive the queue and the maximum value is always
    # removed first from the queue
    @stack.sort! {|x, y| x[:priority] <=> y[:priority] }
    @stack.pop
  end

  def peek
    # Find max
    # TODO
  end
end

class TestClass < Test::Unit::TestCase
  def test_simple
    pq = MaxPriorityQueue.new
    pq.push(item: {3 => 'three'}, priority: 3)
    pq.push(item: {1 => 'one'}, priority: 1)
    pq.push(item: {2 => 'two'}, priority: 2)
    pq.push(item: {4 => 'four'}, priority: 6)
    pq.push(item: {5 => 'five'}, priority: 5)
    assert_equal({item: {4 => 'four'}, priority: 6}, pq.pop)
    assert_equal({item: {5 => 'five'}, priority: 5}, pq.pop)
    pq = MinPriorityQueue.new
    pq.push(item: {3 => 'three'}, priority: 3)
    pq.push(item: {1 => 'one'}, priority: 1)
    pq.push(item: {2 => 'two'}, priority: 2)
    pq.push(item: {4 => 'four'}, priority: 6)
    pq.push(item: {5 => 'five'}, priority: 5)
    assert_equal({item: {1 => 'one'}, priority: 1}, pq.pop)
    assert_equal({item: {2 => 'two'}, priority: 2}, pq.pop)
    # p pq
    # p pq.pop[:item]
    # elem = pq.pop
    # p elem
    # p elem[:item]
    # p elem[:priority]
  end 
end

