#!/usr/bin/env ruby
require_relative './rucksack'

party_size = 3

total_priority = 0

File.open('input') do |f|
  f.lazy.each_slice(party_size) do |party_members|
    rucksacks = party_members.each(&:chomp!).map.to_a
    party_badge = (rucksacks[0].chars & rucksacks[1].chars & rucksacks[2].chars).first
    total_priority += Rucksack.new('blah').duplicate_priority(party_badge)
  end
end

puts total_priority
