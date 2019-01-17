require 'spec_helper'

describe 'Configuration' do

  let(:config) { BlockchairClient.config }

  let(:default_params) {{ endpoint_url: 'https://sandbox.blockchair.net', api_token: 'abcd' }}

  it 'Passes correct parameters' do
    application = BlockchairClient::Application.new(default_params)

    default_params.each do |param|
      expect(application.config.send(param.first)).to eq(param.last)
    end
  end

  it 'has a version number' do
    expect(BlockchairClient::VERSION).not_to be nil
  end
end
