RSpec.describe FiberUnits::Weight do
  describe "conversion" do
    it "converts grams to ounces" do
      result = 100.grams.to(:ounces)

      expect(result.value.round(3)).to eq(3.527)
    end

    it "converts pounds to kilograms" do
      result = 1.pounds.to(:kilograms)

      expect(result.value.round(4)).to eq(0.4536)
    end
  end

  describe "arithmetic" do
    it "adds weights" do
      result = 100.grams + 50.grams

      expect(result.value).to eq(150)
    end
  end
end
