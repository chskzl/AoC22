$trees = File.read('input').split.map(&:chars)
l = $trees.length
w = $trees[0].length

def is_visible(x, y)
  col = $trees.map {|row| row[x]}
  max_heights = [col.slice(0...y),
                 col.slice(y+1..-1),
                 $trees[y].slice(0...x),
                 $trees[y].slice(x+1..-1)].map(&:max)

  return (max_heights.include? nil) || max_heights.min < $trees[y][x] ? 1 : 0
end

def scenic_score(x,y)
  col = $trees.map {|row| row[x]}
  views = [col.slice(0...y).reverse,
           col.slice(y+1..-1),
           $trees[y].slice(0...x).reverse,
           $trees[y].slice(x+1..-1)]

  score = 1
  views.each do |view|
    view.each_with_index do |tree, index|
      if tree >= $trees[y][x] || index == view.length-1
        score *= index + 1
        break
      end
    end
  end

  return score
end

num_visible = 0
max_scenic_score = 0
for y in (0...l)
  for x in (0...w)
    num_visible += is_visible(x,y)
    max_scenic_score = [scenic_score(x,y), max_scenic_score].max
  end
end

puts "Part 1: #{num_visible}"
puts "Part 2: #{max_scenic_score}"
