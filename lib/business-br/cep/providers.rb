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
            provider_class = Business::BR::CEP::Providers.const_get(provider)
            provider_class.new if provider_class
          rescue StandardError
            nil
          end
        end
      end # Providers
    end # CEP
  end # BR
end # Business
