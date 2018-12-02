@hp = Hash.new{|h, k| h[k] = Hash.new(0)}
@re = /^(\w+) would (gain|lose) (\d+) happiness units by sitting next to (\w+).$/

File.readlines('./input').each do |line|
  person, react, value, target = line.match(@re).captures
  value = value.to_i
  value = -value if react == 'lose'
  @hp[person][target] = value
end

people = @hp.keys
people << 'Self'

size = people.size

max_happy = 0

people.permutation do |permu|
  happy = 0
  permu.each_with_index do |person, index|
    happy += @hp[person][permu[(index - 1) % size]]
    happy += @hp[person][permu[(index + 1) % size]]
  end

  max_happy = happy if happy > max_happy
end

puts max_happy
