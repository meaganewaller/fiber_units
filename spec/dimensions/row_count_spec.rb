RSpec.describe FiberUnits::RowCount do
  it "stores row value" do
    rows = 24.rows

    expect(rows.value).to eq(24)
  end

  it "adds rows" do
    result = 24.rows + 6.rows

    expect(result.value).to eq(30)
  end

  it "subtracts rows" do
    result = 24.rows - 6.rows

    expect(result).to eq(18.rows)
  end

  it "multiplies rows by a scalar" do
    result = 12.rows * 3

    expect(result).to eq(36.rows)
  end

  it "converts rows to an integer" do
    expect(24.rows.to_i).to eq(24)
  end

  it "compares row counts by value" do
    expect(24.rows).to be > 12.rows
    expect(24.rows).to be < 30.rows
  end

  it "does not compare equal to stitch counts with the same value" do
    expect(24.rows).not_to eq(24.stitches)
  end

  it "returns nil when compared to a different count type" do
    expect(24.rows <=> 24.stitches).to be_nil
  end

  it "raises when adding a different count type" do
    expect {
      24.rows + 24.stitches
    }.to raise_error(
      FiberUnits::DimensionError,
      "Cannot combine FiberUnits::RowCount with FiberUnits::StitchCount"
    )
  end

  it "raises when subtracting a different count type" do
    expect {
      24.rows - 24.stitches
    }.to raise_error(
      FiberUnits::DimensionError,
      "Cannot combine FiberUnits::RowCount with FiberUnits::StitchCount"
    )
  end

  it "compares row counts for equality" do
    expect(24.rows).to eq(24.rows)
    expect(24.rows).not_to eq(30.rows)
  end
end
