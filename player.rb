# frozen_string_literal: true

# Defines all player interactions with the game
class Player
  protected

  def initialize(); end

  public

  def player_guess
    puts 'Please input a guess'
    gets.chomp.split('').map(&:to_i)
  end
end
