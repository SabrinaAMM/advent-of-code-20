numbers = File.readlines('input_day_9.txt').map do |line|
  line.gsub(/\n/, '').to_i
end

# part one

index_start = 0
index_end = 24
index_tested_number = 25
invalid_number = 0

loop do
  sum_of_number_pairs = numbers[index_start..index_end].combination(2).to_a.map { |array| array.inject(0, :+) }

  unless sum_of_number_pairs.include?(numbers[index_tested_number])
    invalid_number = numbers[index_tested_number]
    p "The invalid number is #{invalid_number}"

    break
  end
  index_start += 1
  index_end += 1
  index_tested_number += 1
end

# part two

numbers.each_with_index do |_number, index|
  sum = 0
  i = index + 1
  while i < numbers.size && sum <= invalid_number
    sum = numbers[index..i].sum

    if sum == invalid_number
      encryption_weakness = numbers[index..i].minmax.sum
      p "The encryption weakness is #{encryption_weakness}"
      break

    end
    i += 1
  end
end
