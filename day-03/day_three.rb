tree_map = File.readlines('data.txt').map { |line| line.chomp.split('') }

def count_trees(map, way)
  trees = 0
  pos = [0, 0]

  line_length = map[0].length
  map_length = map.length

  loop do
    pos[0] += way[0]
    pos[1] += way[1]
    p pos[1]
    break unless pos[0] < map_length

    pos[1] = pos[1] % line_length
    trees += 1 if map[pos[0]][pos[1]] == '#'
  end
  trees
end

# Part one
p count_trees(tree_map, [1, 3])

# Part two
p [[1, 1], [1, 3], [1, 5], [1, 7], [2, 1]].map { |v| count_trees(tree_map, v) }.reduce(:*)
