# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'constraintClean/version'

Gem::Specification.new do |spec|
  spec.name          = "constraintClean"
  spec.version       = ConstraintClean::VERSION
  spec.authors       = ["Oleg Kohtenko"]
  spec.email         = ["kohtenko@gmail.com"]

  spec.summary       = %q{Simple gem to cleanup all your storyboard and xib files from useless constraints.}
  spec.description   = %q{Simple gem to cleanup all your storyboard and xib files from useless constraints.}
  spec.homepage      = "http://rubygems.org/gems/constraintClean"
  spec.license       = "MIT"
  spec.executables   = ["constraintClean"]

  spec.files         = Dir["lib/**/*"]
  spec.require_paths = ["lib"]
  
  spec.add_dependency "nokogiri"
  
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  
end
