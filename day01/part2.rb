def position(s)
  p = 0
  s.size.times do |i|
    p += s[i] == '(' ? + 1 : -1
    return i + 1 if p == -1
  end
end

puts position(')')
puts position('()())')
puts position(File.read('./input'))
