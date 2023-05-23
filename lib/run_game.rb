# frozen_string_literal: true

require_relative 'player'
require_relative 'game'

# Game setup example
# player = Player.new('User1', :random)
# opponents = [Player.new('Opponent1', :testify), Player.new('Opponent2', :stay_silent)]
# game = Game.new(player, *opponents)
# game.run_game(5)
# game.show_scoreboard
# Input player name and strategy
print "Enter player name: "
player_name = gets.chomp

print "Enter player strategy (random/stay_silent/testify): "
player_strategy = gets.chomp.to_sym

player = Player.new(player_name, player_strategy)

# Input opponent details
opponents = []
loop do
  print "Enter opponent name (or 'q' to quit): "
  opponent_name = gets.chomp
  break if opponent_name == 'q'

  print "Enter opponent strategy (random/stay_silent/testify): "
  opponent_strategy = gets.chomp.to_sym

  opponents << Player.new(opponent_name, opponent_strategy)
end

# Input number of rounds
print "Enter the number of rounds: "
rounds = gets.chomp.to_i

# Create and run the game
game = Game.new(player, *opponents)
game.run_game(rounds)
game.show_scoreboard
