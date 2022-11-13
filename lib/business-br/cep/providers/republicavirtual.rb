# frozen_string_literal: true

module Business
  module BR
    class CEP
      class Providers
        class RepublicaVirtual < Base
          def search_by(cep)
            @zipcode = cep
            response = Faraday.get("http://cep.republicavirtual.com.br/web_cep.php?cep=#{@zipcode}&formato=json")
              parse_response(response.body)
          rescue Faraday::ClientError => e
            puts e.response if ENV['BUSINESS-BR_DEBUG']
            nil
          end

          private

          def parse_response(response)
            json = decode_json(response)
            create_entity(
              json, extract: {
                zipcode: @zipcode,
                street: "#{json[:tipo_logradouro]} #{json[:logradouro]}",
                complement: '',
                neighborhood: :bairro,
                city: :cidade,
                state: :uf,
                uf: :uf
              }
            )
          end
        end
      end # Providers
    end # CEP
  end # BR
end # Business
