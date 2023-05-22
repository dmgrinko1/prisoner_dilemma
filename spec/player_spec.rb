# frozen_string_literal: true

require 'player'

RSpec.describe Player do
  let(:player) { Player.new('John') }
  let(:opponent1) { Player.new('Jack') }

  describe '#initialize' do
    it 'sets the player name and scores' do
      aggregate_failures do
        expect(player.name).to eq('John')
        expect(player.scores_from).to eq({})
      end
    end
  end

  describe '#make_decision' do
    context 'when :random strategy' do
      it 'returns a random decision' do
        expect(Strategies::Base::DECISION.values).to include(player.make_decision)
      end
    end

    context 'when :stay_silent strategy' do
      before { player.strategy = :stay_silent }

      it 'returns a :stay_silent decision' do
        expect(player.make_decision).to eq(Strategies::Base::DECISION[:stay_silent])
      end
    end

    context 'when :testify strategy' do
      before { player.strategy = :testify }

      it 'returns a :testify decision' do
        expect(player.make_decision).to eq(Strategies::Base::DECISION[:testify])
      end
    end
  end

  describe '#update_score' do
    it 'increases the score for the given player' do
      aggregate_failures do
        player.update_score(opponent1.name, 3)
        expect(player.scores_from[opponent1.name]).to eq(3)

        player.update_score(opponent1.name, 2)
        expect(player.scores_from[opponent1.name]).to eq(5)
      end
    end
  end
end
