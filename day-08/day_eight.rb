require 'set'

codes = File.readlines('data.txt').map do |line|
  line = line.gsub(/\n/, '')
end


#part one

acc = 0
i = 0
executed = []

until executed.include?(i)
  executed << i
  op, arg = codes[i].split
  arg = arg.to_i

  if op === 'acc'
    acc += arg
  elsif op === 'jmp'
    i += arg - 1
  end

  i += 1
end
puts acc


#part two