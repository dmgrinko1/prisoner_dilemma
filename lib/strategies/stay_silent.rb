# frozen_string_literal: true

require_relative 'base'

module Strategies
  # class represents always keep silence strategy of player
  class StaySilent < Base
    def run
      Base::DECISION[:stay_silent]
    end
  end
end
