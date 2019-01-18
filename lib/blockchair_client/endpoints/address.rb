module BlockchairClient
  module Endpoints
    class Address < Base
      def endpoint
        config.endpoint_url + '/address/' + param
      end

      def attributes
        @attributes ||= OpenStruct.new(query['data'][param]['address'])
      end
    end
  end
end
