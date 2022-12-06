#!/usr/bin/env ruby

class Rps
  class << self
    def rock; 1; end
    alias A rock
    alias X rock
    def paper; 2; end
    alias B paper
    alias Y paper
    def scissors; 3; end
    alias C scissors
    alias Z scissors

    def win ; 6; end
    def draw; 3; end
    def lose; 0; end

    def opponent_chooses_A (my_choice)  # Rock
      return rock     + draw if my_choice == 'X'
      return paper    + win  if my_choice == 'Y'
      return scissors + lose if my_choice == 'Z'
    end

    def opponent_chooses_B (my_choice)  # Paper
      return rock     + lose if my_choice == 'X'
      return paper    + draw if my_choice == 'Y'
      return scissors + win  if my_choice == 'Z'
    end

    def opponent_chooses_C (my_choice)  # Scissors
      return rock     + win  if my_choice == 'X'
      return paper    + lose if my_choice == 'Y'
      return scissors + draw if my_choice == 'Z'
    end
  end
end

games = File.readlines('input')

score = 0
games.each do |game|
  opponent, me = game.split(' ')
  score += Rps.send "opponent_chooses_#{opponent}", me
end

puts score
