# frozen_string_literal: true

require "bundler/setup"

require "simplecov"
require "simplecov_json_formatter"
require "simplecov-cobertura"
SimpleCov.start do
  command_name "Job #{ENV["GITHUB_RUN_NUMBER"]}" if ENV["GITHUB_RUN_NUMBER"]

  SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::JSONFormatter,
    SimpleCov::Formatter::CoberturaFormatter
  ])

  track_files "/lib/**/*.rb"
  enable_coverage :branch
  enable_coverage_for_eval
end

require "fiber_units"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.order = :random

  config.formatter = (config.files_to_run.size > 1) ? :progress : :documentation

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
