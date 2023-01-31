# frozen_string_literal: true

require 'bundler'
Bundler.require
require_relative 'lib/game'
require_relative 'lib/player'

puts '---------------------------------------------------------'
puts "|       Bienvenue sur 'ILS VEULENT TOUS MA POO' !       |"
puts "|    Le but du jeu est d'être le dernier survivant !    |"
puts '---------------------------------------------------------'

puts '---------------------------------------------------------'
puts ">> Comment t'appelles-tu combattant ?          |"

player_name = gets.chomp.to_s
game = Game.new(player_name)
game.human_player.default_show_state
game.menu

while game.still_ongoing?
  puts '---------------------------------------------------------'
  puts ">> A ton tour, à toi d'attaquer"
  puts ">> Si tu veux de l'aide, tape 'help' "
  puts ">> Si tu voir les PV des ennemis, tape 'show' "
  puts ">> sinon appuie sur n'importe qu'elle touche pour continuer"
  puts '---------------------------------------------------------'
  input = gets.chomp.downcase
  help_input_filter = "help"
  # help_show_player = "show"
  if input == help_input_filter
    game.menu
  # elsif input == help_show_player
  #   game.enemies.show_state
  end
  puts "Que veux-tu faire ?"
  game.menu_choice
  puts '---------------------------------------------------------'
  puts "Au tour des ennemis à présent !"
  game.enemies_attack
end

game.end
