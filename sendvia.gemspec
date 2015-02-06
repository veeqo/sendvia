# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sendvia/version'

Gem::Specification.new do |spec|
  spec.name          = "sendvia"
  spec.version       = Sendvia::VERSION
  spec.authors       = ["Veeqo"]
  spec.email         = ["help@veeqo.com"]
  spec.summary       = %q{Sendvia gem wrapper for Sendvia REST API}
  spec.description   = %q{Sendvia gem wrapper for Sendvia REST API}
  spec.homepage      = "http://www.veeqo.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'activeresource', '~> 4.0'
  spec.add_development_dependency "rspec", "~> 3.0"
end
