RSpec.describe "Numeric DSL extensions" do
  describe "length helpers" do
    it "creates millimeters" do
      result = 5.millimeters

      expect(result).to be_a(FiberUnits::Length)
      expect(result.value).to eq(5)
      expect(result.unit).to eq(:millimeters)
    end

    it "creates centimeters" do
      result = 3.centimeters

      expect(result).to be_a(FiberUnits::Length)
      expect(result.value).to eq(3)
      expect(result.unit).to eq(:centimeters)
    end

    it "creates inches" do
      result = 4.inches

      expect(result).to be_a(FiberUnits::Length)
      expect(result.value).to eq(4)
      expect(result.unit).to eq(:inches)
    end

    it "creates feet" do
      result = 2.feet

      expect(result).to be_a(FiberUnits::Length)
      expect(result.value).to eq(2)
      expect(result.unit).to eq(:feet)
    end

    it "creates yards" do
      result = 7.yards

      expect(result).to be_a(FiberUnits::Length)
      expect(result.value).to eq(7)
      expect(result.unit).to eq(:yards)
    end

    it "creates meters" do
      result = 1.meters

      expect(result).to be_a(FiberUnits::Length)
      expect(result.value).to eq(1)
      expect(result.unit).to eq(:meters)
    end
  end

  describe "weight helpers" do
    it "creates grams" do
      result = 100.grams

      expect(result).to be_a(FiberUnits::Weight)
      expect(result.value).to eq(100)
      expect(result.unit).to eq(:grams)
    end

    it "creates kilograms" do
      result = 2.kilograms

      expect(result).to be_a(FiberUnits::Weight)
      expect(result.value).to eq(2)
      expect(result.unit).to eq(:kilograms)
    end

    it "creates ounces" do
      result = 8.ounces

      expect(result).to be_a(FiberUnits::Weight)
      expect(result.value).to eq(8)
      expect(result.unit).to eq(:ounces)
    end

    it "creates pounds" do
      result = 1.pounds

      expect(result).to be_a(FiberUnits::Weight)
      expect(result.value).to eq(1)
      expect(result.unit).to eq(:pounds)
    end
  end

  describe "fiber counts" do
    it "creates stitch counts" do
      result = 20.stitches

      expect(result).to be_a(FiberUnits::StitchCount)
      expect(result.value).to eq(20)
    end

    it "creates row counts" do
      result = 32.rows

      expect(result).to be_a(FiberUnits::RowCount)
      expect(result.value).to eq(32)
    end
  end
end
