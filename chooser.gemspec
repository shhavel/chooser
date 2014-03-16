# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chooser/version'

Gem::Specification.new do |spec|
  spec.name          = "chooser"
  spec.version       = Chooser::VERSION
  spec.authors       = ["Alexander Avoyants"]
  spec.email         = ["shhavel@gmail.com"]
  spec.summary       = %q{Provides short interface for choosing elements from array of structs.}
  spec.description   = %q{Provides short interface for choosing elements from array of structs.
Filtering by equality, matching and inclusion, e.g.:
  target.choose(:street => "Main", :age => (24..30), :address => /Main/)
Filtering by instance evaluated string, e.g.:
  target.choose("age >= 24 && address =~ /^Main/")
Rejecting elements with #choose_not method, e.g.:
  target.choose_not(:street => "Main")}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
