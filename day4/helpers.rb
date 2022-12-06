def assignment_range(range)
  start, ending = range.split('-')
  start..ending
end

def elf_assignments(assignment)
  assignments = assignment.split(',')
  assignments.map { |x| assignment_range(x.chomp).to_a }
end
