def naughty?(s)
  return true if s !~ /(.).\1/
  s !~ /(..).*?\1/
end

puts naughty?('xyxy')
puts naughty?('qjhvhtzxzqqjkmpb')
puts naughty?('xxyxx')
puts naughty?('uurcxstgmygtbstg')
puts naughty?('ieodomkazucvgmuy')

puts File.readlines('./input').reduce(0) { |acc, cur| naughty?(cur) ? acc : acc + 1 }
