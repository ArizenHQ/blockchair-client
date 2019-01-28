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

      def inputs(*)
        query['data'][param]['inputs']
      end

      def outputs(*)
        query['data'][param]['outputs']
      end

      def confirmations(*)
        (query['context']['state'].to_i - attributes.block_id.to_i)
      end
    end
  end
end
