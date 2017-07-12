##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview
      class Wireless < Version
        ##
        # Initialize the Wireless version of Preview
        def initialize(domain)
          super
          @version = 'wireless'
          @commands = nil
          @rate_plans = nil
          @sims = nil
        end

        ##
        # @param [String] sid The sid
        # @return Twilio::REST::Preview::Wireless::CommandInstance if sid was passed.
        # @return Twilio::REST::Preview::Wireless::CommandList
        def commands(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @commands ||= CommandList.new self
          else
            CommandContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid The sid
        # @return Twilio::REST::Preview::Wireless::RatePlanInstance if sid was passed.
        # @return Twilio::REST::Preview::Wireless::RatePlanList
        def rate_plans(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @rate_plans ||= RatePlanList.new self
          else
            RatePlanContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid The sid
        # @return Twilio::REST::Preview::Wireless::SimInstance if sid was passed.
        # @return Twilio::REST::Preview::Wireless::SimList
        def sims(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @sims ||= SimList.new self
          else
            SimContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Preview::Wireless>'
        end
      end
    end
  end
end