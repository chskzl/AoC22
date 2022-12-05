def fully_contains(pair)
  pair[0][0] >= pair[1][0] &&
  pair[0][1] <= pair[1][1] ||
  pair[0][0] <= pair[1][0] &&
  pair[0][1] >= pair[1][1] ? 1 : 0
end

def overlaps(pair)
  pair[0][1] >= pair[1][0] &&
  pair[0][0] <= pair[1][1] ||
  pair[0][0] <= pair[1][1] &&
  pair[0][1] >= pair[1][0] ? 1 : 0
end

data = File.readlines('input')
           .map {|line| line.split(',')
                            .map {|pair| pair.split('-').map(&:to_i)}}

sum1 = data.map {|pair| fully_contains(pair)}
           .sum

sum2 = data.map {|pair| overlaps(pair)}
           .sum

puts "Part 1: #{sum1}"
puts "Part 2: #{sum2}"
