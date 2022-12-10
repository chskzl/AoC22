$dirs = {}
data = File.read('input').split("$ ")
path = []

data.map(&:split).each do |cmd|
  if cmd.first == "cd"
    if cmd[1] == ".."
      path.pop
    else
      path.push(cmd[1])
    end
  elsif cmd.first == "ls"
    pathStr = "/" + path.slice(1..-1).join("/")
    contents = cmd.slice(1..-1).each_slice(2).to_a
    for i in (0...contents.length)
      contents[i] = contents[i].first == "dir" ?
      ["dir", (pathStr.length > 1 ? pathStr : "") + "/" + contents[i].last] : [contents[i].first.to_i, contents[i].last]
    end
    $dirs[pathStr] = contents
  end
end

def traverse(dir)
  $dirs[dir].map{|item| item[0] == "dir" ? traverse(item[1]) : item[0].to_i}.sum
end

sizes = $dirs.keys.map {|key| traverse(key)}
unused = 30000000 - (70000000 - sizes.max)
puts "Part 1: #{sizes.select{|size| size <= 100000}.sum}"
puts "Part 2: #{sizes.select{|size| size >= unused}.min}"
