#!/usr/bin/env ruby

input = File.readlines('input')

stacks = []
input.each do |line|
  break if line.match(/[1-9]/)

  line = line.chomp!.chars
  for i in 0..line.length do
    next if line[i].nil?
    next if line[i].match(/a-zA-z\s/)

    line.delete_at(i)
  end
  (line.length..1).step(-2).to_a.each { line.delete_at(_1) }
  stacks << line
end

stacks = stacks.transpose.map do |line|
  line.map { _1 if _1.match(/[A-Z]/) }.compact
end

input.each do |line|
  next unless line.match(/^move/)

  line_regex = /^move (\d+) from (\d+) to (\d+)/
  quantity, source, destination = line.match(line_regex).captures
  quantity.to_i.times do
    whats_moving = stacks[source.to_i - 1].shift
    stacks[destination.to_i - 1].unshift(whats_moving)
  end
end

puts stacks.map(&:join)
puts ''
puts stacks.map(&:first).join
