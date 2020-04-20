require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/81/design/478/

# LRU Cache
# Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.

# get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
# put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

# The cache is initialized with a positive capacity.

# Follow up:
# Could you do both operations in O(1) time complexity?

# Example:

# LRUCache cache = new LRUCache( 2 /* capacity */ );

# cache.put(1, 1);
# cache.put(2, 2);
# cache.get(1);       // returns 1
# cache.put(3, 3);    // evicts key 2
# cache.get(2);       // returns -1 (not found)
# cache.put(4, 4);    // evicts key 1
# cache.get(1);       // returns -1 (not found)
# cache.get(3);       // returns 3
# cache.get(4);       // returns 4

# class LRUCache
#   #:type capacity: Integer
#   def initialize(capacity)
#     @state = {}
#     @capacity = capacity
#     @index = 0
#   end

#   def state
#     @state
#   end
  
#   # :type key: Integer
#   # :rtype: Integer
#   def get(key)
#     if @state.has_key?(key)
#       # Update index
#       @state[key]['index'] = @index
#       @index+=1
#       #p @state
#       return @state[key]['value'] 
#     else
#       #p @state
#       return -1
#     end
#   end
  
#   # :type key: Integer
#   # :type value: Integer
#   # :rtype: Void
#   def put(key, value)
#     if @state.has_key?(key)
#       @state[key] = {'value' => value, 'index' => @index}
#       @index+=1
#       return
#     end
  
#     unless @state.length < @capacity
#       to_del = state.sort_by{ |k, v| v['index'] }.first.first
#       # Deletes LRU cache
#       @state.delete(to_del)
#     end
#     @state[key] = {'value' => value, 'index' => @index}
#     @index+=1
#     #p @state
#   end
# end

class LRUCache
  # Getters and setters
  attr_accessor :capacity, :cache
  
  def initialize(capacity)
    @capacity = capacity
    @cache = Hash.new
  end

  def get(key)
    val = cache.delete(key)
    cache[key] = val if val
    val || -1
  end

  def put(key, value)
    old_val = cache.delete(key)
    cache[key] = value
    cache.shift if !old_val  && cache.length > capacity
  end
end


class TestLRUCache < Test::Unit::TestCase
  def test_simple
    obj = LRUCache.new(2)
    obj.put(1,1)
    obj.put(2,2)
    assert_equal(1, obj.get(1))
    obj.put(3,3)
    assert_equal(-1, obj.get(2))
    obj.put(4,4)
    assert_equal(-1, obj.get(1))
    assert_equal(3, obj.get(3))
    assert_equal(4, obj.get(4))
  end
  def test_two
    obj = LRUCache.new(2)
    assert_equal(-1, obj.get(2))
    obj.put(2,6)
    assert_equal(-1, obj.get(1))
    obj.put(1,5)
    obj.put(1,2)
    assert_equal(2, obj.get(1))
    assert_equal(6, obj.get(2))
  end
end