joltage_adapters = File.readlines('input_day10.txt').map do |line|
  line.gsub(/\n/, '').to_i
end

joltage_outlet = 0
joltage_device = joltage_adapters.max + 3
joltage_all = joltage_adapters.push(joltage_device, joltage_outlet).sort

step_1 = 0
step_2 = 0
step_3 = 0
i = 1

joltage_all.each do |joltage|
  step = (joltage_all[i] - joltage if i < joltage_all.size)
  case step
  when 1
    step_1 += 1
  when 2
    step_2 += 1
  when 3
    step_3 += 1
  end
  i += 1
end

p "The number of 1-jolt differences multiplied by the number of 3-jolt differences is #{step_1 * step_3}"
