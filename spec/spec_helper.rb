$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

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
  response = '{"complemento": "de 618 a 1188 - lado par", "bairro": "Jardim Paulista", "cidade": "S\u00e3o Paulo", "logradouro": "Alameda Ja\u00fa", "estado_info": {"area_km2": "248.222,362", "codigo_ibge": "35", "nome": "S\u00e3o Paulo"}, "cep": "01420002", "cidade_info": {"area_km2": "1521,11", "codigo_ibge": "3550308"}, "estado": "SP"}'

  stub_request(:get, "http://api.postmon.com.br/v1/cep/01420002").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip, deflate', 'Host'=>'api.postmon.com.br', 'User-Agent'=>'rest-client/2.0.0 (linux-gnu x86_64) ruby/2.3.1p112'}).
    to_return(:status => 200, :body => response, :headers => {})
end

def republicavirtual_mock
  response = '{"resultado":"1","resultado_txt":"sucesso - cep completo","uf":"SP","cidade":"S\u00e3o Paulo","bairro":"Jardim Paulista","tipo_logradouro":"Alameda","logradouro":"Ja\u00fa"}'

  stub_request(:get, "http://cep.republicavirtual.com.br/web_cep.php?cep=01420002&formato=json").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip, deflate', 'Host'=>'cep.republicavirtual.com.br', 'User-Agent'=>'rest-client/2.0.0 (linux-gnu x86_64) ruby/2.3.1p112'}).
    to_return(:status => 200, :body => response, :headers => {})
end  

require 'business-br'
require 'business-br/cep'
require 'business-br/cpf'
require 'business-br/cnpj'

require 'business-br/cep/providers'
