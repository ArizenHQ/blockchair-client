$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'blockchair_client'
require 'webmock/rspec'
require 'fileutils'

RSpec.configure do |config|
  config.before(:all) do
    @private_client =  BlockchairClient.new(endpoint_url: 'https://sandbox.blockchair.net', api_token: 'abcd').private
  end

  config.before(:each) do

    stub_request(:post, "https://sandbox.blockchair.net/request_for_quote/").
      with(
        body: "client_rfq_id=d779f888-d2e6-499c-92f1-d62c4c85f81b&quantity=5&side=buy&instrument=BTCUSD.SPOT",
        headers: {
        'Authorization'=>'Token abcd'
        }).
      to_return(status: 200, body:
                '{"valid_until": "2017-01-01T19:45:22.025464Z",
                  "rfq_id": "d4e41399-e7a1-4576-9b46-349420040e1a",
                  "client_rfq_id": "149dc3e7-4e30-4e1a-bb9c-9c30bd8f5ec7",
                  "quantity": "1.0000000000",
                  "side": "buy",
                  "instrument": "BTCUSD.SPOT",
                  "price": "700.00000000",
                  "created": "2018-02-06T16:07:50.122206Z"}', headers: {})

    stub_request(:get, "https://sandbox.blockchair.net/balance/").
      with(
        headers: {
        'Authorization'=>'Token abcd'
        }).
      to_return(status: 200, body:
                '{"USD": "0",
                  "BTC": "0",
                  "JPY": "0",
                  "GBP": "0",
                  "ETH": "0",
                  "EUR": "0",
                  "CAD": "0",
                  "LTC": "0",
                  "XRP": "0",
                  "BCH": "0"}', headers: {})

    stub_request(:get, "https://sandbox.blockchair.net/instruments/").
      with(
        headers: {
        'Authorization'=>'Token abcd'
        }).
      to_return(status: 200, body:
                '[{ "name": "BTCUSD.CFD" },
                  { "name": "BTCUSD.SPOT" },
                  { "name": "BTCEUR.SPOT" },
                  { "name": "BTCGBP.SPOT" },
                  { "name": "ETHBTC.SPOT" },
                  { "name": "ETHUSD.SPOT" },
                  { "name": "LTCUSD.SPOT" },
                  { "name": "XRPUSD.SPOT" },
                  { "name": "BCHUSD.SPOT" }]', headers: {})

    stub_request(:post, "https://sandbox.blockchair.net/trade/").
      with(
        body: "rfq_id=d779f888-d2e6-499c-92f1-d62c4c85f81b&quantity=5&side=buy&instrument=BTCUSD.SPOT&price=3999.99000000",
        headers: {
        'Authorization'=>'Token abcd'
        }).
      to_return(status: 200, body:
                '{"valid_until": "2017-01-01T19:45:22.025464Z",
                  "rfq_id": "d4e41399-e7a1-4576-9b46-349420040e1a",
                  "client_rfq_id": "149dc3e7-4e30-4e1a-bb9c-9c30bd8f5ec7",
                  "quantity": "1.0000000000",
                  "side": "buy",
                  "instrument": "BTCUSD.SPOT",
                  "price": "700.00000000",
                  "created": "2018-02-06T16:07:50.122206Z"}', headers: {})

  end

end
