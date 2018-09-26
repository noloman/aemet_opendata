require 'spec_helper'

RSpec.describe AemetOpendata::Configuration do
  describe '.configure' do
    it 'should have default api key and endpoint' do
      AemetOpendata.configure do |conf|
        expect(conf.api_endpoint).to eq(AemetOpendata::Configuration::DEFAULT_API_ENDPOINT)
        expect(conf.api_key).to be_nil
      end
    end
  end
end
