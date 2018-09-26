module AemetOpendata
  # Configuration module
  module Configuration
    DEFAULT_API_ENDPOINT = 'https://opendata.aemet.es/'.freeze

    # Forecast API endpoint
    attr_writer :api_endpoint

    # API key
    attr_accessor :api_key

    # API endpoint
    def api_endpoint
      @api_endpoint ||= DEFAULT_API_ENDPOINT
    end

    # Yield self to be able to configure AemetOpendata with block-style configuration.
    #
    # Example:
    #
    #   AemetOpendata.configure do |configuration|
    #     configuration.api_key = 'api-key'
    #   end
    def configure
      yield self
    end
  end
end
