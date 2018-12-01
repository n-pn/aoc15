@cmds = {}
@signals = Hash.new

def signal(wire)
  return wire.to_i if wire =~ /^\d+$/
  return @signals[wire] if @signals[wire]

  gate, wire1, wire2 = @cmds[wire]

  @signals[wire] =
    case gate
    when 'MOV' then signal(wire1)
    when 'NOT' then ~ signal(wire1)
    when 'OR' then signal(wire1) | signal(wire2)
    when 'AND' then signal(wire1) & signal(wire2)
    when 'XOR' then signal(wire1) ^ signal(wire2)
    when 'LSHIFT' then signal(wire1) << signal(wire2)
    when 'RSHIFT' then signal(wire1) >> signal(wire2)
    end % 65536
end

File.readlines('./input').each do |line|
  cmd, wire = line.match(/(.+) -> (.+)/).captures
  @cmds[wire] =
    if m = cmd.match(/^(\w+)$/)
      ["MOV", m.captures[0]]
    elsif m = cmd.match(/NOT (.+)/)
      ["NOT", m.captures[0]]
    else
      a, gate, b = cmd.match(/(.+) (\w+) (.+)/).captures
      [gate, a, b]
    end
end

puts signal('a')
