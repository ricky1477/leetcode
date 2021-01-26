require 'test/unit'
require 'byebug'
require 'set'

# https://uplevel.interviewkickstart.com/resource/rc-codingproblem-5681-40770-54-333

# Complete the string_transformation function below.
def string_transformation(words, start, stop)
  # return 
  adj_list = Hash.new
  result = [start]
  # p words
  # p '----'
  # p start
  # p stop
  # p '****'
  dict = (words + [stop]).uniq
  # p dict


  # p dict
  adj_list[start], dict = one_offs(start, dict)
  words.each do |word|
    # p "word:#{word}"
    adj_list[word], dict = one_offs(word, dict)
  end
  # p adj_list
  return ['-1'] if adj_list.length < 2
  if start == stop
    mid = adj_list[start].first
    # p mid
    return [start, mid, stop]
  end

  visited = Hash.new
  captured = Hash.new
  parent = Hash.new

  adj_list.keys.map{|wrd| visited[wrd] = 0}
  adj_list.keys.map{|wrd| captured[wrd] = 0}
  adj_list.keys.map{|wrd| parent[wrd] = nil}


  bfs(adj_list, start, visited, captured, parent, stop)

  return back_tracking(stop, parent)
end

def back_tracking(stop, parent)
  res = []

  res.unshift(stop)
  val = parent[stop]
  p val

  while(val)
    res.unshift(val)
    val = parent[val]
  end
end

def bfs(adj_list, source, visited, captured, parent, stop)
  captured[source] = 1
  visited[source] = 1
  # p visited

  q = Array.new()
  q.push(source)

  while(!q.empty?) # capture next vertex
    vertex = q.pop
    captured[vertex] = 1
    # p vertex
    # p adj_list[vertex]
    begin
      for w in adj_list[vertex]
        visited[w] = 1
        parent[w] = vertex
        p visited
        p parent
        # break if vertex == stop # Not necessary taken care of uptop
        q.push(w)
      end
    rescue NoMethodError => e
      # Do nothing if no item in adj_list; hit the end of the DFS traversal
    end
  end
  # result.to_a
end


def one_offs(word, dict)
  # p word
  # p dict
  # p 'one---'
  list = []
  dict.each do |wrd|
    num_diffs = 0
    wrd.each_char.with_index do |ch, idx|
      # p "#{word[idx]}:#{wrd[idx]}"
      num_diffs += 1 if word[idx] != wrd[idx]
    end
    # p num_diffs
    if num_diffs == 1
      # p "#{wrd}:wrd" 
      list << wrd
      # dict.delete(wrd)
    end
  end
  # p list
  # p dict
  # p '--*--'
  list.each { |wrd| dict.delete(wrd) }
  return list, dict
end

class TestClass < Test::Unit::TestCase
  def test_simple
    # assert_equal(['bat', 'hat', 'had'], string_transformation(['cat', 'hat', 'bad', 'had'], 'bat', 'had'))
    # assert_equal(['baa', 'aaa', 'aab'], string_transformation(['aaa'], 'baa', 'aab'))
    # assert_equal(['-1'], string_transformation([], 'zzzzzz', 'zzzzzz'))
    assert_equal(["cccc", "cccw", "cccc"], string_transformation(["cccw", "accc", "accw"], 'cccc', 'cccc'))


    

  end
end








def string_transformation(words, start, stop)
  alphabet = ((words + [start, stop]).map { |w| w.bytes }).flatten.uniq
  wh = ((words + [start, stop]).uniq.map { |w| [ w, false ] }).to_h
  bt = {}
  q = [ start ]
  wh[start] = true
  level = 0

  mode_a = Proc.new { |cw|
    cw.bytes.each_with_index do |cc, i|
      alphabet.each do |nc|
        next if cc == nc
        new_w = cw.clone
        new_w.setbyte(i, nc)
        return backtrack(wh, cw, new_w) if new_w == stop
        next if wh[new_w].nil? or wh[new_w] != false
        q.push(new_w)
        wh[new_w] = cw
      end
    end
  }
  
  mode_b = Proc.new { |cw|
    find_a_diff(wh, cw).each do |(new_w, visited)|
      return backtrack(wh, cw, new_w) if new_w == stop
      next if visited != false
      q.push(new_w)
      wh[new_w] = cw
    end
  }

  mode = wh.count > start.length * alphabet.count ? mode_a : mode_b

  while !q.empty? do
    count = q.count
    while count > 0 do
      cw = q.shift
      mode.call(cw)
      count -= 1
    end
    level += 1
  end
  [ "-1" ]
end

def backtrack(wh, cw, stop)
  real_ans = [cw, stop]
  while wh[cw] != true do
    cw = wh[cw]
    real_ans.unshift(cw)
  end
  real_ans
end

def find_a_diff(wh, cw)
  cw_b = cw.bytes.each_with_index.map { |b, i| i.to_s + '_' + b.to_s }
  wh.reject do |w|
    w_b = w.bytes.each_with_index.map { |b, i| i.to_s + '_' + b.to_s }
    (w_b - cw_b).count != 1
  end
end