module Maxmind
  module GeoIp
    class Configuration
      def initialize
        @host = ''
        @license = ''
        @user_id = ''
        @version = '2.1'
        @debug = false
      end

      def to_hash
        {
          host: host,
          license: license,
          user_id: user_id,
          version: version,
          debug: debug
        }
      end

      def debug?
        debug == true
      end

      attr_accessor :host, :license, :user_id, :version, :debug
    end
  end
end
