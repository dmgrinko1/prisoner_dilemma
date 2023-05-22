# frozen_string_literal: true

require 'strategies/random'

RSpec.describe Strategies::Random do
  describe '#run' do
    it 'returns a random decision' do
      decisions = Strategies::Base::DECISION.values
      random_decision = subject.run

      expect(decisions).to include(random_decision)
    end
  end
end
