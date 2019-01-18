require 'spec_helper'

describe 'Configuration' do

  let(:config) { BlockchairClient.config }

  let(:params) {{ currency: 'LTC' }}

  subject { BlockchairClient::Application.new(params)  }

  it 'Passes correct parameters' do
    expect(subject.config.currency).to eq('LTC')
  end

  it 'has a version number' do
    expect(BlockchairClient::VERSION).not_to be nil
  end
end
