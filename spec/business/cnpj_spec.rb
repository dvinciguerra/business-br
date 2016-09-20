require 'spec_helper'

describe Business::BR::CNPJ do
  subject(:cnpj) do
    Business::BR::CNPJ.new
  end


  context 'constructor' do
    it 'does class of Business::BR::CNPJ' do
      expect(cnpj.class.to_s).to eq 'Business::BR::CNPJ'
    end
  end

  context '#normalize' do
    it 'does this method remove dots and dashes' do
      expect(cnpj.normalize('11.111.111/0001-11')).to eq '11111111000111'
    end
  end

  context '#format' do
    it 'does this method add dots and dashes' do
      expect(cnpj.format('11111111000111')).to eq '11.111.111/0001-11'
    end
  end


  context '#validate' do
    it 'does cnpj is valid' do
      expect(cnpj.validate('11111111000111')).to be false
      expect(cnpj.validate('11111111aaa111')).to be false
      expect(cnpj.validate('58575658000101')).to be true     # random cnpj
      expect(cnpj.validate('05.832.066/0001-61')).to be true # random cnpj
    end
  end

end
