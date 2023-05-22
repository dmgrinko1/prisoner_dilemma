# frozen_string_literal: true

require_relative 'base'

module Strategies
  # class represents random strategy of player
  class Random < Base
    def run
      Base::DECISION.values.sample
    end
  end
end
