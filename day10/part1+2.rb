def read(s)
  r = []
  i = 0
  while i < s.size
    j = 1
    c = s[i]
    j += 1 while s[i + j] == c
    r << j << c
    i += j
  end
  r
end

i = '1113222113'.chars.map(&:to_i)
40.times {i = read(i)}
puts i.size

10.times {i = read(i)}
puts i.size
