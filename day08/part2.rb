puts File.readlines('./input').map{|s| s.count('"\\') + 2}.sum
