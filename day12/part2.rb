require 'json'
input = JSON.parse File.read('./input')

def flatten(x)
  case x
  when Array
    x.map{|y| flatten(y)}.flatten
  when Hash
    return "" if x.values.include? "red"
    x.map{|k, v| flatten(v)}.flatten
  else
    x
  end
end

puts flatten(input).reject{|x| x.is_a? String}.sum
