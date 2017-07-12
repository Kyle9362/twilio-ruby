##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Accounts
      class V1 < Version
        ##
        # Initialize the V1 version of Accounts
        def initialize(domain)
          super
          @version = 'v1'
          @credentials = nil
        end

        ##
        # @return Twilio::REST::Accounts::V1::CredentialInstance
        def credentials(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @credentials ||= CredentialList.new self
          else
            CredentialContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Accounts::V1>'
        end
      end
    end
  end
end