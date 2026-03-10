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

  describe "comparison operators" do
    describe "greater than (>)" do
      it "returns true when left side is greater" do
        expect(4.inches > 2.inches).to be true
      end

      it "returns false when left side is smaller" do
        expect(2.inches > 4.inches).to be false
      end

      it "returns false when values are equal" do
        expect(4.inches > 4.inches).to be false
      end

      it "compares across different units of the same dimension" do
        expect(4.inches > 10.centimeters).to be true
      end
    end

    describe "less than (<)" do
      it "returns true when left side is smaller" do
        expect(2.inches < 4.inches).to be true
      end

      it "returns false when left side is greater" do
        expect(4.inches < 2.inches).to be false
      end

      it "returns false when values are equal" do
        expect(4.inches < 4.inches).to be false
      end

      it "compares across different units of the same dimension" do
        expect(10.centimeters < 4.inches).to be true
      end
    end

    describe "greater than or equal (>=)" do
      it "returns true when left side is greater" do
        expect(4.inches >= 2.inches).to be true
      end

      it "returns true when values are equal" do
        expect(4.inches >= 4.inches).to be true
      end

      it "returns false when left side is smaller" do
        expect(2.inches >= 4.inches).to be false
      end

      it "compares across units" do
        expect(4.inches >= 10.centimeters).to be true
      end
    end

    describe "less than or equal (<=)" do
      it "returns true when left side is smaller" do
        expect(2.inches <= 4.inches).to be true
      end

      it "returns true when values are equal" do
        expect(4.inches <= 4.inches).to be true
      end

      it "returns false when left side is greater" do
        expect(4.inches <= 2.inches).to be false
      end

      it "compares across units" do
        expect(10.centimeters <= 4.inches).to be true
      end
    end

    describe "equality (==)" do
      it "returns true for equal values in the same unit" do
        expect(4.inches == 4.inches).to be true
      end

      it "returns false for different values" do
        expect(4.inches == 2.inches).to be false
      end

      it "returns true for equivalent values in different units" do
        expect(1.yards == 36.inches).to be true
      end

      it "handles floating point precision" do
        result = 1.yards + 0.inches
        expect(result == 1.yards).to be true
      end
    end

    describe "inequality (!=)" do
      it "returns false for equal values" do
        expect(4.inches != 4.inches).to be false
      end

      it "returns true for different values" do
        expect(4.inches != 2.inches).to be true
      end

      it "returns false for equivalent values in different units" do
        expect(1.yards != 36.inches).to be false
      end
    end

    describe "dimension safety in comparisons" do
      it "raises when comparing incompatible dimensions" do
        expect {
          4.inches > 100.grams
        }.to raise_error(FiberUnits::DimensionError)
      end

      it "raises for less than with incompatible dimensions" do
        expect {
          4.inches < 100.grams
        }.to raise_error(FiberUnits::DimensionError)
      end

      it "raises for >= with incompatible dimensions" do
        expect {
          4.inches >= 100.grams
        }.to raise_error(FiberUnits::DimensionError)
      end

      it "raises for <= with incompatible dimensions" do
        expect {
          4.inches <= 100.grams
        }.to raise_error(FiberUnits::DimensionError)
      end
    end
  end
end
