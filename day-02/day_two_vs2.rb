require 'csv'

passwords = []
conditions = []

CSV.foreach('data.csv') do |row|
  passwords << row[1].strip
  conditions << row[0].split(/[\s,-]/)
end

# part one of day two

def check_passwords_old(passwords, conditions)
  correct_passwords = []
  passwords.each_with_index do |password, i|
    range1 = conditions[i][0].to_i
    range2 = conditions[i][1].to_i
    letter = conditions[i][2]
    num = password.count(letter)
    correct_passwords << password if num.between?(range1, range2)
  end
  correct_passwords.size
end

p check_passwords_old(passwords, conditions)

# part two of day two

def check_passwords_new(passwords, conditions)
  correct_passwords = []
  passwords.each_with_index do |password, i|
    position1 = conditions[i][0].to_i
    position2 = conditions[i][1].to_i
    letter = conditions[i][2]
    if password[position1 - 1] == letter && password[position2 - 1] != letter
      correct_passwords << password
    elsif password[position2 - 1] == letter && password[position1 - 1] != letter
      correct_passwords << password
    end
  end
  correct_passwords.size
end

p check_passwords_new(passwords, conditions)
