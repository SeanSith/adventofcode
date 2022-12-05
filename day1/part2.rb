#!/usr/bin/env ruby

lines = File.readlines('input')

elves = []

current = 0
lines.each do |line|
  if line == "\n"
    elves << current
    current = 0
  else
    current += line.to_i
  end
end

puts elves.sort.last(3).sum
