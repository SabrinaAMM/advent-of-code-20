file = File.open('data.txt')
@rules = file.read.split("\n")

# part one

def get_bags(arr)
  arr.map do |bag|
    bag_name = bag.split
    bag_name[0..1].join(' ')
  end
end

def contains_gb(arr)
  arr.map do |bag|
    @rules.select { |i| i[/#{bag}/] }
  end
end

hold_gb = @rules.select { |i| i[/\d shiny gold/] }
hold_gb = get_bags(hold_gb)

arr = hold_gb
i = hold_gb.size
j = 0
until i == j
  j = arr.size
  arr = contains_gb(arr)
  arr = get_bags(arr.flatten).uniq
  i = arr.size
end

p arr.size
