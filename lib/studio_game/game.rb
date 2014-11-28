require_relative 'die'
require_relative 'game_turn'
require_relative 'player'
require_relative 'treasure_trove'

module StudioGame
  class Game
    def initialize(title)
      @title = title
      @players = []
    end
  
    def add_player(player)
      @players << player
    end
  
    def load_players(from_file)
      File.readlines(from_file).each do |line|
        add_player(Player.from_csv(line))
      end    
    end
  
    def play(rounds)
      puts "\nThere are #{@players.size} players in #{@title}:"
      puts @players
    
      treasures = TreasureTrove::TREASURES
      puts "\nThere are #{treasures.size} treasures to be found:"
      treasures.each { |t| puts "A #{t.name} is worth #{t.points} points" }

      1.upto(rounds).each do |round|
        if block_given?
          break if yield
        end
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
  
    def high_score_entry(player)
      formatted_name = player.name.ljust(20, '.')
      "#{formatted_name} #{player.score}"
    end
  
    def save_high_scores(to_file="high_scores.txt")
      File.open(to_file, "w") do |file|
        file.puts "#{@title} High Scores:"
        @players.sort.each do |player|
          file.puts high_score_entry(player)
        end
      end
    end
  
    def print_stats
      strong_players, wimpy_players = @players.partition { |p| p.strong? }
    
      puts "\n#{@title} Statistics:"
      puts "\n#{strong_players.count} strong players:"
      strong_players.each { |p| print_name_and_health(p) }
      puts "\n#{wimpy_players.count} wimpy players:"
      wimpy_players.each { |p| print_name_and_health(p) }
    
      puts "\n#{total_points} total points from treasures found"
    
      @players.sort.each do |player|
        puts "\n#{player.name}'s point totals:"
        player.each_found_treasure do |treasure|
          puts "#{treasure.points} total #{treasure.name} points"
        end
        puts "#{player.points} grand total points"
      end
    
      puts "\n#{@title} High Scores:"
      @players.sort.each { |p| puts high_score_entry(p) }
    end
  
    def total_points
      @players.reduce(0) { |sum, player| sum + player.points }
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
  knuckleheads.play(4)
end