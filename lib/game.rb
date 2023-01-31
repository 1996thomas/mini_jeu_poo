# frozen_string_literal: true

# Cette classe sert a plein de truc
class Game
  # Cette classe sert a plein de truc
  attr_accessor :human_player, :enemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies = []
    number_of_enemies = 4
    number_of_enemies.times do |i|
      @enemies << Player.new("Player #{i}")
    end
  end

  def kill_player(player)
    @enemies.slice!(player)
  end

  def still_ongoing?
    return false if @human_player.life_points.zero? || @enemies.empty?

    true
  end

  def show_players
    @human_player.show_state
    puts "il reste #{@enemies.length} ennemi(s)"
  end

  def menu
    puts '- Pour aller chercher une arme, appuie sur A'
    puts '- Pour aller chercher du soin, appuie sur S'
    @enemies.each do |i|
      puts "Pour attaquer #{i.name}, Appuie sur #{@enemies.index(i)}"
    end
  end

  def menu_choice
    choice = gets.chomp.downcase
    choice_num_filter = /[0-9]/
    choice = choice.to_i if choice =~ choice_num_filter
    case choice
    when 'a' then @human_player.search_weapon
    when 's' then @human_player.search_health_pack
    when 0...@enemies.length
      @human_player.attack(@enemies[choice])
      if @enemies[choice].life_points <= 0
        kill_player(choice)
        puts 'Bravo tu as tué '
      end
    else puts 'Hmmm ça ne fait rien'
    end
  end

  def enemies_attack
    @enemies.each do |i|
      i.attack(@human_player) if i.life_points.positive?
    end
  end

  def end
    if human_player.life_points <= 0
      puts 'Dommage tu as perdu'
    elsif enemies.empty?
      puts 'Bravo tu as gagné'
    end
  end
end
