joltage_adapters = File.readlines('input_day10.txt').map do |line|
  line.gsub(/\n/, '').to_i
end

joltage_outlet = 0
joltage_device = joltage_adapters.max + 3
joltage_all = joltage_adapters.push(joltage_device, joltage_outlet).sort

# part one

step1 = 0
step2 = 0
step3 = 0
i = 1

joltage_all.each do |joltage|
  step = (joltage_all[i] - joltage if i < joltage_all.size)
  case step
  when 1
    step1 += 1
  when 2
    step2 += 1
  when 3
    step3 += 1
  end
  i += 1
end

p "The number of 1-jolt differences multiplied by the number of 3-jolt differences is #{step1 * step3}"

# part two

options = Hash.new(0)
options[0] = 1

joltage_all.each do |joltage|
  3.times do |i|
    options[joltage] += options[joltage - i - 1]
  end
end

p "The total number of distinct ways is #{options.values.max}"
