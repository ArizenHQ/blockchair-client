module BlockchairClient
  class Application

    def initialize(options)
      set_options(options)
    end

    def public
      @post   ||= BlockchairClient::Requests::Public.new(config)
    end

    def private
      @post   ||= BlockchairClient::Requests::Private.new(config)
    end

    def config
      @config ||= ::BlockchairClient.config.dup
    end

    private

    def set_options(options)
      options.each { |key, value| config.send("#{key}=", value) }
      config.set_compulsory_options
    end
  end
end
