require "middleman/blog/selfbookmark/version"
require 'hatena-bookmark'

module Middleman
  module Blog
    module Selfbookmark
      class << self
        attr_reader :app

        def selfbookmark
          @app ||= ::Middleman::Application.new

          blog_extension = @app.extensions[:blog].values.first
          latest_article = blog_extension.data.articles.select{ |a| a.published? }.first
          return unless should_bookmark(latest_article)

          tag = settings.add_tags ? latest_article.data.tags.map{|t| "[#{t}]"}.join : ''
          client.create(url: "#{settings.hostname}#{latest_article.url}", comment: "#{tag}#{settings.comment}")
        end

        def app=(app)
          @app = app
        end

        private

        def settings
          @app.extensions[:blog_selfbookmark].options
        end

        def client
          Hatena::Bookmark.new(
              consumer_key:    settings.consumer_key,
              consumer_secret: settings.consumer_secret,
              request_token:   settings.request_token,
              request_secret:  settings.request_token_secret
          )
        end

        def should_bookmark(latest_article)
          (latest_article.date > DateTime.now.ago(settings.new_article_threshold)) && latest_article.published?
        end
      end
    end
  end
end
