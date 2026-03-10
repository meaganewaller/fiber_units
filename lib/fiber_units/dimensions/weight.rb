module FiberUnits
  class Weight < Measurement
    FACTORS = {
      grams: 1.0,
      kilograms: 1000.0,
      ounces: 28.3495,
      pounds: 453.592
    }.freeze
  end
end
