def levenshteinDistance(strWord1, strWord2)
  m = strWord1.length
  n = strWord2.length
  return m if n.zero?
  return n if m.zero?
  
  edit_distance = Array.new(m+1) {Array.new(n+1)}
  (0..m).each {|i| edit_distance[i][0] = i}
  (0..n).each {|j| edit_distance[0][j] = j}
  
  # Print edit_distance nicely
  # p puts edit_distance.map { |x| x.join(' ') }
  
  (1..m).each do |i|
      (1..n).each do |j|
        edit_distance[i][j] = if strWord1[i-1] == strWord2[j-1]
                                edit_distance[i-1][j-1]       # copy value - no operation required
                              else
                                [ 
                                  edit_distance[i][j-1]+1,    # addition
                                  edit_distance[i-1][j]+1,    # deletion
                                  edit_distance[i-1][j-1]+1,  # substitution
                                ].min
                              end
      end
  end
  # p '----'
  # p puts edit_distance.map { |x| x.join(' ') }

  edit_distance[m][n]
end