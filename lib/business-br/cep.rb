# frozen_string_literal: true

require_relative './cep/providers'

module Business::BR
  class CEP
    @@regions = [
      ['SP'],
      ['SP'],
      %w[RJ ES],
      ['MG'],
      %w[BA SE],
      %w[PE AL PB RN],
      %w[CE PI MA PA AM AC AP RR],
      %w[DF GO TO MT MG RO],
      %w[PR SC],
      ['RS']
    ]

    def initialize(opts = {})
      @opts = opts || {}
    end

    def validate(cep)
      return false unless cep =~ /^\d{5}-?\d{3}$/
      return false unless cep.length == 8 || cep.length == 9

      true
    end

    def valid?(cep)
      validate(cep)
    end

    def normalize(cep)
      if cep =~ /^(\d{5})-?(\d{3})$/
        "#{Regexp.last_match(1)}#{Regexp.last_match(2)}"
      end
    end

    def format(cep)
      if cep =~ /^(\d{5})-?(\d{3})$/
        "#{Regexp.last_match(1)}-#{Regexp.last_match(2)}"
      end
    end

    def region(cep)
      raise Exception, 'This cep is not valid' unless valid?(cep)

      @@regions[cep[0].to_i]
    end

    def type(cep)
      cep = normalize(cep)
      suffix = cep.slice(5, 3).to_i
      if suffix < 900 then 'LOGRADOURO'
      elsif suffix < 960 then 'ESPECIAL'
      elsif suffix < 970 then 'PROMOCIONAIS'
      elsif suffix < 990 || suffix == 999 then 'CORREIOS'
      else 'CAIXAPOSTAL'
      end
    end

    def search_by(cep, provider: 'Postmon')
      if cep_provider = Business::BR::CEP::Providers.get_provider(provider)
        return cep_provider.search_by(cep)
      end

      nil
    end
  end
end
