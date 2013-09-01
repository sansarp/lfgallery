# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'myspgem/version'

Gem::Specification.new do |spec|
  spec.name          = "myspgem"
  spec.version       = Myspgem::VERSION
  spec.authors       = ["spoudyal"]
  spec.email         = ["connect.subash@gmail.com"]
  spec.description   = %q{My sp gem}
  spec.summary       = %q{Summary will be written later}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
