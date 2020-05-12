# Shelterluv

This gem was created for the PIBA Foundation in St. Petersburg, Florida.
The main use for this gem is for any shelter to use ShelterLuv and extract the information required for populating website and animal information. 

`bin/executable` will run Cli.rb and start a new session for the ShelterLuv PIBA Foundation Database.
Please note, as of V. 0.1.0 there are still some notable bugs. 

To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shelterluv'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install shelterluv

## Usage

In API.RB
```
request["x-api-key"] = #place API key here
```
The artii gem will display ascii words. 
    
    $ variable = Artii::Base.new
    $ puts variable.asciify('WORD OR WORDS TO DISPLAY')

See artii documentation for more details: https://github.com/miketierney/artii

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at hhttps://github.com/joshpled/CLI_Project_PIBA. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/joshpled/CLI_Project_PIBA/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Shelterluv project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/joshpled/CLI_Project_PIBA/blob/master/CODE_OF_CONDUCT.md).
