# frozen_string_literal: true

require_relative 'text'
require_relative 'game'
# Defines all player interactions with the game
class Player
  include Text
  attr_accessor :code_breaker

  def initialize(codebreaker)
    @code_breaker = codebreaker
  end

  def player_input
    case @code_breaker
    when true
      input_guess
      gets.chomp.split('').map(&:to_i)
    when false
      input_code
      gets.chomp.split('').map(&:to_i)
    end
  end
end
