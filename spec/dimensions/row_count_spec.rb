RSpec.describe FiberUnits::RowCount do
  it "stores row value" do
    rows = 24.rows

    expect(rows.value).to eq(24)
  end

  it "adds rows" do
    result = 24.rows + 6.rows

    expect(result.value).to eq(30)
  end

  it "compares row counts for equality" do
    expect(24.rows).to eq(24.rows)
    expect(24.rows).not_to eq(30.rows)
  end
end
