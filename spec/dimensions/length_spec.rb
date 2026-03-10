RSpec.describe FiberUnits::Length do
  describe "initialization" do
    it "stores value and unit" do
      length = FiberUnits::Length.new(4, :inches)

      expect(length.value).to eq(4)
      expect(length.unit).to eq(:inches)
    end
  end

  describe "conversion" do
    it "converts inches to centimeters" do
      result = 4.inches.to(:centimeters)

      expect(result.value.round(2)).to eq(10.16)
    end

    it "converts yards to meters" do
      result = 210.yards.to(:meters)

      expect(result.value.round(3)).to eq(192.024)
    end
  end

  describe "comparison" do
    it "compares equal values across units" do
      expect(1.meters.to(:centimeters).value).to eq(100)
    end
  end

  describe "#to_base" do
    it "converts inches to millimeters" do
      length = 4.inches

      expect(length.to_base).to eq(101.6)
    end

    it "converts yards to millimeters" do
      length = 1.yards

      expect(length.to_base).to eq(914.4)
    end

    it "converts meters to millimeters" do
      length = 2.meters

      expect(length.to_base).to eq(2000)
    end
  end
end
