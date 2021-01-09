# frozen_string_literal: true

require 'colorize'
# File outlining text input module
module Text
  def intro_text
    puts "Welcome to #{'MASTERMIND'.bold.underline}"
    puts 'The objective of the game is to break the secret four digit code'
    puts 'The code will be made up of digits between 1 and 6, inclusive'
    puts 'You can either be the Code-breaker, or the Mastermind'
    puts 'Which do you choose?'
    puts "Type \'breaker\' to be the Code-breaker".colorize(:yellow)
    puts "Type \'maker\' to be the Mastermind".colorize(:yellow)
  end

  def input_guess
    puts 'Please input a guess:'
  end

  def input_code
    puts 'Please input a four digit code for the computer to guess; e.g 4265'
  end

  def computer_win_guess
    puts 'The computer has guessed your code'
    puts "You've lost!".colorize(:red)
  end

  def player_win_guess
    puts "You've correctly guessed the code"
    puts "You've won!".colorize(:green)
  end

  def computer_end_game
    puts 'The computer failed to guess the code'
    puts "You've won!".colorize(:green)
  end

  def player_end_game
    puts "You've failed to guess the code"
    puts 'The computer has won!'.colorize(:red)
  end

  def play_again
    puts "Would you like to play again? (#{'Y'.colorize(:green)}/#{'N'.colorize :red})"
    input = gets.chomp.upcase
    case input
    when 'Y'
      Game.new.play
    when 'N'
      exit
    end
  end
end
