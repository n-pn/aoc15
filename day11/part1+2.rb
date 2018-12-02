a = 'abcdffaa'

def invalid?(a)
  return true if a =~ /[iol]/
  return true if a !~ /(.)\1.*([^\1])\2/

  ords = a.chars.map{|x| x.ord}
  (0..5).each do |i|
    return false if ords[i] + 1 == ords[i+1] and ords[i+1] + 1 == ords[i+2]
  end
end

def iter(a)
  i = 7
  while a[i] == 'z'
    a[i] = 'a'
    i -= 1
  end
  a[i] = (a[i].ord + 1).chr

  a
end

a = 'hxbxwxba'
a = iter(a) while invalid?(a)
puts a

loop do
  a = iter(a)
  break unless invalid?(a)
end

puts a
