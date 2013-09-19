$LOAD_PATH << "#{File.dirname(__FILE__)}/lib"

require 'smart_status/version'

Gem::Specification.new do |s|
  s.name       = "smart_status"
  s.summary    = "Retrieve S.M.A.R.T. data"
  s.description = <<-EOF
    SMARTParser is a class to parse output of `smartctl` command.
    It can also run the `smartctl` for you if you will.
  EOF
  s.version    = SMARTStatus::VERSION
  s.author     = "Timur Batyrshin"
  s.email      = "erthad@gmail.com"
  s.homepage   = "https://github.com/timurbatyrshin/smart_status"
  s.license    = "Apache 2.0"
  s.files      = Dir.glob("{lib,spec}/**/*")
  s.test_files        = Dir.glob("spec/*_spec.rb")
  s.has_rdoc          = true
  s.extra_rdoc_files  = ['README.md', 'LICENSE']

  s.add_development_dependency "rspec"
end
