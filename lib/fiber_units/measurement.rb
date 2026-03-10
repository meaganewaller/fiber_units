module FiberUnits
  class Measurement
    attr_reader :value, :unit

    def initialize(value, unit)
      @value = value
      @unit = unit
    end

    def +(other)
      ensure_same_dimension!(other)
      self.class.new(value + other.value, unit)
    end

    def -(other)
      ensure_same_dimension!(other)
      self.class.new(value - other.value, unit)
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

    private

    def ensure_same_dimension!(other)
      unless other.is_a?(self.class)
        raise FiberUnits::DimensionError,
          "Cannot combine #{self.class} with #{other.class}"
      end
    end
  end
end
