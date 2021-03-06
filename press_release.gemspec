# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'press_release/version'

Gem::Specification.new do |spec|
  spec.name          = "press_release"
  spec.version       = PressRelease::VERSION
  spec.authors       = ["Global Calipha"]
  spec.email         = ["globalcalipha@gmail.com"]
  spec.description   = %q{Translate your message into 60+ languages.}
  spec.summary       = %q{Translate your message into 60+ languages.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "rest-client"
end
