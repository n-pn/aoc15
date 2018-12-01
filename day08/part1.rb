re = /\\(\\|\"|x[0-9a-f][0-9a-f])/
puts File.readlines('./input').map{|s| s.size - s.gsub(re, '.').size + 2}.sum
