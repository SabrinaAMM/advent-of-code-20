# Part 1: find the two keys from the given data whose sum is 2020

require 'csv'

keys = []

CSV.foreach('data.csv') do |row|
  keys << row[0].to_i
end

def find_two_keys(array)
  filtered = []
  array.each do |element|
    i = 1
    while i < array.length
      sum = element + array[i]
      i += 1
      filtered << element if sum == 2020
    end
  end
  filtered
end

p find_two_keys(keys)

# Part 2: find the three keys from the given data whose sum is 2020

def find_three_keys(array)
  filtered = []

  array.each do |element|
    i = 1
    while i < array.length
      j = i
      while j < array.length
        sum = element + array[i] + array[j]
        j += 1
        filtered << element if sum == 2020
      end
      i += 1
    end
  end
  filtered
end

p find_three_keys(keys)
