class Rucksack
  attr_reader :contents

  def initialize(contents)
    @contents = contents
    @first_half = first_half
    @second_half = second_half
    @duplicate_item = find_duplicate_item
  end

  def length
    @contents.length
  end

  def first_half
    @contents[0..(length / 2)-1]
  end

  def second_half
    @contents[(length / 2)..]
  end

  def duplicate_priority(item = @duplicate_item)
    priorities = [nil] + ('a'..'z').to_a + ('A'..'Z').to_a
    return priorities.find_index(item)
  end

  private

  def find_duplicate_item
    first_half = @first_half.chars
    second_half = @second_half.chars
    (first_half & second_half).first
  end
end
