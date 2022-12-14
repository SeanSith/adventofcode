#!/usr/bin/env ruby

require_relative './rucksack'

inputs = File.readlines('input')

rucksacks = inputs.map do |line|
  Rucksack.new(line.chomp)
end

puts rucksacks.map(&:duplicate_priority).sum
