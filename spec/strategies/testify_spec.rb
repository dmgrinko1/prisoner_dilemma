# frozen_string_literal: true

require 'strategies/testify'

RSpec.describe Strategies::Testify do
  let(:strategy) { Strategies::Testify.new }

  describe '#run' do
    it 'returns the :testify decision' do
      expect(strategy.run).to eq(Strategies::Base::DECISION[:testify])
    end
  end
end
