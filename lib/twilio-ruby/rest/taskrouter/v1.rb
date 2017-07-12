##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Taskrouter
      class V1 < Version
        ##
        # Initialize the V1 version of Taskrouter
        def initialize(domain)
          super
          @version = 'v1'
          @workspaces = nil
        end

        ##
        # @param [String] sid The sid
        # @return Twilio::REST::Taskrouter::V1::WorkspaceInstance if sid was passed.
        # @return Twilio::REST::Taskrouter::V1::WorkspaceList
        def workspaces(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @workspaces ||= WorkspaceList.new self
          else
            WorkspaceContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Taskrouter::V1>'
        end
      end
    end
  end
end