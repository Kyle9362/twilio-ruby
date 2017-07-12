##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class ConferenceList < ListResource
            ##
            # Initialize the ConferenceList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The unique id of the Account] responsible for
            #   creating this conference.
            # @return [ConferenceList] ConferenceList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  account_sid: account_sid
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/Conferences.json"
            end

            ##
            # Lists ConferenceInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Time] date_created_before Filter by date created
            # @param [Time] date_created Filter by date created
            # @param [Time] date_created_after: Filter by date created
            # @param [Time] date_updated_before Filter by date updated
            # @param [Time] date_updated Filter by date updated
            # @param [Time] date_updated_after: Filter by date updated
            # @param [String] friendly_name Only show results who's friendly name exactly
            #   matches the string
            # @param [conference.Status] status A string representing the status of the
            #   conference. May be `init`, `in-progress`, or `completed`.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(date_created_before: :unset, date_created: :unset, date_created_after: :unset, date_updated_before: :unset, date_updated: :unset, date_updated_after: :unset, friendly_name: :unset, status: :unset, limit: nil, page_size: nil)
              self.stream(
                  date_created_before: date_created_before,
                  date_created: date_created,
                  date_created_after: date_created_after,
                  date_updated_before: date_updated_before,
                  date_updated: date_updated,
                  date_updated_after: date_updated_after,
                  friendly_name: friendly_name,
                  status: status,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams ConferenceInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Time] date_created_before Filter by date created
            # @param [Time] date_created Filter by date created
            # @param [Time] date_created_after: Filter by date created
            # @param [Time] date_updated_before Filter by date updated
            # @param [Time] date_updated Filter by date updated
            # @param [Time] date_updated_after: Filter by date updated
            # @param [String] friendly_name Only show results who's friendly name exactly
            #   matches the string
            # @param [conference.Status] status A string representing the status of the
            #   conference. May be `init`, `in-progress`, or `completed`.
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(date_created_before: :unset, date_created: :unset, date_created_after: :unset, date_updated_before: :unset, date_updated: :unset, date_updated_after: :unset, friendly_name: :unset, status: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  date_created_before: date_created_before,
                  date_created: date_created,
                  date_created_after: date_created_after,
                  date_updated_before: date_updated_before,
                  date_updated: date_updated,
                  date_updated_after: date_updated_after,
                  friendly_name: friendly_name,
                  status: status,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields ConferenceInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Time] date_created_before Filter by date created
            # @param [Time] date_created Filter by date created
            # @param [Time] date_created_after: Filter by date created
            # @param [Time] date_updated_before Filter by date updated
            # @param [Time] date_updated Filter by date updated
            # @param [Time] date_updated_after: Filter by date updated
            # @param [String] friendly_name Only show results who's friendly name exactly
            #   matches the string
            # @param [conference.Status] status A string representing the status of the
            #   conference. May be `init`, `in-progress`, or `completed`.
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
            # Retrieve a single page of ConferenceInstance records from the API.
            # Request is executed immediately.
            # @param [Time] date_created_before Filter by date created
            # @param [Time] date_created Filter by date created
            # @param [Time] date_created_after: Filter by date created
            # @param [Time] date_updated_before Filter by date updated
            # @param [Time] date_updated Filter by date updated
            # @param [Time] date_updated_after: Filter by date updated
            # @param [String] friendly_name Only show results who's friendly name exactly
            #   matches the string
            # @param [conference.Status] status A string representing the status of the
            #   conference. May be `init`, `in-progress`, or `completed`.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of ConferenceInstance
            def page(date_created_before: :unset, date_created: :unset, date_created_after: :unset, date_updated_before: :unset, date_updated: :unset, date_updated_after: :unset, friendly_name: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'DateCreated<' => Twilio.serialize_iso8601_date(date_created_before),
                  'DateCreated' => Twilio.serialize_iso8601_date(date_created),
                  'DateCreated>' => Twilio.serialize_iso8601_date(date_created_after),
                  'DateUpdated<' => Twilio.serialize_iso8601_date(date_updated_before),
                  'DateUpdated' => Twilio.serialize_iso8601_date(date_updated),
                  'DateUpdated>' => Twilio.serialize_iso8601_date(date_updated_after),
                  'FriendlyName' => friendly_name,
                  'Status' => status,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              ConferencePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ConferenceInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of ConferenceInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              ConferencePage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.ConferenceList>'
            end
          end

          class ConferencePage < Page
            ##
            # Initialize the ConferencePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] account_sid The unique id of the Account] responsible for
            #   creating this conference.
            # @return [ConferencePage] ConferencePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ConferenceInstance
            # @param [Hash] payload Payload response from the API
            # @return [ConferenceInstance] ConferenceInstance
            def get_instance(payload)
              ConferenceInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.ConferencePage>'
            end
          end

          class ConferenceContext < InstanceContext
            ##
            # Initialize the ConferenceContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @param [String] sid The conference Sid that uniquely identifies this resource
            # @return [ConferenceContext] ConferenceContext
            def initialize(version, account_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  account_sid: account_sid,
                  sid: sid,
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/Conferences/#{@solution[:sid]}.json"

              # Dependents
              @participants = nil
            end

            ##
            # Fetch a ConferenceInstance
            # @return [ConferenceInstance] Fetched ConferenceInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              ConferenceInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Update the ConferenceInstance
            # @param [conference.UpdateStatus] status The status
            # @return [ConferenceInstance] Updated ConferenceInstance
            def update(status: :unset)
              data = Twilio::Values.of({
                  'Status' => status,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              ConferenceInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Access the participants
            # @return [ParticipantList]
            # @return [ParticipantContext] if call_sid was passed.
            def participants(call_sid=:unset)
              raise ArgumentError, 'call_sid cannot be nil' if call_sid.nil?

              if call_sid != :unset
                return ParticipantContext.new(
                    @version,
                    @solution[:account_sid],
                    @solution[:sid],
                    call_sid,
                )
              end

              unless @participants
                @participants = ParticipantList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    conference_sid: @solution[:sid],
                )
              end

              @participants
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.ConferenceContext #{context}>"
            end
          end

          class ConferenceInstance < InstanceResource
            ##
            # Initialize the ConferenceInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The unique id of the Account] responsible for
            #   creating this conference.
            # @param [String] sid The conference Sid that uniquely identifies this resource
            # @return [ConferenceInstance] ConferenceInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'api_version' => payload['api_version'],
                  'friendly_name' => payload['friendly_name'],
                  'region' => payload['region'],
                  'sid' => payload['sid'],
                  'status' => payload['status'],
                  'uri' => payload['uri'],
                  'subresource_uris' => payload['subresource_uris'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'account_sid' => account_sid,
                  'sid' => sid || @properties['sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [ConferenceContext] ConferenceContext for this ConferenceInstance
            def context
              unless @instance_context
                @instance_context = ConferenceContext.new(
                    @version,
                    @params['account_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end

            ##
            # @return [String] The unique sid that identifies this account
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [Time] The date this resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date this resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The api_version
            def api_version
              @properties['api_version']
            end

            ##
            # @return [String] A human readable description of this resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The region
            def region
              @properties['region']
            end

            ##
            # @return [String] A string that uniquely identifies this conference
            def sid
              @properties['sid']
            end

            ##
            # @return [participant.Status] The status of the conference
            def status
              @properties['status']
            end

            ##
            # @return [String] The URI for this resource
            def uri
              @properties['uri']
            end

            ##
            # @return [String] The subresource_uris
            def subresource_uris
              @properties['subresource_uris']
            end

            ##
            # Fetch a ConferenceInstance
            # @return [ConferenceInstance] Fetched ConferenceInstance
            def fetch
              context.fetch
            end

            ##
            # Update the ConferenceInstance
            # @param [conference.UpdateStatus] status The status
            # @return [ConferenceInstance] Updated ConferenceInstance
            def update(status: :unset)
              context.update(
                  status: status,
              )
            end

            ##
            # Access the participants
            # @return [participants] participants
            def participants
              context.participants
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.ConferenceInstance #{values}>"
            end
          end
        end
      end
    end
  end
end