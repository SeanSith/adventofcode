#!/usr/bin/env ruby
require_relative './helpers'

assignments = File.readlines('input')

number_overlapping = 0

assignments.each do |assignment|
  elf1, elf2 = elf_assignments(assignment)
  number_overlapping += 1 if elf1 & elf2 != []
end

puts number_overlapping
