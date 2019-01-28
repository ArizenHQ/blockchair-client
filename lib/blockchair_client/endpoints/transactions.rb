module BlockchairClient
  module Endpoints
    class Transactions < Base
      def endpoint
        config.endpoint_url + '/transactions/' + param.join(',')
      end

      def set_attributes
        @attributes ||= RecursiveOpenStruct.new(reconstructed_transactions, recurse_over_arrays: true)
      end

      def inputs(index)
        query['data'][param]['inputs']
      end

      def outputs(index)
        query['data'][param]['outputs']
      end

      def confirmations(index)
        (query['context']['state'].to_i - attributes(index).block_id.to_i)
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
