require 'set'

$data = File.read('input')

def find_marker(num_unique)
  (0...$data.length-num_unique).each do |i|
    if Set.new($data[i...i+num_unique].chars).length == num_unique
      return i + num_unique
    end
  end
end

puts "Part 1: #{find_marker(4)}"
puts "Part 2: #{find_marker(14)}"
