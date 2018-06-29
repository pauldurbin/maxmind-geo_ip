module Maxmind
  module GeoIp
    class Country
      def initialize(params = {}, locale = 'en')
        @params = params
        @locale = locale.empty? ? 'en' : locale
      end

      def iso_code
        params.fetch("country", {})
              .fetch("iso_code", '')
      end

      def country
        params.fetch("country", {})
              .fetch("names", {})
              .fetch(locale, "")
      end

      def continent
        params.fetch("continent", {})
              .fetch("names", {})
              .fetch(locale, "")
      end

      attr_accessor :params, :locale
    end
  end
end
