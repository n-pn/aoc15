require 'set'

def deliver(s)
  t = Set.new
  t.add([0, 0])

  p = [[0, 0], [0, 0]]
  u = 0

  s.each_char do |c|
    u ^= 1
    q = p[u]

    case c
    when 'v' then q[0] -= 1
    when '^' then q[0] += 1
    when '<' then q[1] -= 1
    when '>' then q[1] += 1
    end

    t.add([*q])
  end
  t.size
end

puts deliver('^>')
puts deliver('^>v<')
puts deliver('^v^v^v^v^v')
puts deliver(File.read('./input'))
