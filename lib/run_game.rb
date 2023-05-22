# frozen_string_literal: true

# Create, setup and run the game example:

require_relative 'player'
require_relative 'game'

player = Player.new('User1', :eye_for_eye)
opponents = [Player.new('Opponent1', :stay_silent), Player.new('Opponent2', :testify)]
game = Game.new(player, *opponents)
game.run_game(2)
game.show_scoreboard
