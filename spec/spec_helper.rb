$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'blockchair_client'
require 'webmock/rspec'
require 'fileutils'

RSpec.configure do |config|
  config.before(:all) do
    @client = BlockchairClient.new({currency: 'LTC'})
  end

  config.before(:each) do
    stub_request(:get, "https://api.blockchair.com/litecoin/dashboards/transaction/f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7").
      to_return(status: 200, body: File.read('./spec/fixtures/transaction.json'), headers: {})

    stub_request(:get, "https://api.blockchair.com/litecoin/dashboards/transactions/f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7,1dbf104e5de72bae75af472e3d9785cc919fbcb657d4f7e3afba5a7cb76ff19e").
      to_return(status: 200, body: File.read('./spec/fixtures/transactions.json'), headers: {})

    stub_request(:get, "https://api.blockchair.com/litecoin/dashboards/address/ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg").
      to_return(status: 200, body: File.read('./spec/fixtures/address.json'), headers: {})
  end
end
