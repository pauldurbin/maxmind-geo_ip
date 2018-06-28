require 'active_support'
require 'faraday'
require 'json'

module Maxmind
  module GeoIp
    class << self
      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def reset
        @configuration = Configuration.new
      end

      def configure
        yield(configuration)
      end

      def client
        @client = Client.new
      end

      def method_missing(method_name, *args, &block)
        return super unless client.respond_to?(method_name)
        client.send(method_name, *args, &block)
      end
    end
  end
end

require "maxmind/geo_ip/version"
require "maxmind/geo_ip/configuration"

require "maxmind/geo_ip/client"
require "maxmind/geo_ip/models/country"
