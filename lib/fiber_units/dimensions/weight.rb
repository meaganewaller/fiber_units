module FiberUnits
  class Weight < Measurement
    FACTORS = FiberUnits::Conversions::WeightConversion::FACTORS

    def to(unit)
      base = to_base
      self.class.new(base / FACTORS[unit], unit)
    end

    def to_base
      value * FACTORS[unit]
    end
  end
end
