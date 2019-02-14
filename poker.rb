require_relative 'lib/card.rb'
require_relative 'lib/game.rb'
require_relative 'lib/hand.rb'

f = File.open('data/poker.txt').map do |line|
  a = line.split(' ')
  Game.winner(
    Hand.new(a[0..4]),
    Hand.new(a[5..9])
  )
end
        .select { |k| k == 1 }
        .reduce(:+)

puts "Player 1 has won #{f} times"
