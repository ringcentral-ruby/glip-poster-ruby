Glip Poster
===========

[![Gem Version][gem-version-svg]][gem-version-link]
[![Build Status][build-status-svg]][build-status-link]
[![Coverage Status][coverage-status-svg]][coverage-status-link]
[![Dependency Status][dependency-status-svg]][dependency-status-link]
[![Codacy Badge][codacy-svg]][codacy-link]
[![Code Climate][codeclimate-status-svg]][codeclimate-status-link]
[![Scrutinizer Code Quality][scrutinizer-status-svg]][scrutinizer-status-link]
[![Downloads][downloads-svg]][downloads-link]
[![Docs][docs-rubydoc-svg]][docs-rubydoc-link]
[![License][license-svg]][license-link]

`glip-poster` is a simple gem to make your integration with Glip (https://glip.com/) easier. It supports only incoming communications (from you to Glip).

## Installation

### Via Bundler

Add `glip-poster` to your `Gemfile` and then run `bundle`:

```sh
$ echo "gem 'glip-poster'" >> Gemfile
$ bundle
```

### Via RubyGems

```sh
$ gem install glip-poster
```

## Glip setup

This gem uses an incoming webhook integration on Glip. To create a new Glip webhook integration, in Glip.com, click on "Integrations" in the left column and then select the "Glip Webhooks" integration. After you select a conversation, a webhook URL will be presented which you will use with this gem to post messages to. The URL looks like the following:

```http
https://hooks.glip.com/webhook/11112222-3333-4444-5555-666677778888
```

## Usage

Initialize your poster and then call the `send_message` method to send your message. You must supply the webhook URL or webhook ID configured in the desired "Glip Webhooks" integration.

```ruby
require 'glip_poster' # note underscore

poster = Glip::Poster.new(YOUR_WEBHOOK_URL) # or YOUR_WEBHOOK_ID (GUID)
poster.send_message('Hi there!') # Faraday::Response
```

You can send text in Markdown:

```ruby
poster.send_message("* Location: [The Funky Buddha Lounge](http://www.thefunkybuddha.com)\n*Beer Advocate Rating: [99](http://tinyurl.com/psf4uzq)")
```

You can use an options array if you don't want to use the default settings.

```ruby
options = {
  icon: 'http://example.com/icon.png',
  activity: 'Activity Alert',
  title: 'A New Incoming Message Has Been Received'
}
poster.send_message('Hi there!', options)
```

You can preset your options:

```ruby
poster = Glip::Poster.new(YOUR_WEBHOOK_URL)
poster.options[:icon] = 'http://example.com/icon.png'
poster.options = {icon: 'http://example.com/icon.png'}
poster.send_message('Hi there!')
```

## Supported Ruby Versions

This library supports and is [tested against](https://travis-ci.org/ringcentral-ruby/glip-poster-ruby) the following Ruby implementations:

1. Ruby 2.3.0
2. Ruby 2.2.0
3. Ruby 2.1.0
4. Ruby 2.0.0
5. Ruby 1.9.3
6. [JRuby](http://jruby.org/)
7. [Rubinius](http://rubinius.com/)

## Releases

Releases with release notes are availabe on [GitHub releases](https://github.com/ringcentral-ruby/glip-poster-ruby/releases). Release notes include a high level description of the release as well as lists of non-breaking and breaking changes.

### Change Log

See [CHANGELOG.md](CHANGELOG.md)

## Links

Project Repo

* https://github.com/ringcentral-ruby/glip-poster-ruby

Glip

* https://glip.com

## Contributing

1. Fork it ( http://github.com/ringcentral-ruby/glip-poster-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

 [gem-version-svg]: https://badge.fury.io/rb/glip-poster.svg
 [gem-version-link]: http://badge.fury.io/rb/glip-poster
 [downloads-svg]: http://ruby-gem-downloads-badge.herokuapp.com/glip-poster
 [downloads-link]: https://rubygems.org/gems/glip-poster
 [build-status-svg]: https://api.travis-ci.org/ringcentral-ruby/glip-poster-ruby.svg?branch=master
 [build-status-link]: https://travis-ci.org/ringcentral-ruby/glip-poster-ruby
 [coverage-status-svg]: https://coveralls.io/repos/ringcentral-ruby/glip-poster-ruby/badge.svg?branch=master
 [coverage-status-link]: https://coveralls.io/r/ringcentral-ruby/glip-poster-ruby?branch=master
 [dependency-status-svg]: https://gemnasium.com/ringcentral-ruby/glip-poster-ruby.svg
 [dependency-status-link]: https://gemnasium.com/ringcentral-ruby/glip-poster-ruby
 [codacy-svg]: https://api.codacy.com/project/badge/Grade/2e50acdacece4f28bb239bd87a8ca6fd
 [codacy-link]: https://www.codacy.com/app/grokify/glip-poster-ruby
 [codeclimate-status-svg]: https://codeclimate.com/github/ringcentral-ruby/glip-poster-ruby/badges/gpa.svg
 [codeclimate-status-link]: https://codeclimate.com/github/ringcentral-ruby/glip-poster-ruby
 [scrutinizer-status-svg]: https://scrutinizer-ci.com/g/ringcentral-ruby/glip-poster-ruby/badges/quality-score.png?b=master
 [scrutinizer-status-link]: https://scrutinizer-ci.com/g/ringcentral-ruby/glip-poster-ruby/?branch=master
 [docs-rubydoc-svg]: https://img.shields.io/badge/docs-rubydoc-blue.svg
 [docs-rubydoc-link]: http://www.rubydoc.info/gems/glip-poster/
 [license-svg]: https://img.shields.io/badge/license-MIT-blue.svg
 [license-link]: https://github.com/ringcentral-ruby/glip-poster-ruby/blob/master/LICENSE.txt
