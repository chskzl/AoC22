data = File.read('input')
           .split

sum1 = data.map {|line| line.chars.each_slice(line.size/2).to_a}
           .map {|line| (line[0] & line[1]).first.ord}
           .map {|item| item - (item < 97 ? 38 : 96)}
           .sum

sum2 = data.each_slice(3)
           .to_a
           .map {|group| (group[0].chars & group[1].chars & group[2].chars).first.ord}
           .map {|item| item - (item < 97 ? 38 : 96)}
           .sum

puts "Part 1: #{sum1}"
puts "Part 2: #{sum2}"
