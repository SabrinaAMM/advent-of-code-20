require 'csv'

keys = []

CSV.foreach('data.csv') do |row|
  keys << row
end

def check_passwords(array)
  i = 0
  correct_passwords = []
  while i < array.length
    password = array[i][1]
    range = array[i][0].match(/(\d+-\d+)/)[0]
    range1 = range.split(/-/)[0].to_i
    range2 = range.split(/-/)[1].to_i
    letter = array[i][0].match(/([a-z])/)[1]
    num = password.count(letter)
    correct_passwords << password if num.between?(range1, range2)
    i += 1
  end
  correct_passwords.size
end

p check_passwords(keys)
