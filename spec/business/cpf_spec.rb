require 'spec_helper'

describe Business::BR::CPF do
  subject(:cpf) do
    Business::BR::CPF.new
  end


  context 'constructor' do
    it 'does class of Business::BR::CPF' do
      expect(cpf.class.to_s).to eq 'Business::BR::CPF'
    end
  end

  context '#normalize' do
    it 'does this method remove dots and dashes' do
      expect(cpf.normalize('111.111.111-11')).to eq '11111111111'
    end
  end

  context '#format' do
    it 'does this method add dots and dashes' do
      expect(cpf.format('11111111111')).to eq '111.111.111-11'
    end
  end


  context '#validate' do
    it 'does cpf is valid' do
      expect(cpf.validate('111a1111111')).to be false
      expect(cpf.validate('11111111111')).to be false
      expect(cpf.validate('98265125321')).to be true
      expect(cpf.validate('178.863.670-81')).to be true
    end
  end

end
