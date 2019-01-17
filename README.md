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
  BlockchairClient.new({currency: 'LTC'})
```

## Usage

```bash
$ bundle console
```

```ruby
  params = {endpoint_url: 'your_endpoint_url', api_token: 'your_api_token'}
  client = BlockchairClient.new(params).private
```

Where `params` is , the hash of the possible environment variables.

### List of endpoints :

#### Address ([docs](https://github.com/Blockchair/Blockchair.Support/blob/master/API_DOCUMENTATION_EN.md))

```ruby
  client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg')
```

##### Address Transactions

```ruby
  client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').transactions
```

##### Address Type

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').type
```
##### Address Script_hex

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').script_hex
```
##### Address Balance

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').balance
```
##### Address Balance_usd

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').balance_usd
```
##### Address Received

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').received
```
##### Address Received_usd

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').received_usd
```
##### Address Spent

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').spent
```
##### Address Spent_usd

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').spent_usd
```
##### Address Output_count

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').output_count
```
##### Address Unspent_output_count

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').unspent_output_count
```
##### Address First_seen_receiving

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').first_seen_receiving
```
##### Address Last_seen_receiving

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').last_seen_receiving
```
##### Address First_seen_spending

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').first_seen_spending
```
##### Address Last_seen_spending

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').last_seen_spending
```
##### Address Transaction_count

```ruby
client.address('ltc1q80nqd53dpl9s0ytgdamwzu8ghtyr0ktespxgpg').transaction_count
```

#### Transaction ([docs](https://github.com/Blockchair/Blockchair.Support/blob/master/API_DOCUMENTATION_EN.md))

```ruby
  client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7')
```

##### Transaction Inputs

```ruby
  client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').inputs
```

##### Transaction Outputs

```ruby
  client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').outputs
```

##### Transaction Block_id

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').block_id
```
##### Transaction Id

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').id
```
##### Transaction Hash

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').hash
```
##### Transaction Date

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').date
```
##### Transaction Time

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').time
```
##### Transaction Size

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').size
```
##### Transaction Weight

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').weight
```
##### Transaction Version

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').version
```
##### Transaction Lock_time

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').lock_time
```
##### Transaction Is_coinbase

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').is_coinbase
```
##### Transaction Has_witness

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').has_witness
```
##### Transaction Input_count

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').input_count
```
##### Transaction Output_count

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').output_count
```
##### Transaction Input_total

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').input_total
```
##### Transaction Input_total_usd

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').input_total_usd
```
##### Transaction Output_total

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').output_total
```
##### Transaction Output_total_usd

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').output_total_usd
```
##### Transaction Fee

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').fee
```
##### Transaction Fee_usd

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').fee_usd
```
##### Transaction Fee_per_kb

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').fee_per_kb
```
##### Transaction Fee_per_kb_usd

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').fee_per_kb_usd
```
##### Transaction Fee_per_kwu

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').fee_per_kwu
```
##### Transaction Fee_per_kwu_usd

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').fee_per_kwu_usd
```
##### Transaction Cdd_total

```ruby
client.transaction('f40ac4440a6d989fdaae01701885446905380aa2d233ffeba1934c59dd4168a7').cdd_total
```
