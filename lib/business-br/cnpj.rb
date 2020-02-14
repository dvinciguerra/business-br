# frozen_string_literal: true

module Business::BR
  class CNPJ
    def validate(cnpj)
      return false unless cnpj
      return false unless cnpj.length == 14 || cnpj.length == 18
      return false unless cnpj =~ %r{^\d{2}\.?\d{3}\.?\d{3}/?\d{4}-?\d{2}$}

      cnpj = normalize(cnpj)
      numbers = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

      first_num = 0
      second_num = 0

      12.times do |i|
        first_num += numbers[i + 1] * cnpj[i].to_i
      end

      13.times do |i|
        second_num += numbers[i] * cnpj[i].to_i
      end

      first_num %= 11
      first_num = first_num < 2 ? 0 : (11 - first_num)

      second_num %= 11
      second_num = second_num < 2 ? 0 : (11 - second_num) == 10 ? 1 : (11 - second_num)

      return false unless cnpj[12..13] == "#{first_num}#{second_num}"

      true
    end

    def normalize(cnpj)
      if cnpj =~ %r{^(\d{2})\.?(\d{3})\.?(\d{3})/?(\d{4})-?(\d{2})$}
        "#{Regexp.last_match(1)}#{Regexp.last_match(2)}#{Regexp.last_match(3)}#{Regexp.last_match(4)}#{Regexp.last_match(5)}"
      end
    end

    def format(cnpj)
      if cnpj =~ %r{^(\d{2})\.?(\d{3})\.?(\d{3})/?(\d{4})-?(\d{2})$}
        "#{Regexp.last_match(1)}.#{Regexp.last_match(2)}.#{Regexp.last_match(3)}/#{Regexp.last_match(4)}-#{Regexp.last_match(5)}"
      end
    end
  end
end
