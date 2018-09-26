require 'aemet_opendata/version'
require 'aemet_opendata/configuration'
require 'json'
require 'faraday'
require 'faraday-encoding'

##
# Main module
module AemetOpendata
  extend Configuration
  ##
  # Class that handles fetching of a city data from the API
  class << self
    ##
    # Fetches the 'idema' number from Aemet
    def fetch_city(city_name)
      if !AemetOpendata.api_key.nil?
        conn = Faraday.new "#{AemetOpendata.api_endpoint}", ssl: { verify: false }
        @data = conn.get "opendata/api/observacion/convencional/todas?api_key=#{AemetOpendata.api_key}"
      else
        puts 'You must first specify an API key'
        return
      end

      if city_name.nil? || city_name.empty?
        puts 'Invalid city name'
        return
      end

      response = JSON.parse(@data.body)
      parse_response(response, city_name)
    end

    private

    ##
    # Parses the API response
    def parse_response(response, city_name)
      data_connection = Faraday.new(response['datos'].to_s, ssl: { verify: false }) do |connection|
        connection.response :encoding  # use Faraday::Encoding middleware
        connection.adapter Faraday.default_adapter # net/http
      end

      json_array = JSON.parse(data_connection.get.body)
      parse_cities(city_name, json_array)
    end

    ##
    # Parses the city name from the JSON array containing the data
    def parse_cities(city_name, json_array)
      json_array.each do |key|
        city = key.to_h
        if city['ubi'].force_encoding('UTF-8').include?(city_name.upcase)
          return city['idema'].encode('UTF-8')
        end
      end
    end
  end
end
