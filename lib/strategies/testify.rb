# frozen_string_literal: true

require_relative 'base'

module Strategies
  # class represents always keep testify strategy of player
  class Testify < Base
    def run
      Base::DECISION[:testify]
    end
  end
end
