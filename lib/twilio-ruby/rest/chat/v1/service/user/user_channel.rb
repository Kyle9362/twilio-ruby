##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Chat < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class UserContext < InstanceContext
            class UserChannelList < ListResource
              ##
              # Initialize the UserChannelList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The service_sid
              # @param [String] user_sid The sid
              # @return [UserChannelList] UserChannelList
              def initialize(version, service_sid: nil, user_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    service_sid: service_sid,
                    user_sid: user_sid
                }
                @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:user_sid]}/Channels"
              end

              ##
              # Lists UserChannelInstance records from the API as a list.
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
              # Streams UserChannelInstance records from the API as an Enumerable.
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
              # When passed a block, yields UserChannelInstance records from the API.
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
              # Retrieve a single page of UserChannelInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of UserChannelInstance
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
                UserChannelPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of UserChannelInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of UserChannelInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                UserChannelPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Chat.V1.UserChannelList>'
              end
            end

            class UserChannelPage < Page
              ##
              # Initialize the UserChannelPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] service_sid The service_sid
              # @param [String] user_sid The sid
              # @return [UserChannelPage] UserChannelPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of UserChannelInstance
              # @param [Hash] payload Payload response from the API
              # @return [UserChannelInstance] UserChannelInstance
              def get_instance(payload)
                UserChannelInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    user_sid: @solution[:user_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Chat.V1.UserChannelPage>'
              end
            end

            class UserChannelInstance < InstanceResource
              ##
              # Initialize the UserChannelInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The service_sid
              # @param [String] user_sid The sid
              # @return [UserChannelInstance] UserChannelInstance
              def initialize(version, payload, service_sid: nil, user_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'channel_sid' => payload['channel_sid'],
                    'member_sid' => payload['member_sid'],
                    'status' => payload['status'],
                    'last_consumed_message_index' => payload['last_consumed_message_index'] == nil ? payload['last_consumed_message_index'] : payload['last_consumed_message_index'].to_i,
                    'unread_messages_count' => payload['unread_messages_count'] == nil ? payload['unread_messages_count'] : payload['unread_messages_count'].to_i,
                    'links' => payload['links'],
                }
              end

              ##
              # @return [String] The account_sid
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The service_sid
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The channel_sid
              def channel_sid
                @properties['channel_sid']
              end

              ##
              # @return [String] The member_sid
              def member_sid
                @properties['member_sid']
              end

              ##
              # @return [user_channel.ChannelStatus] The status
              def status
                @properties['status']
              end

              ##
              # @return [String] The last_consumed_message_index
              def last_consumed_message_index
                @properties['last_consumed_message_index']
              end

              ##
              # @return [String] The unread_messages_count
              def unread_messages_count
                @properties['unread_messages_count']
              end

              ##
              # @return [String] The links
              def links
                @properties['links']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Chat.V1.UserChannelInstance>"
              end
            end
          end
        end
      end
    end
  end
end