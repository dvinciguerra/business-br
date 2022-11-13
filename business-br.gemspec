# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'business-br/version'

Gem::Specification.new do |spec|
  spec.name          = 'business-br'
  spec.license       = 'MIT'
  spec.version       = Business::BR::VERSION
  spec.authors       = ['Daniel Vinciguerra']
  spec.email         = ['daniel.vinciguerra@bivee.com.br']

  spec.summary       = %w[
    Classes for validations and conversions to use in brazilian ruby projects.
  ]

  spec.description = %w[
    Business::BR is a namespace to place all validations like CPF CNPJ CEP and
    some other things to be used in a brazilian ruby project.
  ]

  spec.homepage      = 'https://github.com/dvinciguerra/business-br'

  spec.files         = `git ls-files -z`.split("\x0").reject do |filename|
    filename.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.4'

  # dependency
  spec.add_development_dependency 'bundler',    '~> 2.1'
  spec.add_development_dependency 'rake',       '~> 13.0'
  spec.add_development_dependency 'rspec',      '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.18.5'
  spec.add_development_dependency 'webmock', '~> 3.8'

  spec.add_dependency 'faraday', '~> 2.6'
  spec.add_dependency 'rest-client', '~> 2.0'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
