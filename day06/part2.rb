@lights = Hash.new(0)

def switch(xrange, yrange, type)
  xrange.each do |x|
    yrange.each do |y|
      p = x * 1000 + y
      case type
      when 'toggle' then @lights[p] += 2
      when 'turn on' then @lights[p] += 1
      when 'turn off'
        @lights[p] -= 1 if @lights[p] > 0
      end
    end
  end
end

regex = /(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/
File.readlines('./input').each do |line|
  action, x1, y1, x2, y2 = line.match(regex).captures
  switch(x1.to_i..x2.to_i, y1.to_i..y2.to_i, action)
end
puts @lights.values.sum
