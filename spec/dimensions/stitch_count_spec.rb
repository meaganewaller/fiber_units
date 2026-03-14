RSpec.describe FiberUnits::StitchCount do
  it "stores stitch value" do
    stitches = 20.stitches

    expect(stitches.value).to eq(20)
  end

  it "adds stitches" do
    result = 20.stitches + 10.stitches

    expect(result.value).to eq(30)
  end

  it "compares stitch counts for equality" do
    expect(20.stitches).to eq(20.stitches)
    expect(20.stitches).not_to eq(30.stitches)
  end
end
