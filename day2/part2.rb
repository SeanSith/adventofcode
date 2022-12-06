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

    def opponent_chooses_A (round_status)  # Rock
      return scissors + lose if round_status == 'X'
      return rock     + draw if round_status == 'Y'
      return paper    + win  if round_status == 'Z'
    end

    def opponent_chooses_B (round_status)  # Paper
      return rock     + lose if round_status == 'X'
      return paper    + draw if round_status == 'Y'
      return scissors + win  if round_status == 'Z'
    end

    def opponent_chooses_C (round_status)  # Scissors
      return paper    + lose if round_status == 'X'
      return scissors + draw if round_status == 'Y'
      return rock     + win  if round_status == 'Z'
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
