# find the two keys from the given data whose sum is 2020

require 'csv'

keys = []

CSV.foreach('data.csv') do |row|
  keys << row[0].to_i
end

def find_keys(array)
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

p find_keys(keys)
