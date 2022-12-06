#!/usr/bin/env ruby
require_relative './rucksack'

party_size = 3

total_priority = 0

File.open('input') do |f|
  f.lazy.each_slice(party_size) do |party_members|
    rucksacks = party_members.map { |x| x.chomp!.chars }
    party_badge = rucksacks.reduce { |memo, items| (memo || items) & items }.first
    total_priority += Rucksack.new('blah').duplicate_priority(party_badge)
  end
end

puts total_priority
