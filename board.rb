# frozen_string_literal: true

require 'colorize'

# Defines all display elements of the game
class Board
  attr_accessor :choices, :comparison, :round

  def initialize
    @choices = []
    @comparison = []
    @round = 0
  end

  def add_to_board(guess, comparison_array)
    @choices.push(guess)
    @comparison.push(comparison_array)
    @round += 1
    display_board
  end

  def display_board
    puts "ROUND #{@round}"
    @round.times do |number|
      print_choices(number)
      print_comparison(number)
    end
  end

  def print_choices(number)
    print "#{@choices[number][0]}  #{@choices[number][1]}  #{@choices[number][2]}  #{@choices[number][3]}\t\t"
  end

  def print_comparison(number)
    print "#{@comparison[number][0]}  #{@comparison[number][1]}  #{@comparison[number][2]}  #{@comparison[number][3]}\n"
  end
end
