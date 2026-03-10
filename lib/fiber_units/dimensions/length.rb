module FiberUnits
  class Length < Measurement
    FACTORS = FiberUnits::Conversions::LengthConversion::FACTORS

    def to(unit)
      base = to_base
      self.class.new(base / FACTORS[unit], unit)
    end

    def to_base
      value * FACTORS[unit]
    end
  end
end
