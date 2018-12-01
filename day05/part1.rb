def naughty?(s)
  return true if s.count('aieou') < 3 or s =~ /(ab|cd|pq|xy)/
  s !~ /(.)\1/
end

puts naughty?('ugknbfddgicrmopn')
puts naughty?('aaa')
puts naughty?('jchzalrnumimnmhp')
puts naughty?('haegwjzuvuyypxyu')
puts naughty?('dvszwmarrgswjxmb')

puts File.readlines('./input').reduce(0) { |acc, cur| naughty?(cur) ? acc : acc + 1 }
