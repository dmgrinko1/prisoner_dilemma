# frozen_string_literal: true

require 'rspec'
require 'player'
require 'game'

RSpec.describe Game do
  let(:player) { Player.new('Player', :stay_silent) }
  let(:opponent1) { Player.new('Opponent1', :stay_silent) }
  let(:opponent2) { Player.new('Opponent2', :testify) }

  let(:game) { Game.new(player, opponent1, opponent2) }
  let(:run_game) { game.run_game(5) }

  describe '#run_game' do
    it 'runs the specified number of rounds' do
      run_game

      aggregate_failures do
        expect(player.scores_from[opponent1.name]).to eq(5)
        expect(opponent1.scores_from[player.name]).to eq(5)

        expect(player.scores_from[opponent2.name]).to eq(15)
        expect(opponent2.scores_from[player.name]).to eq(0)
      end
    end
  end

  describe '#show_scoreboard' do
    it 'displays the correct scoreboard' do
      run_game

      expected_output = <<~SCOREBOARD
        Scoreboard:
        Player: Player, Opponent: Opponent1, Score: 5:5
        Player: Player, Opponent: Opponent2, Score: 15:0
      SCOREBOARD

      expect { game.show_scoreboard }.to output(expected_output).to_stdout
    end
  end

  context 'when player has :stay_silent strategy' do
    let(:player) { Player.new('Player', :stay_silent) }

    it 'returns :stay_silent decision' do
      expect(player.make_decision).to eq(:stay_silent)
    end
  end

  context 'when player has :testify strategy' do
    let(:player) { Player.new('Player', :testify) }

    it 'returns :testify decision' do
      expect(player.make_decision).to eq(:testify)
    end
  end

  context 'when player has :random strategy' do
    let(:player) { Player.new('Player', :random) }

    it 'returns a valid decision' do
      expect(%i[stay_silent testify]).to include(player.make_decision)
    end
  end
end
