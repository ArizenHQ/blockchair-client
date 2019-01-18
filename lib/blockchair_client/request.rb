require 'pry'
module BlockchairClient
  module Request
    class Public
      attr_reader :url

      def initialize(url:)
        @url = url
      end

      def fetch_response
        parsed_response
      end

      private

      def parsed_response
        @parsed_resposne ||= JSON.parse(response)
      end

      def response
        @response ||= ::HTTParty.get(url).body
      end
    end
  end
end
