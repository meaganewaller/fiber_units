module FiberUnits
  class Count
    include Comparable

    attr_reader :value

    def initialize(value, _unit = nil)
      @value = value
      freeze
    end

    def +(other)
      ensure_same_class!(other)
      self.class.new(value + other.value)
    end

    def -(other)
      ensure_same_class!(other)
      self.class.new(value - other.value)
    end

    def *(other)
      self.class.new(value * other)
    end

    def to_i
      value
    end

    def <=>(other)
      return nil unless other.instance_of?(self.class)
      value <=> other.value
    end

    def ==(other)
      other.class == self.class && other.value == value
    end

    private

    def ensure_same_class!(other)
      unless other.instance_of?(self.class)
        raise FiberUnits::DimensionError,
          "Cannot combine #{self.class} with #{other.class}"
      end
    end
  end
end
