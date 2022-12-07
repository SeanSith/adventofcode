#!/usr/bin/env ruby

marker_length = 4

input = File.read('input').chars

marker = []

input.each_with_index do |char, index|
  marker << char
  next unless marker.length == marker_length

  if marker.uniq.length == marker.length
    puts "We processed #{index + 1} characters and found #{marker.join}."
    exit
  else
    marker.shift
  end
end
