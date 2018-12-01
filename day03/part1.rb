require 'set'

def deliver(s)
  t = Set.new
  x = y = 0
  t.add([x, y])

  s.each_char do |c|
    case c
    when '^' then x -= 1
    when 'v' then x += 1
    when '<' then y -= 1
    when '>' then y += 1
    end

    t.add([x, y])
  end

  t.size
end

puts deliver('>')
puts deliver('^>v<')
puts deliver('^v^v^v^v^v')
puts deliver(File.read('./input'))
