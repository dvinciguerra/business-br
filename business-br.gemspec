# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'business-br/version'

Gem::Specification.new do |spec|
  spec.name          = "business-br"
  spec.version       = Business::BR::VERSION
  spec.authors       = ["Daniel Vinciguerra"]
  spec.email         = ["daniel.vinciguerra@bivee.com.br"]

  spec.summary       = %q{Classes to make validations and conversions under brazilian projects.}
  spec.description   = %q{Business::BR is a namespace to put all validations like CPF, CNPJ, CEP and some other things to be used in a brazilian ruby project.}
  spec.homepage      = "https://github.com/dvinciguerra/business-br"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
