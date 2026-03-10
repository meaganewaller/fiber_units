module FiberUnits
  module Conversions
    module LengthConversion
      FACTORS = {
        millimeters: 1.0,
        centimeters: 10.0,
        meters: 1000.0,
        inches: 25.4,
        feet: 304.8,
        yards: 914.4
      }.freeze

      def self.convert(value, from, to)
        raise FiberUnits::InvalidUnitError unless FACTORS.key?(from)
        raise FiberUnits::InvalidUnitError unless FACTORS.key?(to)

        base = value * FACTORS[from]
        base / FACTORS[to]
      end
    end
  end
end
