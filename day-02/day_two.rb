require 'csv'

keys = []

CSV.foreach('data.csv') do |row|
  keys << row
end

# part one of day two

def check_passwords_old(array)
  i = 0
  correct_passwords = []
  while i < array.length
    password = array[i][1]
    conditions = array[i][0].split(/[\s,-]/)
    range1 = conditions[0].to_i
    range2 = conditions[1].to_i
    letter = conditions[2]
    num = password.count(letter)
    correct_passwords << password if num.between?(range1, range2)
    i += 1
  end
  correct_passwords.size
end

p check_passwords_old(keys)

# part two of day two

def check_passwords_new(array)
  i = 0
  correct_passwords = []
  while i < array.length
    password = array[i][1].strip
    conditions = array[i][0].split(/[\s,-]/)
    position1 = conditions[0].to_i
    position2 = conditions[1].to_i
    letter = conditions[2]
    if password[position1 - 1] == letter && password[position2 - 1] != letter
      correct_passwords << password
    elsif password[position2 - 1] == letter && password[position1 - 1] != letter
      correct_passwords << password
    end
    i += 1
  end
  correct_passwords.size
end

p check_passwords_new(keys)
