module FiberUnits
  class Measurement
    include Comparable

    attr_reader :value, :unit

    def initialize(value, unit)
      @value = value
      @unit = unit
    end

    def +(other)
      ensure_same_dimension!(other)

      base = to_base + other.to_base
      new_value = base / self.class::FACTORS[unit]
      new_value = new_value.round(12)

      self.class.new(new_value, unit)
    end

    def -(other)
      ensure_same_dimension!(other)

      base = to_base - other.to_base
      new_value = base / self.class::FACTORS[unit]
      new_value = new_value.round(12)

      self.class.new(new_value, unit)
    end

    def *(other)
      self.class.new(value * other, unit)
    end

    def /(other)
      if other.is_a?(Measurement)
        Ratio.new(self, other)
      else
        self.class.new(value / other, unit)
      end
    end

    def <=>(other)
      ensure_same_dimension!(other)
      to_base <=> other.to_base
    end

    def ==(other)
      return false unless other.is_a?(Measurement)
      return false unless other.is_a?(self.class)

      (to_base - other.to_base).abs < 1e-10
    end

    def !=(other)
      !(self == other)
    end

    def to(target_unit)
      raise FiberUnits::InvalidUnitError unless self.class::FACTORS.key?(target_unit)

      base = to_base
      self.class.new(base / self.class::FACTORS[target_unit], target_unit)
    end

    def to_base
      raise NotImplementedError unless self.class.const_defined?(:FACTORS)

      value * self.class::FACTORS[unit]
    end

    def self.from_base(base_value)
      factors = self::FACTORS

      base_unit = factors.key(1.0)

      raise FiberUnits::InvalidUnitError unless base_unit

      new(base_value / factors[base_unit], base_unit)
    end

    private

    def ensure_same_dimension!(other)
      unless other.is_a?(self.class)
        raise FiberUnits::DimensionError,
          "Cannot combine #{self.class} with #{other.class}"
      end
    end
  end
end
