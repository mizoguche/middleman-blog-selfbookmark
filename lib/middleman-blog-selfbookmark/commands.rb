require 'middleman-cli'
require 'middleman-blog/uri_templates'

module Middleman
  module Cli
    class Selfbookmark < ::Thor::Group
      include Thor::Actions
      include Middleman::Blog::UriTemplates

      check_unknown_options!

      namespace :tweet

      def self.exit_on_failure?
        true
      end

      def selfbookmark
        env = options[:environment].to_s.to_sym
        verbose = options[:verbose] ? 0 : 1
        instrument = options[:instrument]

        ::Middleman::Blog::Selfbookmark.app = ::Middleman::Application.new do
          config[:mode] = :build
          config[:environment] = env
          ::Middleman::Logger.singleton(verbose, instrument)
        end

        ::Middleman::Blog::Selfbookmark.selfbookmark
      end
    end

    Base.register(Middleman::Cli::Selfbookmark, 'selfbookmark', 'selfbookmark', 'Create bookmark of latest article')
  end
end
