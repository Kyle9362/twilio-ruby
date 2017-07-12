##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class Marketplace < Version
        class InstalledAddOnList < ListResource
          ##
          # Initialize the InstalledAddOnList
          # @param [Version] version Version that contains the resource
          # @return [InstalledAddOnList] InstalledAddOnList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/InstalledAddOns"
          end

          ##
          # Retrieve a single page of InstalledAddOnInstance records from the API.
          # Request is executed immediately.
          # @param [String] available_add_on_sid A 34 character string that uniquely
          #   identifies the Add-on to be installed.
          # @param [Boolean] accept_terms_of_service A boolean that reflects your decision
          #   whether to accept the Terms of Service
          # @param [Hash] configuration The JSON object representing the configuration of
          #   the new Add-on installation.
          # @param [String] unique_name The human-readable string that uniquely identifies
          #   this Add-on installation for an Account.
          # @return [InstalledAddOnInstance] Newly created InstalledAddOnInstance
          def create(available_add_on_sid: nil, accept_terms_of_service: nil, configuration: :unset, unique_name: :unset)
            data = Twilio::Values.of({
                'AvailableAddOnSid' => available_add_on_sid,
                'AcceptTermsOfService' => accept_terms_of_service,
                'Configuration' => Twilio.serialize_object(configuration),
                'UniqueName' => unique_name,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            InstalledAddOnInstance.new(
                @version,
                payload,
            )
          end

          ##
          # Lists InstalledAddOnInstance records from the API as a list.
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
          # Streams InstalledAddOnInstance records from the API as an Enumerable.
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
          # When passed a block, yields InstalledAddOnInstance records from the API.
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
          # Retrieve a single page of InstalledAddOnInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of InstalledAddOnInstance
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
            InstalledAddOnPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of InstalledAddOnInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of InstalledAddOnInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            InstalledAddOnPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Preview.Marketplace.InstalledAddOnList>'
          end
        end

        class InstalledAddOnPage < Page
          ##
          # Initialize the InstalledAddOnPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [InstalledAddOnPage] InstalledAddOnPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of InstalledAddOnInstance
          # @param [Hash] payload Payload response from the API
          # @return [InstalledAddOnInstance] InstalledAddOnInstance
          def get_instance(payload)
            InstalledAddOnInstance.new(
                @version,
                payload,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Preview.Marketplace.InstalledAddOnPage>'
          end
        end

        class InstalledAddOnContext < InstanceContext
          ##
          # Initialize the InstalledAddOnContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The Installed Add-on Sid that uniquely identifies this
          #   resource
          # @return [InstalledAddOnContext] InstalledAddOnContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/InstalledAddOns/#{@solution[:sid]}"

            # Dependents
            @extensions = nil
          end

          ##
          # Deletes the InstalledAddOnInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Fetch a InstalledAddOnInstance
          # @return [InstalledAddOnInstance] Fetched InstalledAddOnInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            InstalledAddOnInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end

          ##
          # Update the InstalledAddOnInstance
          # @param [Hash] configuration The JSON object representing the configuration of
          #   the Add-on installation.
          # @param [String] unique_name The human-readable string that uniquely identifies
          #   this Add-on installation for an Account.
          # @return [InstalledAddOnInstance] Updated InstalledAddOnInstance
          def update(configuration: :unset, unique_name: :unset)
            data = Twilio::Values.of({
                'Configuration' => Twilio.serialize_object(configuration),
                'UniqueName' => unique_name,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            InstalledAddOnInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end

          ##
          # Access the extensions
          # @return [InstalledAddOnExtensionList]
          # @return [InstalledAddOnExtensionContext] if sid was passed.
          def extensions(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return InstalledAddOnExtensionContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @extensions
              @extensions = InstalledAddOnExtensionList.new(
                  @version,
                  installed_add_on_sid: @solution[:sid],
              )
            end

            @extensions
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.Marketplace.InstalledAddOnContext #{context}>"
          end
        end

        class InstalledAddOnInstance < InstanceResource
          ##
          # Initialize the InstalledAddOnInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The Installed Add-on Sid that uniquely identifies this
          #   resource
          # @return [InstalledAddOnInstance] InstalledAddOnInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'description' => payload['description'],
                'configuration' => payload['configuration'],
                'unique_name' => payload['unique_name'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
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
          # @return [InstalledAddOnContext] InstalledAddOnContext for this InstalledAddOnInstance
          def context
            unless @instance_context
              @instance_context = InstalledAddOnContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end

          ##
          # @return [String] A string that uniquely identifies this Add-on installation
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The Account id that has installed this Add-on
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] A description of this Add-on installation
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] A short description of the Add-on functionality
          def description
            @properties['description']
          end

          ##
          # @return [Hash] The JSON object representing the current configuration
          def configuration
            @properties['configuration']
          end

          ##
          # @return [String] The string that uniquely identifies this Add-on installation
          def unique_name
            @properties['unique_name']
          end

          ##
          # @return [Time] The date this Add-on installation was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date this Add-on installation was last updated
          def date_updated
            @properties['date_updated']
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
          # Deletes the InstalledAddOnInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Fetch a InstalledAddOnInstance
          # @return [InstalledAddOnInstance] Fetched InstalledAddOnInstance
          def fetch
            context.fetch
          end

          ##
          # Update the InstalledAddOnInstance
          # @param [Hash] configuration The JSON object representing the configuration of
          #   the Add-on installation.
          # @param [String] unique_name The human-readable string that uniquely identifies
          #   this Add-on installation for an Account.
          # @return [InstalledAddOnInstance] Updated InstalledAddOnInstance
          def update(configuration: :unset, unique_name: :unset)
            context.update(
                configuration: configuration,
                unique_name: unique_name,
            )
          end

          ##
          # Access the extensions
          # @return [extensions] extensions
          def extensions
            context.extensions
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.Marketplace.InstalledAddOnInstance #{values}>"
          end
        end
      end
    end
  end
end