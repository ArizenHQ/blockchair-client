require 'spec_helper'

describe 'BlockchairClient' do

  let(:query_parameters)  {{ currency: 'LTC' }}
  subject { BlockchairClient::Application.new(default_params)  }

  context 'Transaction' do

    let(:response) { JSON.parse(open('fixtures/transaction.json')) }

    let(:transaction_keys) { [
      "block_id", "id", "hash", "date", "time", "size", "weight", "version", "lock_time",
      "is_coinbase", "has_witness", "input_count", "output_count", "input_total", "input_total_usd",
      "output_total", "output_total_usd", "fee","fee_usd", "fee_per_kb", "fee_per_kb_usd", "fee_per_kwu",
      "fee_per_kwu_usd", "cdd_total"
    ] }

    let(:transaction_values) { [
      1547846, 30048945, "f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7",
      "2018-12-22", "2018-12-22 09:34:42", 195, 452, 1, 0, false, true, 1, 1, 1685000000,
      510.361, 1684999652, 510.361, 348, 0.000105404, 1784.62, 0.000540533, 769.911, 0.000233194, 28.80608912037
    ] }

    let(:transaction_results) { Hash[transaction_keys.zip(transaction_values)] }

    transaction_results.each do |transaction_key, transaction_value|
      it 'Returns the good JSON response' do
        expect(subject.transaction.send(transaction_key)).to eq transaction_value
      end
    end
  end

  context 'Address' do

    let(:response) { JSON.parse(open('fixtures/address.json')) }

    let(:address_keys) {  [
      "type", "script_hex", "balance", "balance_usd", "received", "received_usd", "spent", "spent_usd",
      "output_count", "unspent_output_count", "first_seen_receiving", "last_seen_receiving", "first_seen_spending",
      "last_seen_spending", "transaction_count"
    ] }

    let(:address_values) { [
      "witness_v0_scripthash", "00143be606d22d0fcb0791686f76e170e8bac837d979", 0, 0, 1685000000, 489.9473, 1685000000, 510.3608, 1, 0,
      "2018-12-20 16:32:56", "2018-12-20 16:32:56", "2018-12-22 09:34:42", "2018-12-22 09:34:42", 2
    ] }

    let(:addresses_result) { Hash[transaction_keys.zip(transaction_values)] }

    transaction_results.each do |transaction_key, transaction_value|
      it 'Returns the good JSON response for #{transaction_key}' do
        expect(subject.transaction.send(transaction_key)).to eq transaction_value
      end
    end
  end
end
