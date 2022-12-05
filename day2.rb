choices = {'A' => 0, 'B' => 1, 'C' => 2, 'X' => 0, 'Y' => 1, 'Z' => 2}
points = {0 => 3, 1 => 6, 2 => 0}

data = File.readlines('input')
            .map {|item| item.split
                             .map {|col| col = choices[col]}}

sum1 = data.map {|item| points[(item[1] - item[0]) % 3] + item[1] + 1}
           .sum
sum2 = data.map {|item| (item[1] - 1 + item[0]) % 3 + 1 + points[(item[1] - 1) % 3]}
           .sum

puts "Part 1: #{sum1}"
puts "Part 2: #{sum2}"
