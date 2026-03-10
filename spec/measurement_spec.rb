RSpec.describe FiberUnits::Measurement do
  describe "arithmetic" do
    it "adds measurements of the same type" do
      result = 4.inches + 2.inches

      expect(result.value).to eq(6)
      expect(result.unit).to eq(:inches)
    end

    it "subtracts measurements" do
      result = 10.inches - 4.inches

      expect(result.value).to eq(6)
    end

    it "multiplies by scalar" do
      result = 4.inches * 3

      expect(result.value).to eq(12)
    end
  end

  describe "ratios" do
    it "creates ratio objects" do
      ratio = 210.yards / 100.grams

      expect(ratio).to be_a(FiberUnits::Ratio)
    end
  end

  describe "division by scalar" do
    it "divides measurement values" do
      result = 10.inches / 2

      expect(result.value).to eq(5)
    end

    it "preserves the measurement class" do
      result = 10.inches / 2

      expect(result).to be_a(FiberUnits::Length)
    end

    it "preserves the unit" do
      result = 10.inches / 2

      expect(result.unit).to eq(:inches)
    end
  end
end
RSpec.describe FiberUnits::Measurement do
  describe "arithmetic" do
    it "adds measurements of the same type" do
      result = 4.inches + 2.inches

      expect(result.value).to eq(6)
      expect(result.unit).to eq(:inches)
    end

    it "subtracts measurements" do
      result = 10.inches - 4.inches

      expect(result.value).to eq(6)
    end

    it "multiplies by scalar" do
      result = 4.inches * 3

      expect(result.value).to eq(12)
    end
  end

  describe "division by scalar" do
    it "divides measurement values" do
      result = 10.inches / 2

      expect(result.value).to eq(5)
    end

    it "preserves the measurement class" do
      result = 10.inches / 2

      expect(result).to be_a(FiberUnits::Length)
    end

    it "preserves the unit" do
      result = 10.inches / 2

      expect(result.unit).to eq(:inches)
    end
  end

  describe "ratios" do
    it "creates ratio objects when dividing by another measurement" do
      ratio = 210.yards / 100.grams

      expect(ratio).to be_a(FiberUnits::Ratio)
    end
  end

  describe "dimension safety" do
    it "raises when adding incompatible measurements" do
      expect {
        4.inches + 100.grams
      }.to raise_error(FiberUnits::DimensionError)
    end

    it "raises when subtracting incompatible measurements" do
      expect {
        4.inches - 2.grams
      }.to raise_error(FiberUnits::DimensionError)
    end

    it "includes helpful information in the error message" do
      expect {
        4.inches + 100.grams
      }.to raise_error(
        FiberUnits::DimensionError,
        /Cannot combine FiberUnits::Length with FiberUnits::Weight/
      )
    end
  end
end
