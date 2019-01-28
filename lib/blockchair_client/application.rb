module BlockchairClient
  class Application

    def initialize(options)
      set_options(options)
    end

    def transaction(tx_id)
      @transaction = ::BlockchairClient::Endpoints::Transaction.new(config, tx_id)
    end

    def transactions(*tx_ids)
      @transaction = ::BlockchairClient::Endpoints::Transactions.new(config, tx_ids)
    end

    def address(address)
      @address = ::BlockchairClient::Endpoints::Address.new(config, address)
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
