# frozen_string_literal: true

module Strategies
  # base strategy class
  class Base
    DECISION = { testify: :testify, stay_silent: :stay_silent }.freeze

    def run
      raise NotImplementedError
    end
  end
end
