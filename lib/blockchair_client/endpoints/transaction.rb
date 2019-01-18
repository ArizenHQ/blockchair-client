module BlockchairClient
  module Endpoints
    class Transaction < Base
      def endpoint
        config.endpoint_url + '/transaction/' + param
      end

      def set_attributes
        @attributes ||= OpenStruct.new(query['data'][param]['transaction'])
      end

      def hash
        attributes[:hash]
      end
    end
  end
end
