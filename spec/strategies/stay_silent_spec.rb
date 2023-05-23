# frozen_string_literal: true

require 'strategies/stay_silent'

RSpec.describe Strategies::StaySilent do
  subject(:strategy) { described_class.new }

  describe '#run' do
    it 'returns the :stay_silent decision' do
      expect(strategy.run).to eq(Strategies::Base::DECISION[:stay_silent])
    end
  end
end
