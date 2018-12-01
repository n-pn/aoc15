def caculate(l, w, h)
  a = [l + w, l + h, w + h]
  l * w * h + a.min * 2
end

puts caculate(2, 3, 4)
puts caculate(1, 1, 10)

total = 0

File.readlines('./input').each do |line|
  l, w, h = line.split('x').map(&:to_i)
  total += caculate(l, w, h)
end

puts total
