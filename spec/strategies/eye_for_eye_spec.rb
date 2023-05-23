# frozen_string_literal: true

require 'strategies/eye_for_eye'

RSpec.describe Strategies::EyeForEye do
  subject(:strategy) { described_class.new }

  describe '#run' do
    it 'kkkk' do
      expect(strategy.run).to eq(Strategies::Base::DECISION[:testify])
    end
  end
end
