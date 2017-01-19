require 'json'

module Business
  module BR
    class CEP
      class Providers
        class Postmon < Base

          def search_by(cep)
            @zipcode = cep
            begin
             response = RestClient.get "http://api.postmon.com.br/v1/cep/#{@zipcode}"
             return parse_response(response.body)
            rescue RestClient::ExceptionWithResponse => e
              puts e.response if ENV['BUSINESS-BR_DEBUG']
              return nil
            end
          end

          private
            def parse_response(response)
              json = JSON.parse(response, symbolize_names: true)
              create_entity(
                json, extract: {
                  zipcode: :cep, 
                  street: :logradouro,
                  complement: :complemento, 
                  neighborhood: :bairro, 
                  city: :cidade, 
                  state: "#{json[:estado_info][:nome]}", 
                  uf: :estado
                }
              )
            end

        end
      end # Providers
    end # CEP
  end # BR
end # Business
