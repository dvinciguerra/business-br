$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

RSpec.configure do |config|
  config.color_enabled? true
  config.tty = true
  config.formatter = :documentation

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require 'business-br'
require 'business-br/cep'
require 'business-br/cpf'
require 'business-br/cnpj'
