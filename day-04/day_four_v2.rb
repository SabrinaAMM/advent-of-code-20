class Symbol
  def with(*args, &block)
    ->(caller, *rest) { caller.send(self, *rest, *args, &block) }
  end
end

file = File.open('data.txt')
passports = file.read.split("\n\n")

# part one, second version

h1 = []
valid = []

passports.map(&:split.with(/[\s,:]/)).each { |passport| h1 << Hash[*passport.flatten(1)] }

h1.each { |hash| valid << hash if %w[byr iyr eyr hgt hcl ecl pid].all? { |s| hash.key? s } }

p "There are #{valid.size} valid passports"

# part two

validated = []

valid.each do |hash|
  next unless hash['byr'].between?('1920', '2002') &&
              hash['iyr'].between?('2010', '2020') &&
              hash['eyr'].between?('2020', '2030') &&
              hash['hgt'].match(/1([5-8]\d|9[0-3])cm|(^59|^6[0-9]|^7[0-6])[in]/) &&
              hash['hcl'].match(/#[0-9a-f]{6}/) &&
              hash['ecl'].match(/(amb|blu|brn|gry|grn|hzl|oth)/) &&
              hash['pid'].match(/^[0-9]{9}$/)

  validated << hash
end

p "There are #{validated.size} valid passports"
