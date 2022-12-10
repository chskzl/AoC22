require 'set'

motions = File.read('input').split("\n").map(&:split).map {|motion| [motion[0], motion[1].to_i]}
dirs = {'U' => [0,1], 'R' => [1,0], 'D' => [0,-1], 'L' => [-1,0]}
knots = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
visited = Set[knots[1]]
visited2 = Set[knots[9]]

def next_pos(h, t)
  if (h[0]-t[0]).abs < 2 && (h[1]-t[1]).abs < 2
    return t
  elsif (h[0]-t[0]).abs > (h[1]-t[1]).abs
    return [h[0]+(h[0] < t[0] ? 1 : -1), h[1]]
  elsif (h[0]-t[0]).abs < (h[1]-t[1]).abs
    return [h[0], h[1]+(h[1] < t[1] ? 1 : -1)]
  end
  return [h[0]+(h[0] < t[0] ? 1 : -1), h[1]+(h[1] < t[1] ? 1 : -1)]
end

for d, l in motions
  for _ in (0...l)
    knots.first[0] += dirs[d][0]
    knots.first[1] += dirs[d][1]

    for i in (1...knots.length)
      knots[i] = next_pos(knots[i-1], knots[i])
    end

    visited << knots[1]
    visited2 << knots[9]
  end
end

puts "Part 1: #{visited.length}"
puts "Part 2: #{visited2.length}"
