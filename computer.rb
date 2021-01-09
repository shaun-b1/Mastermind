# frozen_string_literal: true

require 'colorize'
# Defines all computer interactions with the game
class Computer
  attr_accessor :possible_codes

  VALID_NUMBERS = [1, 2, 3, 4, 5, 6].freeze

  def initialize
    @possible_codes = VALID_NUMBERS.repeated_permutation(4).to_a
  end

  def computer_code_turn
    4.times.map { rand(1..6) }
  end

  def computer_guess_turn(code_to_break, guess)
    guess.zip(code_to_break).map.with_index do |(guess_element, code_element), ind|
      computer_logic(code_to_break, guess_element, code_element, ind)
    end
    delete_last_code(code_to_break, guess)
  end

  def computer_logic(code_to_break, guess_element, code_element, ind)
    if guess_element == code_element
      @possible_codes.keep_if { |i| i[ind] == guess_element }
    elsif code_to_break.include?(guess_element)
      @possible_codes.keep_if { |i| i.include? guess_element }
    elsif guess_element != code_element
      @possible_codes.keep_if { |i| i.none? guess_element }
    end
  end

  def delete_last_code(code_to_break, guess)
    @possible_codes.delete_if { |i| i == guess } if guess != code_to_break
  end
end
