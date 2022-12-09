stacks, steps = File.read('input').split("\n\n")

steps = steps.split("\n")
             .map {|step| step.split}
             .map {|step| [step[1].to_i, step[3].to_i-1, step[5].to_i-1]}

stacks = stacks.split("\n")
               .map {|line| line.chars
                                .each_slice(4)
                                .to_a
                                .map{|line| line[1]}}
               .transpose
               .map {|s| s.select{|ch| ch >= 'A' && ch <= 'Z'}}

stacks2 = Array.new(stacks.length)
stacks2.each_with_index {|_, i| stacks2[i] = stacks[i].dup}

steps.each do |amount, from, to|
    stacks[to] = stacks[from].shift(amount).reverse.concat(stacks[to])
    stacks2[to] = stacks2[from].shift(amount).concat(stacks2[to])
end

puts "Part 1: #{stacks.reduce("") {|s, arr| s + arr[0]}}"
puts "Part 2: #{stacks2.reduce("") {|s, arr| s + arr[0]}}"

