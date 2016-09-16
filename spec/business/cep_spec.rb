require 'spec_helper'

describe Business::BR::CEP do
  subject(:cep) do
    Business::BR::CEP.new
  end


  context 'constructor' do
    it 'does class of Business::BR::CEP' do
      expect(cep.class.to_s).to eq 'Business::BR::CEP'
    end
  end


  context '#validate' do
    it 'does cep is valid without dash' do
      expect(cep.validate('88220000')).to be true
    end

    it 'does cep is valid with dash' do
      expect(cep.validate('88220-000')).to be true
    end

    it 'does cep is not valid with less digits' do
      expect(cep.validate('88220')).to be false
    end

    it 'does cep is not valid with letters' do
      expect(cep.validate('abcde-fgh')).to be false
    end

    it 'does cep is valid with valid? method too' do
      expect(cep.valid? '88220000').to be true
    end

    it 'does cep is not valid with valid? method too' do
      expect(cep.valid? 'abcdefgh').to be false
    end
  end


  context '#normalize' do
    it 'does this method remove dash' do
      expect(cep.normalize('12345-678')).to eq '12345678'
    end
  end


  context '#format' do
    it 'does this method add dash' do
      expect(cep.format('12345678')).to eq '12345-678'
    end
  end


  context '#region' do
    it 'does return correct cep region' do
      expect(cep.region('88220000')).to eq ['PR', 'SC']
      expect(cep.region('13330000')).to eq ['SP']
      expect(cep.region('20241180')).to eq ['RJ', 'ES']

      # using dash
      expect(cep.region('20241-180')).to eq ['RJ', 'ES']
    end
  end


  context '#type' do
    it 'does return correct cep type' do
      expect(cep.type('88220000')).to eq 'LOGRADOURO'
    end
  end

end
