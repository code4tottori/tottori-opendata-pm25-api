# Tottori OpenData PM2.5 API

[![Gem Version](https://badge.fury.io/rb/tottori-opendata-pm25-api.svg)](https://badge.fury.io/rb/tottori-opendata-pm25-api)

This API gets data which is the concentration of PM2.5 (fine particulate matter) in the atmosphere in Tottori Prefecture, Japan from http://tottori-taiki.users.tori-info.co.jp/taiki/pc/graph/ as Open Data licensed [CC-BY](https://creativecommons.org/licenses/by/2.1/jp/).

## Installation


```bash
$ gem install tottori-opendata-pm25-api
```

## Usage

CLI:

```bash
$ tottori-opendata-pm25-api | jq . | head
[
  {
    "name": "県庁西町分庁舎",
    "values": [
      {
        "time": "2017-01-23T00:00:00.000+09:00",
        "value": 9
      },
      {
        "time": "2017-01-23T01:00:00.000+09:00",
```

API:

```ruby
require 'tottori-opendata-pm25-api'
require 'time'
require 'json'
require 'active_support/json'

ActiveSupport::JSON::Encoding.use_standard_json_time_format = true
puts Tottori::OpenData::PM25::API.get(Time.now).to_json
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
