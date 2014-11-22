require_relative 'player'
require_relative 'die'

class Game
  def initialize(name)
    @name = name
    @players = []
  end
  
  def add_player(player)
    @players << player
  end
  
  def play
    die = Die.new
    @players.each do |p|
      case die.roll
      when 1..2
        p.blam
      when 3..4
        puts "#{p.name} was skipped."
      else
        p.w00t
      end
    end
  end
end

if __FILE__ == $0
  player1 = Player.new("moe")
  player2 = Player.new("larry", 60)
  player3 = Player.new("curly", 125)

  knuckleheads = Game.new("Knuckleheads")
  knuckleheads.add_player(player1)
  knuckleheads.add_player(player2)
  knuckleheads.add_player(player3)
  knuckleheads.play
end