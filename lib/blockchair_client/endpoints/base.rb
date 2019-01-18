module BlockchairClient
  module Endpoints
    class Base
      attr_reader :config, :param, :attributes

      def initialize(config, param)
        @config = config
        @param  = param

        set_attributes
      end

      def query
        @query ||= BlockchairClient::Request::Public.new(url: endpoint).fetch_response        
      end

      def endpoint
        raise ::BlockchairClient::NotImplementedError
      end

      private

      def method_missing(method, *args, &block)
        attributes.send(method, *args, &block)
      end
    end
  end
end
