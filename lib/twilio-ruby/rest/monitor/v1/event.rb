##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Monitor < Domain
      class V1 < Version
        class EventList < ListResource
          ##
          # Initialize the EventList
          # @param [Version] version Version that contains the resource
          # @return [EventList] EventList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Events"
          end

          ##
          # Lists EventInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] actor_sid The actor_sid
          # @param [String] event_type The event_type
          # @param [String] resource_sid The resource_sid
          # @param [String] source_ip_address The source_ip_address
          # @param [Date] start_date The start_date
          # @param [Date] end_date The end_date
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #                   guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
          #  the default value of 50 records.  If no page_size is                      defined
          #  but a limit is defined, stream() will attempt to read                      the
          #  limit with the most efficient page size,                      i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(actor_sid: :unset, event_type: :unset, resource_sid: :unset, source_ip_address: :unset, start_date: :unset, end_date: :unset, limit: nil, page_size: nil)
            self.stream(
                actor_sid: actor_sid,
                event_type: event_type,
                resource_sid: resource_sid,
                source_ip_address: source_ip_address,
                start_date: start_date,
                end_date: end_date,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams EventInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] actor_sid The actor_sid
          # @param [String] event_type The event_type
          # @param [String] resource_sid The resource_sid
          # @param [String] source_ip_address The source_ip_address
          # @param [Date] start_date The start_date
          # @param [Date] end_date The end_date
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to                      read the
          #  limit with the most efficient page size,                       i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(actor_sid: :unset, event_type: :unset, resource_sid: :unset, source_ip_address: :unset, start_date: :unset, end_date: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                actor_sid: actor_sid,
                event_type: event_type,
                resource_sid: resource_sid,
                source_ip_address: source_ip_address,
                start_date: start_date,
                end_date: end_date,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields EventInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] actor_sid The actor_sid
          # @param [String] event_type The event_type
          # @param [String] resource_sid The resource_sid
          # @param [String] source_ip_address The source_ip_address
          # @param [Date] start_date The start_date
          # @param [Date] end_date The end_date
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to read the
          #                       limit with the most efficient page size, i.e. min(limit, 1000)
          def each
            limits = @version.read_limits

            page = self.page(
                page_size: limits[:page_size],
            )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of EventInstance records from the API.
          # Request is executed immediately.
          # @param [String] actor_sid The actor_sid
          # @param [String] event_type The event_type
          # @param [String] resource_sid The resource_sid
          # @param [String] source_ip_address The source_ip_address
          # @param [Date] start_date The start_date
          # @param [Date] end_date The end_date
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of EventInstance
          def page(actor_sid: :unset, event_type: :unset, resource_sid: :unset, source_ip_address: :unset, start_date: :unset, end_date: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'ActorSid' => actor_sid,
                'EventType' => event_type,
                'ResourceSid' => resource_sid,
                'SourceIpAddress' => source_ip_address,
                'StartDate' => Twilio.serialize_iso8601_date(start_date),
                'EndDate' => Twilio.serialize_iso8601_date(end_date),
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            EventPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of EventInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of EventInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            EventPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Monitor.V1.EventList>'
          end
        end

        class EventPage < Page
          ##
          # Initialize the EventPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [EventPage] EventPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of EventInstance
          # @param [Hash] payload Payload response from the API
          # @return [EventInstance] EventInstance
          def get_instance(payload)
            EventInstance.new(
                @version,
                payload,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Monitor.V1.EventPage>'
          end
        end

        class EventContext < InstanceContext
          ##
          # Initialize the EventContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          # @return [EventContext] EventContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/Events/#{@solution[:sid]}"
          end

          ##
          # Fetch a EventInstance
          # @return [EventInstance] Fetched EventInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            EventInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Monitor.V1.EventContext #{context}>"
          end
        end

        class EventInstance < InstanceResource
          ##
          # Initialize the EventInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          # @return [EventInstance] EventInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'actor_sid' => payload['actor_sid'],
                'actor_type' => payload['actor_type'],
                'description' => payload['description'],
                'event_data' => payload['event_data'],
                'event_date' => Twilio.deserialize_iso8601_datetime(payload['event_date']),
                'event_type' => payload['event_type'],
                'resource_sid' => payload['resource_sid'],
                'resource_type' => payload['resource_type'],
                'sid' => payload['sid'],
                'source' => payload['source'],
                'source_ip_address' => payload['source_ip_address'],
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {
                'sid' => sid || @properties['sid'],
            }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @param [Version] version Version that contains the resource
          # @return [EventContext] EventContext for this EventInstance
          def context
            unless @instance_context
              @instance_context = EventContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end

          ##
          # @return [String] The account_sid
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The actor_sid
          def actor_sid
            @properties['actor_sid']
          end

          ##
          # @return [String] The actor_type
          def actor_type
            @properties['actor_type']
          end

          ##
          # @return [String] The description
          def description
            @properties['description']
          end

          ##
          # @return [Hash] The event_data
          def event_data
            @properties['event_data']
          end

          ##
          # @return [Time] The event_date
          def event_date
            @properties['event_date']
          end

          ##
          # @return [String] The event_type
          def event_type
            @properties['event_type']
          end

          ##
          # @return [String] The resource_sid
          def resource_sid
            @properties['resource_sid']
          end

          ##
          # @return [String] The resource_type
          def resource_type
            @properties['resource_type']
          end

          ##
          # @return [String] The sid
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The source
          def source
            @properties['source']
          end

          ##
          # @return [String] The source_ip_address
          def source_ip_address
            @properties['source_ip_address']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # @return [String] The links
          def links
            @properties['links']
          end

          ##
          # Fetch a EventInstance
          # @return [EventInstance] Fetched EventInstance
          def fetch
            context.fetch
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Monitor.V1.EventInstance #{values}>"
          end
        end
      end
    end
  end
end