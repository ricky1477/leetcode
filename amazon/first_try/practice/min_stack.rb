require "test/unit"

# https://leetcode.com/explore/interview/card/amazon/81/design/503/


# Min Stack
# Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

# push(x) -- Push element x onto stack.
# pop() -- Removes the element on top of the stack.
# top() -- Get the top element.
# getMin() -- Retrieve the minimum element in the stack.
 

# Example:

# MinStack minStack = new MinStack();
# minStack.push(-2);
# minStack.push(0);
# minStack.push(-3);
# minStack.getMin();   --> Returns -3.
# minStack.pop();
# minStack.top();      --> Returns 0.
# minStack.getMin();   --> Returns -2.
 
#    Hide Hint #1  
# Consider each node in the stack having a minimum value. (Credits to @aakarshmadhavan)

class MinStack
  # Initialize your data structure here.
  def initialize()
    @state = []   
  end

  # :type x: Integer
  # :rtype: Void
  def push(x)
    @state << x
  end

  # :rtype: Void
  def pop()
    @state.pop
  end

  # :rtype: Integer
  def top()
    @state.last
  end
 
  # :rtype: Integer
  def get_min()
    @state.min
  end
end
    
# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()