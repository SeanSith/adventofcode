#!/usr/bin/env ruby
require_relative './helpers'

assignments = File.readlines('input')

fully_contained_pairs = 0

assignments.each do |assignment|
  elf1, elf2 = elf_assignments(assignment)
  overlap = elf1 & elf2
  fully_contained_pairs += 1 if overlap == elf1 || overlap == elf2
end

puts fully_contained_pairs
