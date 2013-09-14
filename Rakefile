require "rake/clean"
require "rspec/core/rake_task"
require "puppet-lint/tasks/puppet-lint"

CLOBBER.include %w(.yardoc doc pkg)
PuppetLint.configuration.ignore_paths = %w(spec/fixtures/**/*.pp)
PuppetLint.configuration.disable_autoloader_layout

task :default => ["submodules:init", :spec, :lint]

namespace :submodules do
  desc "Initialize and update submodules"
  task :init do
    sh "git submodule update --init"
  end

  desc "Pull changes from upstream"
  task :pull do
    sh "git submodule foreach git pull origin master"
  end
end

RSpec::Core::RakeTask.new :spec do |t|
  t.pattern = "spec/classes/**/*_spec.rb"
end
