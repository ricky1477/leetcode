# Complete the numPhoneNumbers function below.
def numPhoneNumbers(start_digit, phone_length)
  return phone_length if phone_length <= 1
  # DP table
  table = Array.new(phone_length) { Array.new(10) { 0 } }
  # p puts table.map { |x| x.join(' ') }
  moves = {
      0 => [4, 6],
      1 => [6, 8],
      2 => [7, 9],
      3 => [4, 8],
      4 => [3, 9, 0],
      5 => [],
      6 => [1, 7, 0],
      7 => [2, 6],
      8 => [1, 3],
      9 => [2, 4]
  }
  
  # Base-case (Length = 1)
  for i in 0..9 do
      table[0][i] = 1
  end

  # Recursive case (Length > 1)
  for i in 2..phone_length do
      for j in 0..9 do
          m = moves[j]
          for k in m do
              table[i-1][j] += table[i-2][k]
          end
      end
  end
  
  # p puts table.map { |x| x.join(' ') }
  table[phone_length-1][start_digit]
end