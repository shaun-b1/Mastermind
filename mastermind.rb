# frozen_string_literal: true

require 'colorize'
require_relative 'player'
require_relative 'game'
require_relative 'board'
require_relative 'computer'
require_relative 'text'

# puts String.colors
# puts String.modes

Game.new.play
