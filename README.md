# Paperclip::Rack

[![Gem Version](https://badge.fury.io/rb/paperclip-rack.png)](https://rubygems.org/gems/paperclip-rack)
[![Build Status](https://travis-ci.org/t-k/paperclip-rack.png)](https://travis-ci.org/t-k/paperclip-rack)

If your using paperclip on Non-Rails Rack application (e.g. Sinatra) and getting an error on standard file uploading('Paperclip::AdapterRegistry::NoHandlerError'), you should try this gem.

Paperclip::Rack adds a custom Paperclip FileAdapter to handle file uploading on Rack.

## Installation

Add 'include Paperclip::Glue' to your model

Add this line to your application's Gemfile:

    gem 'paperclip-rack', require: 'paperclip/rack'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperclip-rack

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
