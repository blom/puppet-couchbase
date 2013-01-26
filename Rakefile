require "rake/clean"
require "rspec/core/rake_task"
require "puppet-lint/tasks/puppet-lint"

CLOBBER.include %w(.yardoc doc pkg)
PuppetLint.configuration.ignore_paths = %w(spec/fixtures/**/*.pp)

task :default => [:submodules, :spec, :lint]

task :submodules do
  sh "git submodule update --init"
end

RSpec::Core::RakeTask.new :spec do |t|
  t.pattern = "spec/classes/**/*_spec.rb"
end
