module BlockchairClient
  module Endpoints
    class Transactions < Base
      def endpoint
        config.endpoint_url + '/transactions/' + param.join(',')
      end

      def set_attributes
        @attributes ||= RecursiveOpenStruct.new(reconstructed_transactions, recurse_over_arrays: true)
      end

      def inputs(tx_hash)
        query['data'][tx_hash]['inputs']
      end

      def outputs(tx_hash)
        query['data'][tx_hash]['outputs']
      end

      def confirmations(tx_hash)
        (query['context']['state'].to_i - attributes[tx_hash].block_id.to_i) + 1
      end

      def reconstructed_transactions
        transaction_ids = query['data'].keys
        transactions    = {}

        transaction_ids.each do |id|
          # Rename hash by tx_hash
          transaction            = query['data'][id]['transaction']
          transaction['tx_hash'] = transaction.delete('hash')

          transactions[id] = transaction
        end

        transactions
      end
    end
  end
end
