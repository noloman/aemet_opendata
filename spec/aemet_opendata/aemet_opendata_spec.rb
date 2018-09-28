require 'spec_helper'

module AemetOpendata
  RSpec.describe AemetOpendata do
    describe '# JSON response with the city weather' do
      before :each do
        AemetOpendata.api_key = 'this-is-my-api-key'
      end

      it 'should retrieve a JSON when fetching a city', :vcr do
        VCR.use_cassette('json_response_for_city_name') do
          number = AemetOpendata.fetch_city('sevilla')
          expect(number).to_not be_nil
        end
      end

      it 'should return a nil when fetching a not existing city', :vcr do
        VCR.use_cassette('empty_json_response_for_wrong_city_name') do
          number = AemetOpendata.fetch_city('adfahsdfhasldkjfh')
          expect(number).to be_nil
        end
      end
    end
  end
end
