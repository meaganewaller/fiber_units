module FiberUnits
  class Length < Measurement
    BASE_UNIT = :millimeters

    FACTORS = {
      millimeters: 1,
      centimeters: 10,
      meters: 1000,
      inches: 25.4,
      feet: 304.8,
      yards: 914.4
    }
  end
end
