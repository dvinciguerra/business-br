module Business
  module BR
    class CEP
      class Providers
        class Postmon < Base

          def search_by(cep)
            @zipcode = cep
            response = RestClient.get "http://api.postmon.com.br/v1/cep/#{@zipcode}"
            parse_response(response)
          end

          private
            def parse_response(response)
              json = decode_json(response)
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
