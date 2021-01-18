passports = []
File.foreach('data.txt').chunk do |line|
  /\A\s*\z/ !~ line || nil
end.each do |_, lines|
  passports << lines
end

# part one, first version

valid = []
needs = %w[byr iyr eyr hgt hcl ecl pid]

passports.map(&:join).each do |e|
  present_fields = 0
  needs.each { |need| present_fields += 1 if e.include?(need) }
  valid << e if present_fields == needs.size
end

p "There are #{valid.size} valid passports"
