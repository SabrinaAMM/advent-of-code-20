file = File.open('data.txt')
answers = file.read.split("\n\n")

# part one

unique_answers = answers.map { |string| string.gsub("\n", '') }.map(&:chars).map(&:uniq)
num_of_uni_answers = unique_answers.map(&:length)

p num_of_uni_answers.reduce(:+)

# part two

p answers.map { |group|
  unique_answers = group.gsub(/\s/, '').chars.uniq

  unique_answers.count do |q|
    group.split("\n").all? { |line| line.include?(q) }
  end
}.sum
