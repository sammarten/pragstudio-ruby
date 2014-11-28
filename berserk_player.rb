require_relative 'player'
require_relative 'treasure_trove'

class BerserkPlayer < Player

  def initialize(name, health=100)
    super(name, health)
    @w00ts = 0
  end
  
  def berserk?
    @w00ts > 5
  end
  
  def w00t
    super()
    @w00ts += 1
    puts "Berserker is berserk" if berserk?
  end
  
  def blam
    berserk? ? w00t : super()
  end
end

if __FILE__ == $0
  berserker = BerserkPlayer.new("berserker", 50)
  6.times { berserker.w00t }
  2.times { berserker.blam }
  puts berserker.health
end