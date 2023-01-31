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

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super
    @life_points = 100
    @weapon_level = 1
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon_multiplicator = rand(1..6)
    puts "Tu as récupérer une arme de niveau #{weapon_multiplicator}"
    if weapon_multiplicator > @weapon_level
      @weapon_level = weapon_multiplicator
      puts "Bien joué tu as trouvé une arme plus puissante !"
      return @weapon_level 
    elsif weapon_multiplicator == @weapon_level 
      puts "Mince, ton arme actuelle est du même niveau"
    else puts "Dommage, ton arme actuelle est d'un niveau supérieur"
    end
  end

  def search_health_pack
    search_dice = rand(1..6)
    case search_dice
    when  1
      puts "Tu n'as rien trouvé .. dommage"
    when 2..5
      heal = 50
      @life_points = @life_points + heal
      puts "Tu as récupérer 50 PV"
    when 6
      heal = 80
      @life_points = @life_points + heal
      puts "Tu as récupérer 80 PV"
    end
    @life_points > 100 ? @life_points = 100 : @life_points
  end
end