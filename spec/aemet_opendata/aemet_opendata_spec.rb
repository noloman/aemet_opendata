require 'spec_helper'

module AemetOpendata
  RSpec.describe AemetOpendata do
    it 'has a not nil version number' do
      expect(AemetOpendata::VERSION).not_to be nil
    end

    it 'has a version number' do
      expect(AemetOpendata::VERSION).to eq('0.0.2')
    end

    describe '# idema number from a city' do
      before :each do
        AemetOpendata.api_key = 'this-is-my-api-key'
      end

      it 'should show a number when fetching a city', :vcr do
        VCR.use_cassette('number_for_city_name') do
          number = AemetOpendata.fetch_city('sevilla')
          expect(number).to_not be_nil
        end
      end

      it 'should return a nil when fetching a not existing city', :vcr do
        VCR.use_cassette('number_for_wrong_city_name') do
          number = AemetOpendata.fetch_city('adfahsdfhasldkjfh')
          expect(number).to be_nil
        end
      end
    end
  end
end
