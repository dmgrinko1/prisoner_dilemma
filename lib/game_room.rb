# frozen_string_literal: true

# Represents a pair of players in a game
# abstract class to associate players with a game
class GameRoom
  attr_reader :players, :decisions

  def initialize(players)
    @players = players
    @decisions = {}
  end

  def make_decisions
    players.each do |player|
      decision = player.make_decision
      update_game_room(player, decision)
    end
  end

  private

  def update_game_room(user, decision)
    decisions[user.name] = decision
  end
end
