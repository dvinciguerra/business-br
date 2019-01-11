require_relative './providers/base'
require_relative './providers/postmon'
require_relative './providers/republicavirtual'

module Business
  module BR
    class CEP
      class Providers

        def self.get_provider(provider)
          return nil unless provider

          provider_instance(provider)
        end

        def self.provider_instance(provider)
          return const_get(provider).new if is_provider?(provider)

          warn("Provider implementation: `#{provider}` is not found") &&
            nil
        end

        def self.is_provider?(provider)
          constants.include?(provider.to_sym)
        end

      end # Providers
    end # CEP
  end # BR
end # Business
