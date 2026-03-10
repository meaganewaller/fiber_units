RSpec.describe FiberUnits::RowCount do
  it "stores row value" do
    rows = 24.rows

    expect(rows.value).to eq(24)
  end

  it "adds rows" do
    result = 24.rows + 6.rows

    expect(result.value).to eq(30)
  end
end
