# frozen_string_literal: true

require_relative 'base'

module Strategies
  # class represents eye for eye strategy of player
  # The player starts with the :testify action and then repeats the opponent's action on the previous turn
  class EyeForEye < Base
    def initialize
      @previous_decision = nil
    end

    def run
      if @previous_decision.nil?
        :testify
      else
        @previous_decision
      end
    end

    def update_previous_decision(decision)
      @previous_decision = decision
    end
  end
end
