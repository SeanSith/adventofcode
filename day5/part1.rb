#!/usr/bin/env ruby
require_relative './helpers'

input = File.readlines('input')

stacks = parse_stacks(input)

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
