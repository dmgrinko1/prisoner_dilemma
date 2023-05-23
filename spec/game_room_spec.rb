# frozen_string_literal: true

require 'game_room'
require 'player'

RSpec.describe GameRoom do
  let(:player1) { Player.new('Player 1') }
  let(:player2) { Player.new('Player 2') }
  let(:game_room) { GameRoom.new([player1, player2]) }

  describe '#initialize' do
    it 'creates a new game room with players and empty decisions' do
      aggregate_failures do
        expect(game_room.players).to eq([player1, player2])
        expect(game_room.decisions).to eq({})
      end
    end
  end

  describe '#make_decisions' do
    it 'makes decisions for each player and updates the game room' do
      aggregate_failures do
        expect(player1).to receive(:make_decision).and_return(:stay_silent)
        expect(player2).to receive(:make_decision).and_return(:random)

        game_room.make_decisions

        expect(game_room.decisions[player1.name]).to eq(:stay_silent)
        expect(game_room.decisions[player2.name]).to eq(:random)
      end
    end
  end
end
