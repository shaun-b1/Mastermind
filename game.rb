# frozen_string_literal: true

require 'colorize'

# Defines all computer functionality with the game
class Game
  protected

  attr_reader :round

  def initialize
    @human_player = Player.new
    @game_board = Board.new
  end

  public

  def play
    @code_to_break = 4.times.map { rand(1..6) }
    turn until end_game? || win_game?
  end

  protected

  def turn
    @guess = @human_player.player_guess
    @comparison_array = []
    check_code?
    @game_board.add_to_board(@guess, @comparison_array)
  end

  def check_code?
    paired_array = @guess.zip(@code_to_break)
    paired_array.each do |x, y|
      if x == y
        @comparison_array.push('!'.colorize(:green))
      elsif @code_to_break.include?(x)
        @comparison_array.push('?'.colorize(:yellow))
      elsif x != y
        @comparison_array.push('-'.colorize(:red))
      end
    end
  end

  def end_game?
    return unless @game_board.round == 12

    puts "You've failed to guess the code. The computer has won!"
    exit
  end

  def win_game?
    return unless @guess == @code_to_break

    puts "You've correctly guessed the code!"
    exit
  end
end
