require_relative 'part1'

x = @signals['a']
@signals = {}
@signals['b'] = x
puts signal('a')
