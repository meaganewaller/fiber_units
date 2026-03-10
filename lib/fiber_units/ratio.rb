module FiberUnits
  class Ratio
    attr_reader :numerator, :denominator

    def initialize(numerator, denominator)
      @numerator = numerator
      @denominator = denominator
    end

    def value
      numerator.value.to_f / denominator.value
    end

    def to_s
      "#{value.round(2)} #{numerator.unit}/#{denominator.unit}"
    end
  end
end
