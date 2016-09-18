# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'business-br/version'

Gem::Specification.new do |spec|
  spec.name          = "business-br"
  spec.version       = Business::BR::VERSION
  spec.authors       = ["Daniel Vinciguerra"]
  spec.email         = ["daniel.vinciguerra@bivee.com.br"]

  spec.summary       = %q{This project provide classes for validations and conversions to use in brazilian ruby projects.}
  spec.description   = %q{Business::BR is a namespace to place all validations like CPF, CNPJ, CEP and some other things to be used in a brazilian ruby project.}
  spec.homepage      = "https://github.com/dvinciguerra/business-br"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
