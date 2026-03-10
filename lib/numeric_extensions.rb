module FiberUnits
  module NumericExtensions
    def self.install!
      install_length_units
      install_weight_units
      install_fiber_counts
    end

    def self.install_length_units
      FiberUnits::Conversions::LengthConversion::FACTORS.keys.each do |unit|
        Numeric.define_method(unit) do
          FiberUnits::Length.new(self, unit)
        end
      end
    end

    def self.install_weight_units
      FiberUnits::Conversions::WeightConversion::FACTORS.keys.each do |unit|
        Numeric.define_method(unit) do
          FiberUnits::Weight.new(self, unit)
        end
      end
    end

    def self.install_fiber_counts
      Numeric.define_method(:stitches) do
        FiberUnits::StitchCount.new(self)
      end

      Numeric.define_method(:rows) do
        FiberUnits::RowCount.new(self)
      end
    end
  end
end

FiberUnits::NumericExtensions.install!
