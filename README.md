# Blockchair Client

__Blockchair Client__ is an interface to interact with Blockchair's API. Blockchair is a free blockchain explorer supporting a number of cryptos, including among others Bitcoin, BitcoinCash, BitcoinSV, Ethereum and Litecoin, even with Bech32 adresses.


## Installation

### Bundle and install the gem as a standalone

- Clone the repository
- Install Ruby 2.5.0
- Execute `bundle install`

## Configuration

You can pass multiple variables that will be used in the configuration.

### As an initializer

```ruby
BlockchairClient.configure do |config|
  config.currency  = 'LTC'
end
```


### Directly in the application Instance

You can also pass any of those options inline when loading an instance of BlockchairClient.

```ruby
  client = BlockchairClient.new({currency: 'LTC'})
```


### List of endpoints :

### Address ([docs](https://github.com/Blockchair/Blockchair.Support/blob/master/API_DOCUMENTATION_EN.md))

```ruby
  client.address(CRYPTO_ADDRESS).query
```

##### Address Transactions

```ruby
  client.address(CRYPTO_ADDRESS).transactions
```

##### Address Type

```ruby
client.address(CRYPTO_ADDRESS).type
```
##### Address Script_hex

```ruby
client.address(CRYPTO_ADDRESS).script_hex
```
##### Address Balance

```ruby
client.address(CRYPTO_ADDRESS).balance
```
##### Address Balance_usd

```ruby
client.address(CRYPTO_ADDRESS).balance_usd
```
##### Address Received

```ruby
client.address(CRYPTO_ADDRESS).received
```
##### Address Received_usd

```ruby
client.address(CRYPTO_ADDRESS).received_usd
```
##### Address Spent

```ruby
client.address(CRYPTO_ADDRESS).spent
```
##### Address Spent_usd

```ruby
client.address(CRYPTO_ADDRESS).spent_usd
```
##### Address Output_count

```ruby
client.address(CRYPTO_ADDRESS).output_count
```
##### Address Unspent_output_count

```ruby
client.address(CRYPTO_ADDRESS).unspent_output_count
```
##### Address First_seen_receiving

```ruby
client.address(CRYPTO_ADDRESS).first_seen_receiving
```
##### Address Last_seen_receiving

```ruby
client.address(CRYPTO_ADDRESS).last_seen_receiving
```
##### Address First_seen_spending

```ruby
client.address(CRYPTO_ADDRESS).first_seen_spending
```
##### Address Last_seen_spending

```ruby
client.address(CRYPTO_ADDRESS).last_seen_spending
```
##### Address Transaction_count

```ruby
client.address(CRYPTO_ADDRESS).transaction_count
```

### Transaction ([docs](https://github.com/Blockchair/Blockchair.Support/blob/master/API_DOCUMENTATION_EN.md))

```ruby
  client.transaction(CRYPTO_TX).query
```

##### Transaction confirmations

```ruby
  client.transaction(CRYPTO_TX).confirmations
```

##### Transaction Inputs

```ruby
  client.transaction(CRYPTO_TX).inputs
```

##### Transaction Outputs

```ruby
  client.transaction(CRYPTO_TX).outputs
```

##### Transaction Block_id

```ruby
client.transaction(CRYPTO_TX).block_id
```
##### Transaction Id

```ruby
client.transaction(CRYPTO_TX).id
```
##### Transaction Hash

```ruby
client.transaction(CRYPTO_TX).hash
```
##### Transaction Date

```ruby
client.transaction(CRYPTO_TX).date
```
##### Transaction Time

```ruby
client.transaction(CRYPTO_TX).time
```
##### Transaction Size

```ruby
client.transaction(CRYPTO_TX).size
```
##### Transaction Weight

```ruby
client.transaction(CRYPTO_TX).weight
```
##### Transaction Version

```ruby
client.transaction(CRYPTO_TX).version
```
##### Transaction Lock_time

```ruby
client.transaction(CRYPTO_TX).lock_time
```
##### Transaction Is_coinbase

```ruby
client.transaction(CRYPTO_TX).is_coinbase
```
##### Transaction Has_witness

```ruby
client.transaction(CRYPTO_TX).has_witness
```
##### Transaction Input_count

```ruby
client.transaction(CRYPTO_TX).input_count
```
##### Transaction Output_count

```ruby
client.transaction(CRYPTO_TX).output_count
```
##### Transaction Input_total

```ruby
client.transaction(CRYPTO_TX).input_total
```
##### Transaction Input_total_usd

```ruby
client.transaction(CRYPTO_TX).input_total_usd
```
##### Transaction Output_total

```ruby
client.transaction(CRYPTO_TX).output_total
```
##### Transaction Output_total_usd

```ruby
client.transaction(CRYPTO_TX).output_total_usd
```
##### Transaction Fee

```ruby
client.transaction(CRYPTO_TX).fee
```
##### Transaction Fee_usd

```ruby
client.transaction(CRYPTO_TX).fee_usd
```
##### Transaction Fee_per_kb

```ruby
client.transaction(CRYPTO_TX).fee_per_kb
```
##### Transaction Fee_per_kb_usd

```ruby
client.transaction(CRYPTO_TX).fee_per_kb_usd
```
##### Transaction Fee_per_kwu

```ruby
client.transaction(CRYPTO_TX).fee_per_kwu
```
##### Transaction Fee_per_kwu_usd

```ruby
client.transaction(CRYPTO_TX).fee_per_kwu_usd
```
##### Transaction Cdd_total

```ruby
client.transaction(CRYPTO_TX).cdd_total
```

### Transactions ([docs](https://github.com/Blockchair/Blockchair.Support/blob/master/API_DOCUMENTATION_EN.md))


```ruby
client.transactions(CRYPTO_TX1, CRYPTO_TX2).query
```

##### First Transaction Hash

```ruby
client.transaction(CRYPTO_TX)[0].tx_hash
```


##### Second Transaction Hash

```ruby
client.transaction(CRYPTO_TX)[1].tx_hash
```

The behaviour is the same as for `Transaction` for the rest of the cases.