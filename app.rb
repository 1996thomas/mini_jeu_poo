# frozen_string_literal: true

require 'bundler'
Bundler.require
require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('José')
player2 = Player.new('Sanchez')

puts "A ma droite #{player1.name}"
puts "A ma gauche #{player2.name}"
player1.default_show_state
player2.default_show_state
puts "Let's get ready to rumble"
puts '================================'
puts "Et nous commençons avec #{player1.name} qui attaque #{player2.name}"
player1.attack(player2)
puts "C'est au tour de #{player2.name} de lancer une contre-attaque"
player2.attack(player1)

while player1.life_points >= 0 || player2.life_points >= 0
  break if player1.life_points <= 0 || player2.life_points <= 0

  puts '================================'
  puts "Et c'est au tour de #{player1.name} d'attaquer #{player2.name}"
  player1.attack(player2)
  break if player1.life_points <= 0 || player2.life_points <= 0

  puts "C'est maintenant à #{player2.name} de riposter"
  player2.attack(player1)

end

binding.pry
