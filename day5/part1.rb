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
  line.unshift('-')
  stacks << line
end

stacks = stacks.transpose.map do |line|
  line.map { _1 if _1.match(/[A-Z]/) }
end

puts stacks.map(&:join)
