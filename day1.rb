top3 = File.read('input')
           .split("\n\n")
           .map {|i| i.split.map(&:to_i).sum}
           .sort
           .reverse
           .take(3)

puts "Part 1: #{top3.first}"
puts "Part 2: #{top3.sum}"
