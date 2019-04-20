module BlockchairClient

  # Access point for the gem configurations.
  #
  # @return [BlockchairClient::Configuration] a configuration instance.
  def self.config
    @config ||= Configuration.new
  end

  # Configure hook used in the gem initializer. Convinient way to set all the
  # gem configurations.
  #
  # example:
  #   BlockchairClient.configure do |config|
  #     config.verbose_mode = true
  #   end
  #
  # @return [void]
  def self.configure
    yield config if block_given?
  end

  class Configuration

    attr_accessor :endpoint_url, :currency

    def set_compulsory_options
      @endpoint_url ||= 'https://api.blockchair.com/litecoin/dashboards'
    rescue ::KeyError
      fail MissingEndpointUrl
    end
  end
end
