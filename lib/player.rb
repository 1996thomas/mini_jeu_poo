# frozen_string_literal: true

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "Il reste #{@life_points} PV à #{@name} "
  end

  def default_show_state
    puts "#{@name} commence la partie avec #{@life_points} points de vie"
  end

  def attack(player)
    puts "#{@name} attaque #{player.name}"
    player.gets_damage
    player.show_state
  end

  def compute_damage
    rand(1..6)
  end

  def gets_damage
    damage = compute_damage
    @life_points -= damage
    puts "#{@name} a pris #{damage} points de dégats"
    return unless @life_points <= 0

    puts "#{@name} est KO"
  end
end
