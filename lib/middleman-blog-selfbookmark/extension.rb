require 'middleman-core'
require 'middleman/blog/selfbookmark'
require 'active_support'
require 'active_support/core_ext'

module Middleman
  module Blog
    class SelfbookmarkExtension < ::Middleman::Extension
      option :consumer_key, nil, 'Hatena Bookmark consumer key'
      option :consumer_secret, nil, 'Hatena Bookmark consumer secret'
      option :request_token, nil, 'Hatena Bookmark request token'
      option :request_token_secret, nil, 'Hatena Bookmark request token secret'
      option :hostname, nil, 'Your site hostname'
      option :comment, '', 'Bookmark comment'
      option :new_article_threshold, 1.hour, 'Threshold if latest article'

      attr_reader :options

      def initialize(app, options_hash={}, &block)
        super

        @options = options
      end
    end
  end
end
