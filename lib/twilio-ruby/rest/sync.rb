##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Sync < Domain
      ##
      # Initialize the Sync Domain
      def initialize(twilio)
        super

        @base_url = 'https://sync.twilio.com'
        @host = 'sync.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of sync
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @param [String] sid The sid
      # @return Twilio::REST::Sync::V1::ServiceInstance if sid was passed.
      # @return Twilio::REST::Sync::V1::ServiceList
      def services(sid=:unset)
        self.v1.services(sid)
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::Sync>'
      end
    end
  end
end