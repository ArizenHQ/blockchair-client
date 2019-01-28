require 'spec_helper'

describe 'BlockchairClient' do

  let(:parameters) {{ currency: 'LTC' }}
  subject { BlockchairClient::Application.new(parameters)  }

  context 'Transaction' do

    let(:response) { JSON.parse(File.read('./spec/fixtures/transaction.json')) }

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

    let(:tx_id) { 'f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7' }

    let(:transaction_results) { Hash[transaction_keys.zip(transaction_values)] }

    # Exceptionnally we put multiple expectations in one it, don't want to waste time refactoring here
    it 'Returns the good JSON response' do
      transaction_results.each do |transaction_key, transaction_value|
        expect(subject.transaction(tx_id).send(transaction_key)).to eq transaction_value
      end
    end
  end

  context 'Transactions' do

    let(:response) { JSON.parse(File.read('./spec/fixtures/transaction.json')) }

    let(:transaction_keys) { [
      "block_id", "id", "tx_hash", "date", "time", "size", "weight", "version", "lock_time",
      "is_coinbase", "has_witness", "input_count", "output_count", "input_total", "input_total_usd",
      "output_total", "output_total_usd", "fee","fee_usd", "fee_per_kb", "fee_per_kb_usd", "fee_per_kwu",
      "fee_per_kwu_usd", "cdd_total"
    ] }

    let(:first_transaction_values) { [
      1547846, 30048945, "f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7",
      "2018-12-22", "2018-12-22 09:34:42", 195, 452, 1, 0, false, true, 1, 1, 1685000000,
      510.361, 1684999652, 510.361, 348, 0.000105404, 1784.62, 0.000540533, 769.911, 0.000233194, 28.80608912037
    ] }

    let(:second_transaction_values) { [
      1546715, 30005706, "1dbf104e5de72bae75af472e3d9785cc919fbcb657d4f7e3afba5a7cb76ff19e",
      "2018-12-20", "2018-12-20 16:32:56", 416, 1016, 2, 1546695, false, true, 2, 2, 1917208600,
      557.466, 1917183100, 557.459, 25500, 0.00741463, 61298.1, 0.0178236, 25098.4, 0.00729787, 11.240574167269
    ] }

    let(:first_tx_id) { 'f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7' }
    let(:second_tx_id) { '1dbf104e5de72bae75af472e3d9785cc919fbcb657d4f7e3afba5a7cb76ff19e' }

    let(:first_transaction_results)  { Hash[transaction_keys.zip(first_transaction_values)]  }
    let(:second_transaction_results) { Hash[transaction_keys.zip(second_transaction_values)] }

    # Exceptionnally we put multiple expectations in one it, don't want to waste time refactoring here
    it 'Returns the good JSON response for the first transaction' do
      first_transaction_results.each do |transaction_key, transaction_value|
        expect(subject.transactions(first_tx_id, second_tx_id)[first_tx_id].send(transaction_key)).to eq transaction_value
      end
    end

    it 'Returns the good JSON response for the first transaction' do
      second_transaction_results.each do |transaction_key, transaction_value|
        expect(subject.transactions(first_tx_id, second_tx_id)[second_tx_id].send(transaction_key)).to eq transaction_value
      end
    end
  end

  context 'Address' do

    let(:response) { JSON.parse(File.read('./spec/fixtures/address.json')) }

    let(:address_keys) {  [
      "type", "script_hex", "balance", "balance_usd", "received", "received_usd", "spent", "spent_usd",
      "output_count", "unspent_output_count", "first_seen_receiving", "last_seen_receiving", "first_seen_spending",
      "last_seen_spending", "transaction_count"
    ] }

    let(:address_values) { [
      "witness_v0_scripthash", "00143be606d22d0fcb0791686f76e170e8bac837d979", 0, 0, 1685000000, 489.9473, 1685000000, 510.3608, 1, 0,
      "2018-12-20 16:32:56", "2018-12-20 16:32:56", "2018-12-22 09:34:42", "2018-12-22 09:34:42", 2
    ] }

    let(:address) {'ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg' }
    let(:addresses_results) { Hash[address_keys.zip(address_values)] }

    # Exceptionnally we put multiple expectations in one it, don't want to waste time refactoring here
    it 'Returns the good JSON response' do
      addresses_results.each do |address_key, address_value|
        expect(subject.address(address).send(address_key)).to eq address_value
      end
    end
  end
end
