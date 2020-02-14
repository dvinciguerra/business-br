# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'business-br'
require 'business-br/cep'
require 'business-br/cpf'
require 'business-br/cnpj'

require 'business-br/cep/providers'

# mock
require 'webmock/rspec'

RSpec.configure do |config|
  config.color_enabled? true
  config.tty = true
  config.formatter = :documentation

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def postmon_mock
  response = '{"complemento": "de 618 a 1188 - lado par", "bairro": "Jardim Paulista", "cidade": "São Paulo", "logradouro": "Alameda Jaú", "estado_info": {"area_km2": "248.222,362", "codigo_ibge": "35", "nome": "São Paulo"}, "cep": "01420002", "cidade_info": {"area_km2": "1521,11", "codigo_ibge": "3550308"}, "estado": "SP"}'

  stub_request(:get, 'http://api.postmon.com.br/v1/cep/01420002')
    .to_return(status: 200, body: response, headers: { 'Content-type' => 'application/json' })
end

def republicavirtual_mock
  response = '{"resultado":"1","resultado_txt":"sucesso - cep completo","uf":"SP","cidade":"São Paulo","bairro":"Jardim Paulista","tipo_logradouro":"Alameda","logradouro":"Jaú"}'

  stub_request(:get, 'http://cep.republicavirtual.com.br/web_cep.php?cep=01420002&formato=json')
    .to_return(status: 200, body: response, headers: { 'Content-type' => 'application/json' })
end
