# frozen_string_literal: true

require 'json'
require 'faraday'

module Business
  module BR
    class CEP
      class Providers
        class Base
          attr_accessor :zipcode

          protected

          # response entity
          def create_entity(json, extract: {})
            json = json.class == String ? decode_json(json) : json

            # getting informations
            extracted = {}
            extract.each do |key, value|
              extracted[key] = (value.class == Symbol ? json[value] : value)
            end

            extracted
          end

          # decode json
          def decode_json(str)
            JSON.parse(str, symbolize_names: true)
          end
        end
      end # Providers
    end # CEP
  end # BR
end # Business
