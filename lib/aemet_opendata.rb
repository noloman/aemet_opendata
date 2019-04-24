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
        connection.response :encoding # use Faraday::Encoding middleware
        connection.adapter Faraday.default_adapter # net/http
      end

      json_array = JSON.parse(data_connection.get.body)
      city_idema = parse_and_fetch_city_idema(city_name, json_array)
      unless city_idema.nil?
        ##
        # Now we have to fetch the conventional observation weather from the idema.
        # It should return a hash containing JSON objects of the weather in
        # the place defined by the idema in the following 24 hours.
        city_weather_url = "#{AemetOpendata.api_endpoint}/opendata/api/observacion/convencional/datos/estacion/#{city_idema}?api_key=#{AemetOpendata.api_key}"
        get_city_weather_from_idema(city_weather_url)
      end
    end

    ##
    # Parses the city name from the JSON array containing the data
    def parse_and_fetch_city_idema(city_name, json_array)
      res = nil
      json_array.each do |key|
        city = key.to_h
        if city['ubi'].force_encoding('UTF-8').include?(city_name.upcase)
          res = city['idema'].encode('UTF-8')
        end
      end
      res
    end

    ##
    # Retrieves a hash with the city weather for the next 24 hours.
    def get_city_weather_from_idema(data_url)
      city_connection = Faraday.new(data_url, ssl: { verify: false }) do |connection|
        connection.response :encoding # use Faraday::Encoding middleware
        connection.adapter Faraday.default_adapter # net/http
      end

      conn_hash = JSON.parse(city_connection.get.body)
      datos_url = conn_hash['datos']
      datos_connection = Faraday.new(datos_url, ssl: { verify: false }) do |connection|
        connection.response :encoding # use Faraday::Encoding middleware
        connection.adapter Faraday.default_adapter # net/http
      end
      JSON.parse(datos_connection.get.body)
    end
  end
end
