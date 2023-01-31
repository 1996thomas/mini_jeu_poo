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
puts "Enchanté #{player_name}, prépare toi à te battre"
puts '- Pour aller chercher une arme, appuie sur A'
puts '- Pour aller chercher du soin, appuie sur S'
player = HumanPlayer.new(player_name)
player.default_show_state

# puts "Je te laisse choisir le nombre d'ennemi"
# enemy_number = gets.chomp.to_i
# enemies = []
# for i in 0 ... enemy_number
#   enemies << Player.new("enemi#{i}")
# end
# puts "Tu as choisis #{enemies.length} ennemis .. es-tu prêt ? "
ennemies = [player1 = Player.new('José'), player2 = Player.new('Sanchez')]

while player.life_points.positive? && (player1.life_points.positive? || player2.life_points.positive?)
  # puts ">> Ecris 'help' pour revoir les règles"
  # help = gets.chomp.downcase
  # help_filter = 'help'
  # if help.to_s == 'help'
  #   puts "---------------------------------------------------------"
  #   puts "- Pour aller chercher une arme, appuie sur A"
  #   puts "- Pour aller chercher du soin, appuie sur S"
  #   puts "---------------------------------------------------------"
  # end
  puts ">> Qu'elle action veux-tu effectuer ?"
  action = gets.chomp.downcase
  action_filter = /[^as01]/
  while action =~ action_filter
    puts "Je n'ai pas compris"
    action = gets.chomp.downcase
  end
  puts '---------------------------------------------------------'
  case action.to_s
  when 'a'
    player.search_weapon
  when 's'
    player.search_health_pack
  when '0'
    player.attack(player1)
  when '1'
    player.attack(player2)
  end
  ennemies.each do |ennemy|
    ennemy.attack(player)
  end
  puts '---------------------------------------------------------'
  puts '>> Appuie sur une touche pour continuer'
  gets.chomp
end
puts player.life_points.positive? ? 'Bravo tu as gagné' : 'Dommage tu as perdu'
