
require 'test/unit'
require 'byebug'


def popularNFeatures(numFeatures, topFeatures, possibleFeatures, 
  numFeatureRequests, featureRequests)
  # WRITE YOUR CODE HERE
  counts = Hash.new 0

  # p possibleFeatures
  # p featureRequests
  # p '----'
  featureRequests.each do |fr|
    fr.downcase.split(/[\s,]+/).uniq.each do |keyword|
      # p keyword
      if possibleFeatures.include?(keyword)
        counts[keyword] += 1 
        #break
      end
    end
    # p counts
    # p '*'
  end
  # p '----'
  # p counts.sort_by {|k, v| [-v, k]}
  # p counts.sort_by {|k, v| [-v, k]}.first(topFeatures)
  # p counts.sort_by {|k, v| [-v, k]}.first(topFeatures).map{|a| a[0]}
  # p '----'

  # Sort by value descending and grab first((n)topFeatures) and get just the 'keys'
  return counts.sort_by {|k, v| [-v, k]}.first(topFeatures).map{|a| a[0]}
end

class Test3SumClosest < Test::Unit::TestCase
  def test_simple
    assert_equal(['anacell', 'betacellular'], popularNFeatures(5,2,
                    ['anacell', 'betacellular', 'cetracular', 'deltacellular','eurocell'],
                    3,
                    ['Best service provided by anacell', 'betacellular has great services', 'anacell provides much better services than all other']))

    assert_equal(['waterproof', 'battery'], popularNFeatures(6,2,['storage', 'battery', 'hover', 'alexa', 'waterproof', 'solar'],
                                         7,['more storage!', 'battery life', 'waterproof Kindle', 'Waterproof and increased battery', 'Waterproof please waterproof', 'hover on my desk', 'solar power'] ))

    assert_equal(['mymarket', 'newshop'], popularNFeatures(2,2,['mymarket', 'newshop'],
                                          4,['one Mymarket', 'Two mymarket', 'One NEwshop', '2 newSHOP'] ))
                                    
    assert_equal(['betacellular', 'deltacellular'], popularNFeatures(5,2,
                 ['anacell', 'betacellular', 'cetracular', 'deltacellular','eurocell'],
                  5,
                  ['I love anacell, Best service provided by anacell', 'betacellular has great services', 'deltacellular provides much better service than betacellular', 
                  'cetracular is worse than eurocell', 'betacellular is better than deltacellular']))
  end 
end