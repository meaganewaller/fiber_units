RSpec.describe FiberUnits::Conversions::WeightConversion do
  it "converts grams to ounces" do
    result = described_class.convert(100, :grams, :ounces)

    expect(result.round(3)).to eq(3.527)
  end

  it "converts pounds to kilograms" do
    result = described_class.convert(1, :pounds, :kilograms)

    expect(result.round(4)).to eq(0.4536)
  end

  it "raises error for invalid unit" do
    expect {
      described_class.convert(1, :rocks, :grams)
    }.to raise_error(FiberUnits::InvalidUnitError)
  end
end
