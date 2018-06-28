# Maxmind::GeoIp

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/maxmind/geo_ip`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'maxmind-geo_ip'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install maxmind-geo_ip

## Usage

### Setup

Assuming you already have an account with Maxmind, you'll first need to login, make a note of your user ID and your license key.

In `config/initializers/maxmind-geo-ip.rb`

```ruby
Maxmind::GeoIp.configure do |config|
  # Mandatory
  config.user_id = "USER_ID"
  config.license = "LICENCE_KEY"
  config.host = "https://geoip.maxmind.com/"

  # Optional
  config.version = '2.2'  # Defaults to 2.1
  config.debug = true     # Defaults to false
end
```

### Methods

* **Country by IP address**:
  `Maxmind::GeoIp.lookup_country_by_ip('82.10.114.252')` => `"United Kingdom"`
* **Continent by IP address**:
  `Maxmind::GeoIp.lookup_continent_by_ip('82.10.114.252')` => `"Europe"`



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/maxmind-geo_ip. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Maxmind::GeoIp project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/maxmind-geo_ip/blob/master/CODE_OF_CONDUCT.md).
