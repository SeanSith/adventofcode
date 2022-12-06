def parse_stacks(input)
  stacks = []
  input.each do |line|
    break if line.match(/[1-9]/)

    line = line.chomp!.chars
    # line = line.select { _1.match(/a-zA-Z\s/) }
    for i in 0..line.length do
      next if line[i].nil?
      next if line[i].match(/a-zA-Z\s/)

      line.delete_at(i)
    end
    puts line.join
    (line.length..1).step(-2).to_a.each { line.delete_at(_1) }
    stacks << line
  end

  stacks.transpose.map do |line|
    line.select { _1.match(/[A-Z]/) }
  end
end
