# frozen_string_literal: true

require 'colorize'
require_relative 'text'

# Defines all game functionality
class Game
  include Text

  attr_reader :round

  def initialize
    @computer_player = Computer.new
    @human_player = Player.new(intro)
    @game_board = Board.new
  end

  def intro
    system('clear')
    intro_text
    input = gets.chomp.downcase
    case input
    when 'breaker' then true
    when 'maker' then false
    else
      puts 'Incorrect option'
      intro
    end
  end

  def play
    case @human_player.code_breaker
    when true
      system('clear')
      human_play_game
      turn until end_game? || win_game?
    when false
      system('clear')
      computer_play_game
      turn until end_game? || win_game?
    end
  end

  def human_play_game
    @code_to_break = @computer_player.computer_code_turn
  end

  def computer_play_game
    @code_to_break = @human_player.player_input
    if @code_to_break.any? { |i| i < 1 || i > 6 }
      system('clear')
      puts "Incorrect option, please only use numbers between 1 and 6".colorize(:red)
      raise
    end
  rescue StandardError
    retry
  end

  def turn
    case @human_player.code_breaker
    when true
      human_turn
    when false
      computer_turn
    end
  end

  def human_turn
    @guess = @human_player.player_input
    @comparison_array = []
    check_code
    @game_board.add_to_board(@guess, @comparison_array)
  end

  def computer_turn
    @guess = @computer_player.possible_codes.sample
    @comparison_array = []
    @computer_player.computer_guess_turn(@code_to_break, @guess)
    check_code
    @game_board.add_to_board(@guess, @comparison_array)
    sleep(2)
  end

  def check_code
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

    case @human_player.code_breaker
    when true
      player_end_game
    when false
      computer_end_game
    end
    play_again
  end

  def win_game?
    return unless @guess == @code_to_break

    case @human_player.code_breaker
    when true
      player_win_guess
    when false
      computer_win_guess
    end
    play_again
  end
end
