require 'spec_helper'

describe Business::BR::CEP::Providers do
  let(:cep) { '01420002' }

  context '#get_provider' do
    it 'test nil provider' do
      provider = Business::BR::CEP::Providers.get_provider('NonNon')
      expect(provider).to be_nil
    end

    it 'test exists provider load' do
      provider1 = Business::BR::CEP::Providers.get_provider('Postmon')
      provider2 = Business::BR::CEP::Providers.get_provider('RepublicaVirtual')

      expect(provider1.class).to eq Business::BR::CEP::Providers::Postmon
      expect(provider2.class).to eq Business::BR::CEP::Providers::RepublicaVirtual
    end
  end

  context 'test default providers' do
    let(:cep){ '01420002' }

    it 'test provider postmon' do
      postmon_mock
      provider1 = Business::BR::CEP::Providers.get_provider('Postmon')

      response = provider1.search_by(cep)
      expect(response[:zipcode]).to eq cep
      expect(response[:uf]).to eq 'SP'
    end
    it 'test provider republicavirtual' do
      republicavirtual_mock
      provider1 = Business::BR::CEP::Providers.get_provider('RepublicaVirtual')

      response = provider1.search_by(cep)
      expect(response[:zipcode]).to eq cep
      expect(response[:uf]).to eq 'SP'
    end
  end



end
