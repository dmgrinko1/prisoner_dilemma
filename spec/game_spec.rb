# frozen_string_literal: true

require 'rspec'
require 'player'
require 'game'

RSpec.describe Game do
  let(:player) { Player.new('Player') }
  let(:opponent1) { Player.new('Opponent1') }
  let(:opponent2) { Player.new('Opponent2') }

  let(:game) { Game.new(player, opponent1, opponent2) }
  let(:run_game) { game.run_game(5) }

  before do
    allow(player).to receive(:make_decision).and_return(:stay_silent)
    allow(opponent1).to receive(:make_decision).and_return(:testify)
    allow(opponent2).to receive(:make_decision).and_return(:stay_silent)
  end

  describe '#run_game' do
    it 'runs the specified number of rounds' do
      run_game

      aggregate_failures do
        expect(player.scores_from[opponent1.name]).to eq(15)
        expect(opponent1.scores_from[player.name]).to eq(0)

        expect(player.scores_from[opponent2.name]).to eq(5)
        expect(opponent2.scores_from[player.name]).to eq(5)
      end
    end
  end

  describe '#show_scoreboard' do
    it 'displays the correct scoreboard' do
      run_game

      expected_output = <<~SCOREBOARD
        Scoreboard:
        Player: Player, Opponent: Opponent1, Score: 15:0
        Player: Player, Opponent: Opponent2, Score: 5:5
      SCOREBOARD

      expect { game.show_scoreboard }.to output(expected_output).to_stdout
    end
  end
end
