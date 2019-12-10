# Minimum Window Substring
# Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

# Example:

# Input: S = "ADOBECODEBANC", T = "ABC"
# Output: "BANC"
# Note:

# If there is no such window in S that covers all characters in T, return the empty string "".
# If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
#    Hide Hint #1  
# Use two pointers to create a window of letters in S, which would have all the characters from T.
#    Hide Hint #2  
# Since you have to find the minimum window in S which has all the characters from T, you need to expand and contract the window 
# using the two pointers and keep checking the window for all the characters. This approach is also called Sliding Window Approach.

# L ------------------------ R , Suppose this is the window that contains all characters of T 
                          
#         L----------------- R , this is the contracted window. We found a smaller window that still contains all the characters in T

# When the window is no longer valid, start expanding again using the right pointer. 

def min_window(s, t)
    current_set = {}
    t.each_char do |c|
        current_set[c] ||= 0
        current_set[c] -= 1
    end
    valid_count = current_set.keys.length * -1
    left = 0
    min_window = ""
    s.each_char.with_index do |c, right_index|
        if current_set[c]
            current_set[c] += 1
            valid_count += 1 if current_set[c] == 0
        end
        if valid_count >= 0
            while valid_count >= 0
                if current_set[s[left]]
                    current_set[s[left]] -= 1
                    valid_count -= 1 if current_set[s[left]] == -1
                end
                left += 1
            end
            if min_window.length == 0 || min_window.length >= right_index - left + 2
                min_window = s[left-1..right_index]
            end
        end
    end
    min_window
end