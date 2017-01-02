# Middleman::Blog::Selfbookmark
Create hatena bookmark on new post created.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'middleman-blog-selfbookmark'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-blog-selfbookmark

## Usage
### Get OAuth token
[kkosuge/hatena-bookmark: ε=ε=ε=ε=(/･_･)/](https://github.com/kkosuge/hatena-bookmark)

### Add configuration to config.rb
```ruby
require 'middleman/blog/selfbookmark'
activate :blog_selfbookmark do |bookmark|
  bookmark.consumer_key          = ENV['BOOKMARK_CONSUMER_KEY']         # required
  bookmark.consumer_secret       = ENV['BOOKMARK_CONSUMER_SECRET']      # required
  bookmark.request_token         = ENV['BOOKMARK_REQUEST_TOKEN']        # required
  bookmark.request_token_secret  = ENV['BOOKMARK_REQUEST_TOKEN_SECRET'] # required
  bookmark.hostname              = 'http://example.com'                 # required
  bookmark.comment               = ENV['BOOKMARK_COMMENT']              # default: ''
  bookmark.add_tags              = false                                # default: true
  bookmark.new_article_threshold = 3.hour                               # default: 1.hour 
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

