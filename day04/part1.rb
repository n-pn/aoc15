require 'digest'

def mining(s, i = 0)
  i += 1 while !Digest::MD5.hexdigest(s + i.to_s).start_with?('00000')
  i
end

# puts mining('abcdef')
# puts mining('pqrstuv')
puts mining('yzbqklnj')
