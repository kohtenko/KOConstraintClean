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
  spec.description   = %q{Simple gem to cleanup all your storyboard and xib files from useless constraints.
Are you tired from uncountable constraints you don't need anymore? Xcode's interface builder thinks it's smart enough and keep all constraints you remove in case you want use them with `Size Classes`, but in most cases you just don't want it anymore!

If you use some constraint for `Size Classes` it will not be removed! Constraints removed only if they are really useless.
}
  spec.homepage      = "https://github.com/kohtenko/KOConstraintClean"
  spec.license       = "MIT"
  spec.executables   = ["constraintClean"]

  spec.files         = Dir["lib/**/*"]
  spec.require_paths = ["lib"]
  
  spec.add_dependency "nokogiri", '~>1.6'
  spec.add_dependency "colorize", '~>0.7'
  
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  
end
