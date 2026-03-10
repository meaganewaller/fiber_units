RSpec.describe FiberUnits::Ratio do
  it "stores numerator and denominator" do
    ratio = 210.yards / 100.grams

    expect(ratio.numerator).to be_a(FiberUnits::Length)
    expect(ratio.denominator).to be_a(FiberUnits::Weight)
  end

  it "computes ratio value" do
    ratio = 210.yards / 100.grams

    expect(ratio.value.round(2)).to eq(2.10)
  end

  it "formats nicely" do
    ratio = 210.yards / 100.grams

    expect(ratio.to_s).to include("yards")
  end
end
