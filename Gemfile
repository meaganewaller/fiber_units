# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in yarn_skein.gemspec
gemspec

group :development, :test do
  gem "irb", "~> 1.4.1" if RUBY_VERSION >= "2.6" # byexample needs a specific irb version
  gem "benchmark"
  gem "standard", "~> 1.3"
  gem "rspec", "~> 3.0"
  gem "yard"
  gem "yard-doctest"
  gem "rake"
  gem "webrick" # For YARD on Ruby 3.0+
  gem "redcarpet" # For YARD markdown support
  gem "rdoc" # For YARD rdoc support
end

group :test do
  gem "simplecov", "~> 0.22.0", require: false if RUBY_VERSION >= "2.5"
  gem "simplecov-cobertura"
end
