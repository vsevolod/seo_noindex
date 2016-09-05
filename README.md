# SeoNoindex

Add noindex tag for disallowed paths in robots.txt file

## Installation

Add this line to your application's Gemfile:

    gem 'seo_noindex'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install seo_noindex

If you're not running Rails, you'll have to add the middleware to your config.ru:

    require 'seo_noindex'
    use SeoNoindex::Middleware

Add helper to your view file in head section

    <header>
      <%= robots_noindex_tag -%>
    </header>
