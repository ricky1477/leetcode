require "test/unit"

# https://leetcode.com/problems/greatest-common-divisor-of-strings/

# 1071. Greatest Common Divisor of Strings
# Easy
# For strings S and T, we say "T divides S" if and only if S = T + ... + T  (T concatenated with itself 1 or more times)

# Return the largest string X such that X divides str1 and X divides str2.

# Example 1:
# Input: str1 = "ABCABC", str2 = "ABC"
# Output: "ABC"

# Example 2:
# Input: str1 = "ABABAB", str2 = "ABAB"
# Output: "AB"

# Example 3:
# Input: str1 = "LEET", str2 = "CODE"
# Output: ""
 
# Note:
# 1 <= str1.length <= 1000
# 1 <= str2.length <= 1000
# str1[i] and str2[i] are English uppercase letters.


# JAVA
# public String gcdOfStrings(String str1, String str2) {
#   return GCD(str1, str2);        
# }
# public String GCD(String a, String b) {
#   # if(a.length() == 0)
#   #     return b;
#   # if(b.length() == 0)
#   #     return a;
#   # if(a.equals(b))
#   #     return a;
#   if(a.length() > b.length()) {
#       for(int i = 0; i < b.length(); i++){
#           if(b.charAt(i) != a.charAt(i)){
#               return "";
#           }
#       }
#       String temp = a.substring(b.length());
#       return GCD(temp,b);
#   }
#   else if(b.length() > a.length())
#       return GCD(b, a);
#   else
#       return "";
# }

def gcd_of_strings(str1, str2)
  return gcd(str1, str2)
end

def gcd(a, b)
  return b if(a.length == 0)
  return a if(b.length() == 0)
  return a if(a == b)

  if(a.length > b.length)
    (0..b.length-1).each do |i|
      #p i
      return "" if (b[i] != a[i])
    end
    temp = a[b.length..a.length-1]
    # p a
    # p "temp:#{temp}"
    return gcd(temp, b)
  elsif (b.length > a.length)
    return gcd(b, a)
  else
    return ''
  end
end


class TestGCDofStrings < Test::Unit::TestCase
  def test_simple
    assert_equal('ABC', gcd_of_strings("ABCABC", "ABC"))
    assert_equal('AB', gcd_of_strings("ABABAB", "ABAB"))
    assert_equal('', gcd_of_strings("LEET", "CODE"))
  end 
end