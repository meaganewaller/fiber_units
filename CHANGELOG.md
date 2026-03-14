## [Unreleased]

### Added
- Equality operator for `StitchCount` class

## [0.2.0] - 2026-03-09

### Added
- Comparison operators (`<`, `>`, `<=`, `>=`, `==`, `!=`) for `Measurement` class
- Support for cross-unit comparisons (e.g., `4.inches > 10.centimeters`)
- Dimension safety checks in comparisons (raises error for incompatible units)

## [0.1.0] - 2026-03-09

### Added
- Core `Measurement` class for representing and manipulating fiber unit measurements
- Dimension types: `Length`, `Weight`, `RowCount`, and `StitchCount`
- Conversion framework with `LengthConversion` and `WeightConversion` support
- Unit operations: addition, subtraction, multiplication, and division
- `Ratio` class for expressing relationships between measurements
- Numeric extensions for DSL-style usage (e.g., `10.cm`, `100.grams`)
- Comprehensive RBS type signatures for type checking support
- Initial release
