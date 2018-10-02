# AemetOpendata

[![Gem Version](https://badge.fury.io/rb/aemet_opendata.svg)](https://rubygems.org/gems/aemet_opendata)
[![Build Status](https://travis-ci.org/noloman/aemet_opendata.svg?branch=master)](https://travis-ci.org/noloman/aemet_opendata)
[![Code Climate](https://codeclimate.com/github/noloman/aemet_opendata/badges/gpa.svg)](https://codeclimate.com/github/noloman/aemet_opendata)

### Información elaborada por la [Agencia Estatal de Meteorología](https://www.aemet.es)

Gem that fetches meteorological information from https://opendata.aemet.es, the OpenData web portal from spanish meteorological agency, [AEMET](https://www.aemet.es)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aemet_opendata'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aemet_opendata

## Usage

First, you need to have a valid API key for making requests. Just go to https://opendata.aemet.es/centrodedescargas/altaUsuario and get one.

Once you have a valid API key, you can enter it as in the following example:
```
AemetOpendata.configure do |config|
  config.api_key = 'api-key'
end
```
Then after you have entered your API key, just `AemetOpendata.fetch_city(city_name)` where `city_name` is the name of the city you want to fetch.
The result should be something similar to:
```
[ 
{
  "idema" : "5783",
  "lon" : -5.879167,
  "fint" : "2018-09-28T13:00:00",
  "prec" : 0.0,
  "alt" : 34.0,
  "vmax" : 7.2,
  "vv" : 3.3,
  "dv" : 100.0,
  "lat" : 37.416668,
  "dmax" : 120.0,
  "ubi" : "SEVILLA/SAN PABLO",
  "pres" : 1013.6,
  "hr" : 36.0,
  "stdvv" : 0.9,
  "ts" : 35.1,
  "pres_nmar" : 1017.1,
  "tamin" : 29.7,
  "ta" : 31.4,
  "tamax" : 31.6,
  "tpr" : 14.5,
  "stddv" : 20.0,
  "inso" : 54.0
},
]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/noloman/aemet_opendata. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AemetOpendata project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/aemet_opendata/blob/master/CODE_OF_CONDUCT.md).
