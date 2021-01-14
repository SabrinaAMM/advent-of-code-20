numbers = File.readlines('input_day_9.txt').map do |line|
  line = line.gsub(/\n/, '').to_i
end

index_start = 0
index_end = 24
index_tested_number = 25

loop do
  sum_of_number_pairs = numbers[index_start..index_end].combination(2).to_a.map { |array| array.inject(0, :+) }

  unless sum_of_number_pairs.include?(numbers[index_tested_number])
    pp numbers[index_tested_number]
    break
  end
  index_start += 1
  index_end += 1
  index_tested_number += 1
end
