# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "yard"
require "yard/rake/yardoc_task"
require "standard/rake"

# YARD Documentation tasks
begin
  namespace :doc do
    desc "Generate YARD documentation"
    YARD::Rake::YardocTask.new(:generate) do |t|
      t.files = ["lib/**/*.rb", "-", "README.md"]
      t.options = [
        "--output-dir", "doc/yard",
        "--markup", "markdown",
        "--title", "FiberUnits - Typed measurements for fiber arts",
        "--readme", "README.md"
      ]
    end

    desc "Regenerate documentation with cache reset"
    task regenerate: ["doc:clean", "doc:generate"]

    desc "Clean generated documentation"
    task :clean do
      rm_rf "doc/yard"
      rm_rf ".yardoc"
    end

    desc "Start YARD server for local documentation viewing"
    task :serve do
      sh "bundle exec yard server --reload --port 8808"
    end

    desc "Validate YARD documentation coverage"
    task :coverage do
      sh "bundle exec yard stats --list-undoc"
    end

    desc "Generate complete documentation with coverage report"
    task complete: [:generate, :coverage]
  end

  # Add shorthand aliases
  task yard: "doc:generate"
  task yard_server: "doc:serve"
  task yard_clean: "doc:clean"
rescue LoadError
  # YARD is only available in development/test environments
  # Silence this warning in production where it's not needed
end

task :default do
  Rake::Task["standard"].invoke
  Rake::Task["spec"].invoke
end
