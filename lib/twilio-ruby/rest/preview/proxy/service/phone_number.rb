##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class Proxy < Version
        class ServiceContext < InstanceContext
          class PhoneNumberList < ListResource
            ##
            # Initialize the PhoneNumberList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Service.
            # @return [PhoneNumberList] PhoneNumberList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  service_sid: service_sid
              }
              @uri = "/Services/#{@solution[:service_sid]}/PhoneNumbers"
            end

            ##
            # Retrieve a single page of PhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] sid The phone-number Sid that uniquely identifies this resource
            # @return [PhoneNumberInstance] Newly created PhoneNumberInstance
            def create(sid: nil)
              data = Twilio::Values.of({
                  'Sid' => sid,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              PhoneNumberInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
              )
            end

            ##
            # Lists PhoneNumberInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams PhoneNumberInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields PhoneNumberInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
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
            # Retrieve a single page of PhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of PhoneNumberInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              PhoneNumberPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of PhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of PhoneNumberInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              PhoneNumberPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Proxy.PhoneNumberList>'
            end
          end

          class PhoneNumberPage < Page
            ##
            # Initialize the PhoneNumberPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] service_sid The unique SID identifier of the Service.
            # @return [PhoneNumberPage] PhoneNumberPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of PhoneNumberInstance
            # @param [Hash] payload Payload response from the API
            # @return [PhoneNumberInstance] PhoneNumberInstance
            def get_instance(payload)
              PhoneNumberInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Proxy.PhoneNumberPage>'
            end
          end

          class PhoneNumberContext < InstanceContext
            ##
            # Initialize the PhoneNumberContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @param [String] sid The phone-number Sid that uniquely identifies this resource
            # @return [PhoneNumberContext] PhoneNumberContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  service_sid: service_sid,
                  sid: sid,
              }
              @uri = "/Services/#{@solution[:service_sid]}/PhoneNumbers/#{@solution[:sid]}"
            end

            ##
            # Deletes the PhoneNumberInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Fetch a PhoneNumberInstance
            # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              PhoneNumberInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Proxy.PhoneNumberContext #{context}>"
            end
          end

          class PhoneNumberInstance < InstanceResource
            ##
            # Initialize the PhoneNumberInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The unique SID identifier of the Service.
            # @param [String] sid The phone-number Sid that uniquely identifies this resource
            # @return [PhoneNumberInstance] PhoneNumberInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'phone_number' => payload['phone_number'],
                  'country_code' => payload['country_code'],
                  'capabilities' => payload['capabilities'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'service_sid' => service_sid,
                  'sid' => sid || @properties['sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [PhoneNumberContext] PhoneNumberContext for this PhoneNumberInstance
            def context
              unless @instance_context
                @instance_context = PhoneNumberContext.new(
                    @version,
                    @params['service_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end

            ##
            # @return [String] A string that uniquely identifies this resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] Account Sid.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] Service Sid.
            def service_sid
              @properties['service_sid']
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
            # @return [String] The phone number
            def phone_number
              @properties['phone_number']
            end

            ##
            # @return [String] The ISO 3166-1 alpha-2 country code
            def country_code
              @properties['country_code']
            end

            ##
            # @return [String] Indicate if a phone can receive calls or messages
            def capabilities
              @properties['capabilities']
            end

            ##
            # @return [String] The URL of this resource.
            def url
              @properties['url']
            end

            ##
            # Deletes the PhoneNumberInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Fetch a PhoneNumberInstance
            # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Proxy.PhoneNumberInstance #{values}>"
            end
          end
        end
      end
    end
  end
end