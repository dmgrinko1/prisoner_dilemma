# frozen_string_literal: true

require_relative 'player'

# class represents game process
# Example:
# Game.new(player, *opponents)
class Game
  SENTENCES = {
    stay_silent: { stay_silent: [1, 1], testify: [3, 0] },
    testify: { stay_silent: [0, 3], testify: [2, 2] }
  }.freeze

  attr_reader :player, :opponents

  def initialize(player, *opponents)
    @player = player
    @opponents = opponents
  end

  def run_game(rounds)
    rounds.times { run_round }
  end

  def show_scoreboard
    puts 'Scoreboard:'
    opponents.each do |opponent|
      player_score = player.scores_from[opponent.name]
      opponent_score = opponent.scores_from[player.name]
      puts "Player: #{player.name}, Opponent: #{opponent.name}, Score: #{player_score}:#{opponent_score}"
    end
  end

  private

  def run_round
    decisions = make_decisions
    sentences = calculate_sentence(decisions)
    update_decisions(decisions)
    update_scores(sentences)
  end

  def make_decisions
    player_decision = player.make_decision
    opponent_decisions = opponents.map(&:make_decision)

    { player: player_decision, opponents: opponent_decisions }
  end

  def calculate_sentence(decisions)
    decisions[:opponents].map { |opponent_decision| SENTENCES[decisions[:player]][opponent_decision] }
  end

  def update_decisions(decisions)
    player.update_decisions(decisions[:player])
    opponents.each_with_index do |opponent, index|
      opponent.update_decisions(decisions[:opponents][index])
    end
  end

  def update_scores(sentences)
    sentences.each_with_index do |sentence, index|
      opponent = opponents[index]
      player.update_score(opponent.name, sentence[0])
      opponent.update_score(player.name, sentence[1])
    end
  end
end
