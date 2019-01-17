require 'spec_helper'

describe 'Configuration' do

  let(:config) { BlockchairClient.config }

  let(:default_params) {{ currency: 'LTC' }}

  subject { BlockchairClient::Application.new(default_params)  }

  context 'Passes correct parameters' do
    expect(application.config.currency).to eq('LTC')
  end

  it 'has a version number' do
    expect(BlockchairClient::VERSION).not_to be nil
  end
end
