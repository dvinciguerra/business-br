require_relative './cep/providers'

module Business::BR
  class CEP

    @@regions = [
      ['SP'],
      ['SP'],
      ['RJ', 'ES'],
      ['MG'],
      ['BA', 'SE'],
      ['PE', 'AL', 'PB', 'RN'],
      ['CE', 'PI', 'MA', 'PA', 'AM', 'AC', 'AP', 'RR'],
      ['DF', 'GO', 'TO', 'MT', 'MG', 'RO'],
      ['PR', 'SC'],
      ['RS'],
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
      "#{$1}#{$2}" if cep =~ /^(\d{5})-?(\d{3})$/
    end

    
    def format(cep)
      "#{$1}-#{$2}" if cep =~ /^(\d{5})-?(\d{3})$/
    end
    

    def region(cep)
      raise Exception.new('This cep is not valid') unless valid?(cep)
      @@regions[cep[0].to_i]
    end


    def type(cep)
      cep = normalize(cep)
      suffix = cep.slice(5, 3).to_i
      case
        when suffix < 900 then 'LOGRADOURO'
        when suffix < 960 then 'ESPECIAL'
        when suffix < 970 then 'PROMOCIONAIS'
        when suffix < 990 || suffix == 999 then 'CORREIOS'
        else 'CAIXAPOSTAL';
      end
    end

    def search_by(cep, provider:'Postmon')
      if cep_provider = Business::BR::CEP::Providers.get_provider(provider)
        return cep_provider.search_by(cep)
      end
      nil
    end

  end
end


