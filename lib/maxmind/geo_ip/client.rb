require "maxmind/geo_ip/api/country"

module Maxmind
  module GeoIp
    class Client

      include Api::Country

      #
      # Creates a new instance of Maxmind::GeoIp::Client
      # 
      def initialize
        @base_path = "geoip/v#{Maxmind::GeoIp.configuration.version}"
      end

      attr_accessor :base_path

      private

      #
      # Invokes a GET request to the given URL with optional params
      #
      # @private
      # @param url [String] a relative path to the host
      # @param params [Hash] an optional hash that can be passed into the request
      # @param faraday_options [Hash] to override defaults or add anything additional to Faraday
      #
      def get(url, params = {}, faraday_options = {})
        connection(faraday_options).get(Maxmind::GeoIp.configuration.host + base_path + url, params).body
      end

      #
      # Sets up a connection with Faraday
      #
      # @private
      # @param faraday_options [Hash] to override defaults or add anything additional to Faraday
      # @returns an initialised instance of Faraday
      #
      def connection(faraday_options = {})
        @connection ||= Faraday.new(faraday_options) do |conn|
          conn.request  :basic_auth, Maxmind::GeoIp.configuration.user_id, Maxmind::GeoIp.configuration.license
          conn.adapter  Faraday.default_adapter

          conn.response :logger if Maxmind::GeoIp.configuration.debug?
        end
      end
    end
  end
end
