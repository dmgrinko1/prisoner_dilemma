# frozen_string_literal: true

# Create, setup and run the game example:

require_relative 'player'
require_relative 'game'

player = Player.new('User1', :random)
opponents = [Player.new('Opponent1', :testify), Player.new('Opponent2', :stay_silent)]
game = Game.new(player, *opponents)
game.run_game(5)
game.show_scoreboard
