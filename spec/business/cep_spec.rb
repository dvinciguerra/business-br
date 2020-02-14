# frozen_string_literal: true

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
      expect(cep.valid?('88220000')).to be true
    end

    it 'does cep is not valid with valid? method too' do
      expect(cep.valid?('abcdefgh')).to be false
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
      expect(cep.region('88220000')).to eq %w[PR SC]
      expect(cep.region('13330000')).to eq ['SP']
      expect(cep.region('20241180')).to eq %w[RJ ES]

      # using dash
      expect(cep.region('20241-180')).to eq %w[RJ ES]
    end
  end

  context '#type' do
    it 'does return correct cep type' do
      expect(cep.type('88220000')).to eq 'LOGRADOURO'
    end
  end

  context '#search_by' do
    let(:api_response) do
      '{"complemento": "de 618 a 1188 - lado par", "bairro": "Jardim Paulista", "cidade": "S\u00e3o Paulo", "logradouro": "Alameda Ja\u00fa", "estado_info": {"area_km2": "248.222,362", "codigo_ibge": "35", "nome": "S\u00e3o Paulo"}, "cep": "01420002", "cidade_info": {"area_km2": "1521,11", "codigo_ibge": "3550308"}, "estado": "SP"}'
    end

    it 'getting cep informations' do
      postmon_mock

      cep = subject.search_by('01420002')

      expect(cep[:zipcode]).not_to be_nil
      expect(cep[:zipcode]).to eq '01420002'
      expect(cep[:uf]).to eq 'SP'
    end
  end
end
