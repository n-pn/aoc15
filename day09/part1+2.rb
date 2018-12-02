$costs = Hash.new{|h, k| h[k] = Hash.new(1000000000)}

def store_cost(a, b, cost)
  $costs[a][b] = cost
  $costs[b][a] = cost
end

File.readlines('./input').each do |line|
  a, b, cost = line.match(/(\w+) to (\w+) = (\d+)/).captures
  store_cost(a, b, cost.to_i)
end

min_cost = 99999999
max_cost = 0
places = $costs.keys
size = places.size - 1

places.permutation do |p|
  cost = (1..size).reduce(0) {|a, c| a + $costs[p[c]][p[c-1]]}
  min_cost = cost if min_cost > cost
  max_cost = cost if max_cost < cost
end

puts min_cost, max_cost
