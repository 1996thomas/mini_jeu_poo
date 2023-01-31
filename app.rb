# frozen_string_literal: true

require 'bundler'
Bundler.require
require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('José')
player2 = Player.new('Sanchez')
human = HumanPlayer.new('Moi')












binding.pry