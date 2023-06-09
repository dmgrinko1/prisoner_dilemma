# frozen_string_literal: true

require 'strategies/testify'

RSpec.describe Strategies::Testify do
  subject(:strategy) { described_class.new }

  describe '#run' do
    it 'returns the :testify decision' do
      expect(strategy.run).to eq(Strategies::Base::DECISION[:testify])
    end
  end
end
