# frozen_string_literal: true

require_relative './providers/base'
require_relative './providers/postmon'
require_relative './providers/republicavirtual'

module Business
  module BR
    class CEP
      class Providers
        def self.get_provider(provider)
          return nil unless provider

          begin
            if provider_class = eval("Business::BR::CEP::Providers::#{provider}")
              provider_class.new
            end
          rescue StandardError
            nil
          end
        end
      end # Providers
    end # CEP
  end # BR
end # Business
