#!/usr/bin/env ruby

lines = File.readlines('input')

highest_calorie_count = 0

current = 0
lines.each do |line|
  if line == "\n"
    highest_calorie_count = current if highest_calorie_count < current
    current = 0
  else
    current += line.to_i
  end
end

puts highest_calorie_count
