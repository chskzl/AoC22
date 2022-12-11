data = File.read('input')
           .split(/\s/)
           .map(&:to_i)

pixels = (0...240).map {|i| (data[0..i].sum - i % 40).abs < 2 ? "#" : "."}

puts "Part 1: #{(20..220).step(40).map {|i| i * (data[0...i-1].sum+1)}.sum}"
puts "Part 2:\n" + pixels.each_slice(40).map {|line| line.join}.join("\n")
