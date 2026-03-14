module FiberUnits
  class StitchCount
    attr_reader :value

    def initialize(value, _unit = nil)
      @value = value
    end

    def +(other)
      StitchCount.new(value + other.value)
    end

    def ==(other)
      other.is_a?(StitchCount) && value == other.value
    end
  end
end
