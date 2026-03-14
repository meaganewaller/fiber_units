RSpec.describe FiberUnits::StitchCount do
  it "stores stitch value" do
    stitches = 20.stitches

    expect(stitches.value).to eq(20)
  end

  it "adds stitches" do
    result = 20.stitches + 10.stitches

    expect(result.value).to eq(30)
  end

  it "subtracts stitches" do
    result = 20.stitches - 5.stitches

    expect(result).to eq(15.stitches)
  end

  it "multiplies stitches by a scalar" do
    result = 20.stitches * 2

    expect(result).to eq(40.stitches)
  end

  it "converts stitches to an integer" do
    expect(20.stitches.to_i).to eq(20)
  end

  it "compares stitch counts by value" do
    expect(20.stitches).to be > 10.stitches
    expect(20.stitches).to be < 30.stitches
  end

  it "does not compare equal to row counts with the same value" do
    expect(20.stitches).not_to eq(20.rows)
  end

  it "returns nil when compared to a different count type" do
    expect(20.stitches <=> 20.rows).to be_nil
  end

  it "raises when adding a different count type" do
    expect {
      20.stitches + 20.rows
    }.to raise_error(
      FiberUnits::DimensionError,
      "Cannot combine FiberUnits::StitchCount with FiberUnits::RowCount"
    )
  end

  it "raises when subtracting a different count type" do
    expect {
      20.stitches - 20.rows
    }.to raise_error(
      FiberUnits::DimensionError,
      "Cannot combine FiberUnits::StitchCount with FiberUnits::RowCount"
    )
  end

  it "compares stitch counts for equality" do
    expect(20.stitches).to eq(20.stitches)
    expect(20.stitches).not_to eq(30.stitches)
  end
end
