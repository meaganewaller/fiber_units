module FiberUnits
  class RowCount
    attr_reader :value

    def initialize(value, _unit = nil)
      @value = value
    end

    def +(other)
      RowCount.new(value + other.value)
    end
  end
end
