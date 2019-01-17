require 'spec_helper'

describe 'BlockchairClient' do
  context 'Transaction' do

    let(:query_parameters)  {{
                              currency: 'LTC'
                            }}

    let(:response) {
      JSON.parse(open('fixtures/transaction.json'))
    }

    pending 'Has the good JSON query parameters' do
    end

    pending 'Returns the good JSON response' do
    end
  end

  context 'Address' do

    let(:query_parameters)  {{
                              currency: 'LTC'
                            }}

    let(:response) {
      JSON.parse(open('fixtures/address.json'))
    }

    pending 'Has the good JSON query parameters' do
    end

    pending 'Returns the good JSON response' do
    end
  end
end
