file = File.open('data.txt')
codes = file.read.split("\n")

# part one
ids = codes.map do |code|
  rmin = 0
  rmax = 127
  cmin = 0
  cmax = 7

  code.split('').each do |c|
    ri = (rmin + rmax) / 2
    ci = (cmin + cmax) / 2

    case c
    when 'F'
      rmax = ri
    when 'B'
      rmin = ri + 1
    when 'L'
      cmax = ci
    when 'R'
      cmin = ci + 1
    end
  end

  rmin * 8 + cmin
end

p ids.max

# part two

ids = ids.sort
i = ids.min

ids.each do |id|
  if id != i
    p i
    break
  end
  i += 1
end
