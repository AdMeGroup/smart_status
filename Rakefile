$LOAD_PATH << "#{File.dirname(__FILE__)}/lib"

require 'rubygems'
require 'rubygems/package_task'

require 'smart_status/version'

spec = Gem::Specification.new do |s|
  s.name       = "smart_parser"
  s.summary    = "Retrieve S.M.A.R.T. data"
  s.description = <<-EOF
    SMARTParser is a class to parse output of `smartctl` command.
    It can also run the `smartctl` for you if you will.
  EOF
  s.version    = SMARTStatus::VERSION
  s.author     = "Timur Batyrshin"
  s.email      = "erthad@gmail.com"
  s.homepage   = "https://github.com/timurbatyrshin/smart_parser"
  s.license    = "Apache 2.0"
  s.files      = FileList["{lib,spec}/**/*"].exclude("rdoc").to_a
  s.test_files        = FileList["spec/*_spec.rb"]
  s.has_rdoc          = true
  s.extra_rdoc_files  = ['README.md', 'LICENSE']

  s.add_development_dependency "rspec"
end

Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

begin
  require 'rspec/core/rake_task'

  task :default => :spec

  desc "Run all specs in spec directory"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/unit/**/*_spec.rb'
  end
rescue LoadError
  STDERR.puts "\n*** RSpec not available. (sudo) gem install rspec to run unit tests. ***\n\n"
end
