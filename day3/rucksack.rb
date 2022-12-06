class Rucksack
  attr_reader :contents

  def initialize(contents)
    @contents = contents
  end

  def length
    @contents.length
  end

  def first_half
    @contents.chars.first(length / 2)
  end

  def second_half
    @contents.chars.last(length / 2)
  end

  def duplicate_priority(item = duplicate_item)
    priorities = [nil] + ('a'..'z').to_a + ('A'..'Z').to_a
    priorities.find_index(item)
  end

  def duplicate_item
    (first_half & second_half).first
  end
end
