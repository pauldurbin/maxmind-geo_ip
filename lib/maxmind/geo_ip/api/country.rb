module Maxmind
  module GeoIp
    module Api
      module Country
        #
        # Returns country information based on a provided IP address
        #
        # @param ip [String]
        # @param faraday_options [Hash] to override defaults or add anything additional to Faraday
        # @returns [String] country name
        #
        def lookup_country_by_ip(ip, faraday_options = {})
          Maxmind::GeoIp::Country.new(
            JSON.parse(get("/country/#{ip}", {}, faraday_options))
          ).country
        end

        #
        # Returns continent information based on a provided IP address
        #
        # @param ip [String]
        # @param faraday_options [Hash] to override defaults or add anything additional to Faraday
        # @returns [String] continent name
        #
        def lookup_continent_by_ip(ip, faraday_options = {})
          Maxmind::GeoIp::Country.new(
            JSON.parse(get("/country/#{ip}", {}, faraday_options))
          ).continent
        end
      end
    end
  end
end
