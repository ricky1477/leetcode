#import operator

require 'test/unit'
require 'byebug'

userSongs = {  
   "David": ["song1", "song2", "song3", "song4", "song8"],
   "Emma":  ["song5", "song6", "song7"]
}
songGenres = {  
   "Rock":    ["song1", "song3"],
   "Dubstep": ["song7"],
   "Techno":  ["song2", "song4"],
   "Pop":     ["song5", "song6"],
   "Jazz":    ["song8", "song9"]
}

#  Output: {  
#    "David": ["Rock", "Techno"],
#    "Emma":  ["Pop"]
# }


def fav(userSongs, songGenres)
  output = {}
  userSongs.each do |user|
    output[user[0]] = []
    user[1].each do |song|
      output[user[0]].push(songGenres.select{ |key, val| val.include?(song) }.keys)
    end
  end
  final = {}
  output.each do |user, songs|
    final[user] = songs.group_by{|song| songs.count(song)}.first[1].uniq.flatten
  end
  return final
end


p fav(userSongs, songGenres)

# def fav(userSongs, songGenres):
#   users = {}
#   revmap = {}
#   for song in songGenres:
#     for i in songGenres[song]:
#       revmap[i] = song
#   for k in userSongs:
#     fav = {}
#     for s in userSongs[k]:
#       if revmap[s] in fav:
#         fav[revmap[s]]+=1
#       else:
#         fav[revmap[s]]=1
#     m = max(fav.items(), key=operator.itemgetter(1))
#     l = []
#     for j in fav:
#       if(fav[j]==m[1] and m[1]>1):
#         l+=[j]
#     users[k] = l
#   print(users)



# fav(userSongs, songGenres)