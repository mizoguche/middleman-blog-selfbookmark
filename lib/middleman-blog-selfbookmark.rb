require 'middleman-core'
require 'middleman-blog-selfbookmark/commands'
require 'middleman/blog/selfbookmark'

Middleman::Extensions.register :blog_selfbookmark do
  require "middleman-blog-selfbookmark/extension"
  ::Middleman::Blog::SelfbookmarkExtension
end