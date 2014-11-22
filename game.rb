require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game
  def initialize(title)
    @title = title
    @players = []
  end
  
  def add_player(player)
    @players << player
  end
  
  def play
    puts "There are #{@players.size} players in #{@title}:"
    puts @players
    
    @players.each do |p|
      GameTurn.take_turn(p)
      puts p
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