# SeoNoindex

Add noindex tag in head for disallowed paths from robots.txt file

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

## Example

For example in robots.txt we have this string:

    Disallow: /admin

And if we follow **https://sitename/admin** we get this:

    <meta name="robots" content="noindex">
