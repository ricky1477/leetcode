
# https://leetcode.com/problems/longest-substring-with-at-least-k-repeating-characters/

# 395. Longest Substring with At Least K Repeating Characters
# Medium

# Find the length of the longest substring T of a given string (consists of lowercase letters only) such that every character in T appears no less than k times.

# Example 1:

# Input:
# s = "aaabb", k = 3

# Output:
# 3

# The longest substring is "aaa", as 'a' is repeated 3 times.
# Example 2:

# Input:
# s = "ababbc", k = 2

# Output:
# 5

# The longest substring is "ababb", as 'a' is repeated 2 times and 'b' is repeated 3 times.

def longest_substring(s, k)
  longest, more_than_k = 0, 0
  counts = Array.new(26, 0)
  s.each_char do |c|
      idx = c.ord - 'a'.ord
      counts[idx] += 1
      more_than_k += 1 if counts[idx] == k
  end

  1.upto(more_than_k) do |u|
      counts = Array.new(26, 0)
      l, r, uniq, k_or_more = 0,0,0,0
      while r < s.size
          if uniq <= u
              idx = s[r].ord - 'a'.ord
              uniq += 1 if counts[idx] == 0
              counts[idx] += 1
              k_or_more += 1 if counts[idx] == k
              r += 1
          else
              idx = s[l].ord - 'a'.ord
              counts[idx] -= 1
              uniq -= 1 if counts[idx] == 0
              k_or_more -= 1 if counts[idx] == k - 1
              l += 1
          end
          longest = [longest, r - l].max if uniq == u && uniq == k_or_more
      end
  end

  longest
end