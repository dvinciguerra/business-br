module Business::BR
  class CPF

    @@black_list = %w[
      00000000000 
      11111111111 
      22222222222 
      33333333333 
      44444444444 
      55555555555 
      66666666666 
      77777777777 
      88888888888 
      99999999999
    ]

    def validate(cpf)
      return false unless cpf
      return false unless cpf.length == 11 || cpf.length == 14
      return false unless cpf =~ /^\d{3}\.?\d{3}\.?\d{3}-?\d{2}$/

      cpf = normalize(cpf)
      return false unless not @@black_list.include? cpf

      first_num = 0
      second_num = 0

      9.times do |i| 
        first_num += (10 - i) * cpf[i].to_i
      end

      10.times do |i|
        second_num += (11 - i) * cpf[i].to_i
      end

      first_num = (first_num * 10) % 11
      first_num = 0 if first_num == 10

      second_num = (second_num * 10) % 11
      second_num = 0 if second_num == 10

      return false unless "#{first_num}#{second_num}" == cpf[9..10]

      true
    end


    def normalize(cpf)
      "#{$1}#{$2}#{$3}#{$4}" if cpf =~ /^(\d{3})\.?(\d{3})\.?(\d{3})-?(\d{2})$/
    end


    def format(cpf)
      "#{$1}.#{$2}.#{$3}-#{$4}" if cpf =~ /^(\d{3})\.?(\d{3})\.?(\d{3})-?(\d{2})$/
    end

  end
end
