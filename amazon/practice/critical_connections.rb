require "test/unit"

# https://leetcode.com/problems/critical-connections-in-a-network/

# 1192. Critical Connections in a Network
# Hard
# There are n servers numbered from 0 to n-1 connected by undirected server-to-server connections forming a network where connections[i] = [a, b] represents a connection between servers a and b. Any server can reach any other server directly or indirectly through the network.

# A critical connection is a connection that, if removed, will make some server unable to reach some other server.

# Return all critical connections in the network in any order.

# Example 1:
# Input: n = 4, connections = [[0,1],[1,2],[2,0],[1,3]]
# Output: [[1,3]]
# Explanation: [[3,1]] is also accepted.
 

# Constraints:
# 1 <= n <= 10^5
# n-1 <= connections.length <= 10^5
# connections[i][0] != connections[i][1]
# There are no repeated connections.

def critical_connections(n, connections)
  $g = []
  (0...n).each {|i| $g[i] = []}
  connections.each do |connection|
    u = connection[0]
    v = connection[1]
    $g[u].push(v)
    $g[v].push(u)
  end
  $time = 0
  $res = []
  $low = []
  $dfn = []
  (0...n).each {|i| $dfn[i] = Float::INFINITY}
  dfs(0, -1)
  $res
end

def dfs(u, pre)
  $time += 1
  $dfn[u] = $time
  $low[u] = $time
  $g[u].each do |v|
    next if v == pre
    if $dfn[v] == Float::INFINITY
      dfs(v, u)
      $low[u] = [$low[u], $low[v]].min
      $res.push([u,v]) if $low[v] > $dfn[u]
    else
      $low[u] = [$low[u], $dfn[v]].min
    end
  end
end