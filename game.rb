require_relative 'die'
require_relative 'game_turn'
require_relative 'player'
require_relative 'treasure_trove'

class Game
  def initialize(title)
    @title = title
    @players = []
  end
  
  def add_player(player)
    @players << player
  end
  
  def play(rounds)
    puts "\nThere are #{@players.size} players in #{@title}:"
    puts @players
    
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each { |t| puts "A #{t.name} is worth #{t.points} points" }

    1.upto(rounds).each do |round|
      puts "\nRound #{round}:"
      @players.each do |p|
        GameTurn.take_turn(p)
        puts p
      end
    end
  end
  
  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end
  
  def print_stats
    strong_players, wimpy_players = @players.partition { |p| p.strong? }
    
    puts "\n#{@title} Statistics:"
    puts "\n#{strong_players.count} strong players:"
    strong_players.each { |p| print_name_and_health(p) }
    puts "\n#{wimpy_players.count} wimpy players:"
    wimpy_players.each { |p| print_name_and_health(p) }
    
    puts "\n#{total_points} total points from treasures found"
    
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end
    
    puts "\n#{@title} High Scores:"
    @players.sort.each { |p| puts "#{p.name.ljust(20, ".")}#{p.score}" }
  end
  
  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
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
  knuckleheads.play(4)
end