def count(s)
  s.count('(') - s.count(')')
end

puts count('(())')
puts count('(()(()(')
puts count(File.read('./input'))

