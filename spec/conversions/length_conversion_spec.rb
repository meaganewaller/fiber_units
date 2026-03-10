RSpec.describe FiberUnits::Conversions::LengthConversion do
  it "converts yards to meters" do
    result = described_class.convert(210, :yards, :meters)

    expect(result.round(3)).to eq(192.024)
  end

  it "converts feet to centimeters" do
    result = described_class.convert(1, :feet, :centimeters)

    expect(result.round(2)).to eq(30.48)
  end

  it "raises error for invalid unit" do
    expect {
      described_class.convert(1, :bananas, :meters)
    }.to raise_error(FiberUnits::InvalidUnitError)
  end
end
