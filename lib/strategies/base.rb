# frozen_string_literal: true

module Strategies
  # base strategy class
  class Base
    DECISION = { testify: :testify, stay_silent: :stay_silent }.freeze

    def make_decision
      raise NotImplementedError
    end
  end
end
