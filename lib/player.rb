# frozen_string_literal: true

Dir[File.join(__dir__, 'strategies', '*.rb')].sort.each { |file| require file }

# class represents game players. Accepts user name and game strategy. Default strategy is :random
# Example:
# Player.new('User1')
# Player.new('User1', 'stay_silent')
class Player
  STRATEGY_MAPPER = {
    random: Strategies::Random,
    stay_silent: Strategies::StaySilent,
    testify: Strategies::Testify,
    eye_for_eye: Strategies::EyeForEye
  }.freeze

  attr_reader :name, :scores_from
  attr_accessor :strategy, :decisions

  def initialize(name, strategy = :random)
    @name = name
    @scores_from = {}
    @strategy = strategy.to_sym
    @decisions = []
    validate_strategy
  end

  def make_decision
    STRATEGY_MAPPER[strategy].new.run
  end

  def update_score(player_name, sentence)
    @scores_from[player_name] ||= 0
    @scores_from[player_name] += sentence
  end

  def update_decisions(decisions)
    @decisions << decisions
  end

  private

  def validate_strategy
    raise "Invalid strategy: #{strategy}, only #{STRATEGY_MAPPER.keys} allowed" unless STRATEGY_MAPPER.key?(strategy)
  end
end
