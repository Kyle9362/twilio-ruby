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
          class ConnectAppList < ListResource
            ##
            # Initialize the ConnectAppList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The unique id of the Account that created this
            #   ConnectApp.
            # @return [ConnectAppList] ConnectAppList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  account_sid: account_sid
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/ConnectApps.json"
            end

            ##
            # Lists ConnectAppInstance records from the API as a list.
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
            # Streams ConnectAppInstance records from the API as an Enumerable.
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
            # When passed a block, yields ConnectAppInstance records from the API.
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
            # Retrieve a single page of ConnectAppInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of ConnectAppInstance
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
              ConnectAppPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ConnectAppInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of ConnectAppInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              ConnectAppPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.ConnectAppList>'
            end
          end

          class ConnectAppPage < Page
            ##
            # Initialize the ConnectAppPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] account_sid The unique id of the Account that created this
            #   ConnectApp.
            # @return [ConnectAppPage] ConnectAppPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ConnectAppInstance
            # @param [Hash] payload Payload response from the API
            # @return [ConnectAppInstance] ConnectAppInstance
            def get_instance(payload)
              ConnectAppInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.ConnectAppPage>'
            end
          end

          class ConnectAppContext < InstanceContext
            ##
            # Initialize the ConnectAppContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @param [String] sid The connect-app Sid that uniquely identifies this resource
            # @return [ConnectAppContext] ConnectAppContext
            def initialize(version, account_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  account_sid: account_sid,
                  sid: sid,
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/ConnectApps/#{@solution[:sid]}.json"
            end

            ##
            # Fetch a ConnectAppInstance
            # @return [ConnectAppInstance] Fetched ConnectAppInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              ConnectAppInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Update the ConnectAppInstance
            # @param [String] authorize_redirect_url The URL the user's browser will redirect
            #   to after Twilio authenticates the user and obtains authorization for this
            #   Connect App.
            # @param [String] company_name The company name set for this Connect App.
            # @param [String] deauthorize_callback_method The HTTP method to be used when
            #   making a request to the `DeauthorizeCallbackUrl`.
            # @param [String] deauthorize_callback_url The URL to which Twilio will send a
            #   request when a user de-authorizes this Connect App.
            # @param [String] description A more detailed human readable description of the
            #   Connect App.
            # @param [String] friendly_name A human readable name for the Connect App.
            # @param [String] homepage_url The public URL where users can obtain more
            #   information about this Connect App.
            # @param [connect_app.Permission] permissions The set of permissions that your
            #   ConnectApp requests.
            # @return [ConnectAppInstance] Updated ConnectAppInstance
            def update(authorize_redirect_url: :unset, company_name: :unset, deauthorize_callback_method: :unset, deauthorize_callback_url: :unset, description: :unset, friendly_name: :unset, homepage_url: :unset, permissions: :unset)
              data = Twilio::Values.of({
                  'AuthorizeRedirectUrl' => authorize_redirect_url,
                  'CompanyName' => company_name,
                  'DeauthorizeCallbackMethod' => deauthorize_callback_method,
                  'DeauthorizeCallbackUrl' => deauthorize_callback_url,
                  'Description' => description,
                  'FriendlyName' => friendly_name,
                  'HomepageUrl' => homepage_url,
                  'Permissions' => permissions,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              ConnectAppInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.ConnectAppContext #{context}>"
            end
          end

          class ConnectAppInstance < InstanceResource
            ##
            # Initialize the ConnectAppInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The unique id of the Account that created this
            #   ConnectApp.
            # @param [String] sid The connect-app Sid that uniquely identifies this resource
            # @return [ConnectAppInstance] ConnectAppInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'authorize_redirect_url' => payload['authorize_redirect_url'],
                  'company_name' => payload['company_name'],
                  'deauthorize_callback_method' => payload['deauthorize_callback_method'],
                  'deauthorize_callback_url' => payload['deauthorize_callback_url'],
                  'description' => payload['description'],
                  'friendly_name' => payload['friendly_name'],
                  'homepage_url' => payload['homepage_url'],
                  'permissions' => payload['permissions'],
                  'sid' => payload['sid'],
                  'uri' => payload['uri'],
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
            # @return [ConnectAppContext] ConnectAppContext for this ConnectAppInstance
            def context
              unless @instance_context
                @instance_context = ConnectAppContext.new(
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
            # @return [String] URIL Twilio sends requests when users authorize
            def authorize_redirect_url
              @properties['authorize_redirect_url']
            end

            ##
            # @return [String] The company name set for this Connect App.
            def company_name
              @properties['company_name']
            end

            ##
            # @return [String] HTTP method Twilio WIll use making requests to the url
            def deauthorize_callback_method
              @properties['deauthorize_callback_method']
            end

            ##
            # @return [String] URL Twilio will send a request when a user de-authorizes this app
            def deauthorize_callback_url
              @properties['deauthorize_callback_url']
            end

            ##
            # @return [String] A more detailed human readable description
            def description
              @properties['description']
            end

            ##
            # @return [String] A human readable name for the Connect App.
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The URL users can obtain more information
            def homepage_url
              @properties['homepage_url']
            end

            ##
            # @return [connect_app.Permission] The set of permissions that your ConnectApp requests.
            def permissions
              @properties['permissions']
            end

            ##
            # @return [String] A string that uniquely identifies this connect-apps
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The URI for this resource
            def uri
              @properties['uri']
            end

            ##
            # Fetch a ConnectAppInstance
            # @return [ConnectAppInstance] Fetched ConnectAppInstance
            def fetch
              context.fetch
            end

            ##
            # Update the ConnectAppInstance
            # @param [String] authorize_redirect_url The URL the user's browser will redirect
            #   to after Twilio authenticates the user and obtains authorization for this
            #   Connect App.
            # @param [String] company_name The company name set for this Connect App.
            # @param [String] deauthorize_callback_method The HTTP method to be used when
            #   making a request to the `DeauthorizeCallbackUrl`.
            # @param [String] deauthorize_callback_url The URL to which Twilio will send a
            #   request when a user de-authorizes this Connect App.
            # @param [String] description A more detailed human readable description of the
            #   Connect App.
            # @param [String] friendly_name A human readable name for the Connect App.
            # @param [String] homepage_url The public URL where users can obtain more
            #   information about this Connect App.
            # @param [connect_app.Permission] permissions The set of permissions that your
            #   ConnectApp requests.
            # @return [ConnectAppInstance] Updated ConnectAppInstance
            def update(authorize_redirect_url: :unset, company_name: :unset, deauthorize_callback_method: :unset, deauthorize_callback_url: :unset, description: :unset, friendly_name: :unset, homepage_url: :unset, permissions: :unset)
              context.update(
                  authorize_redirect_url: authorize_redirect_url,
                  company_name: company_name,
                  deauthorize_callback_method: deauthorize_callback_method,
                  deauthorize_callback_url: deauthorize_callback_url,
                  description: description,
                  friendly_name: friendly_name,
                  homepage_url: homepage_url,
                  permissions: permissions,
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.ConnectAppInstance #{values}>"
            end
          end
        end
      end
    end
  end
end