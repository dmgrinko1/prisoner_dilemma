# frozen_string_literal: true

require_relative 'player'
require_relative 'game_room'

# class represents game process
# Example:
# Game.new(game_pairs)
class Game
  SENTENCES = {
    stay_silent: { stay_silent: [1, 1], testify: [3, 0] },
    testify: { stay_silent: [0, 3], testify: [2, 2] }
  }.freeze

  attr_reader :player, :opponents, :game_rooms

  def initialize(player, *opponents, game_room_factory: GameRoom)
    @player = player
    @opponents = opponents
    @game_rooms = opponents.map { |opponent| game_room_factory.new([player, opponent]) }
  end

  def run_game(rounds)
    rounds.times { run_round }
  end

  def show_scoreboard
    puts 'Scoreboard:'
    game_rooms.each do |pair|
      players = pair.players

      player1 = players[0]
      player2 = players[1]

      player1_score = player1.scores_from[player2.name]
      player2_score = player2.scores_from[player1.name]

      puts "Player: #{player1.name}, Opponent: #{player2.name}, Score: #{player1_score}:#{player2_score}"
    end
  end

  private

  def run_round
    game_rooms.each do |game_room|
      game_room.make_decisions

      decisions = extract_players_decisions(game_room)
      sentences = calculate_sentence(decisions)

      update_scores(game_room, sentences)
    end
  end

  def extract_players_decisions(game_room)
    { player1: game_room.decisions[game_room.players[0].name],
      player2: game_room.decisions[game_room.players[1].name] }
  end

  def calculate_sentence(decisions)
    SENTENCES[decisions[:player1]][decisions[:player2]]
  end

  def update_scores(game_room, sentence)
    game_room.players[0].update_score(game_room.players.last.name, sentence[0])
    game_room.players[1].update_score(game_room.players.first.name, sentence[1])
  end
end
